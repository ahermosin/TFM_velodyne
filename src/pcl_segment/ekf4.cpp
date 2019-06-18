//  Created on: Jul 29, 2013
//      Author: pdelapuente

#include <ros/ros.h>
#include <time.h>
#include <math.h>
#include <assert.h>
#include <tf/tf.h>
#include <tf/LinearMath/Matrix3x3.h>
#include <tf_conversions/tf_eigen.h>
#include <tf/transform_broadcaster.h>
#include <visualization_msgs/Marker.h>
#include "geometry_msgs/PoseStamped.h"
#include <geometry_msgs/PoseArray.h>
#include "pugixml.hpp"
#include <pcl_segment/positionRPY.h>
#include <pcl_segment/observationRPY.h>
#include <lcm_to_ros/can_coche_direccion.h>
#include <lcm_to_ros/can_coche_velocidad.h>
#include <Eigen/Eigen>
#include <Eigen/Dense>
#include <fstream>
#include <iostream>
#include "tinyxml2.h"
#include "customFunctions.h"

//init, pred y actualiz

using namespace Eigen;
typedef Eigen::Matrix<float, 5, 5> Matrix5f;
typedef Eigen::Matrix<float, 6, 6> Matrix6f;
typedef Eigen::Matrix<float, 5, 1> Vector5f;
typedef Eigen::Matrix<float, 6, 1> Vector6f;

float mahalanobisDistanceThreshold;

geometry_msgs::PoseStamped poseOdom;
geometry_msgs::PoseStamped incOdom;
geometry_msgs::PoseArray verticalElements;
pcl_segment::positionRPY incPositionOdom;

float_t vel;
float_t dir, turnRate, angleOffset;

void callback_vel(const lcm_to_ros::can_coche_velocidad input_vel)
{
  vel = input_vel.velocidad/3.6; //from km/h to m/s
}


void callback_dir(const lcm_to_ros::can_coche_direccion input_dir)
{
  ros::param::get("angleOffset", angleOffset); // debugging
  ros::param::get("turnRate", turnRate);
  dir = ((input_dir.angulo_volante - angleOffset)/turnRate)*3.141592/180.0; //from degrees to rads
}

void callback_ve(const geometry_msgs::PoseArray input_ve)
{
  verticalElements = input_ve;
}

void callback_incOdom(const geometry_msgs::PoseStamped input_incOdom)
{
  incOdom = input_incOdom;
//  std::cout << "RECEIVED INCODOM:" << std::endl << incOdom << std::endl;
}

void callback_poseOdom(const geometry_msgs::PoseStamped input_poseOdom)
{
  poseOdom = input_poseOdom;
//  std::cout << "RECEIVED INCODOM:" << std::endl << incOdom << std::endl;
}





int 
main (int argc, char** argv)
{
  ros::init(argc, argv, "ekf");
  ros::NodeHandle nh;
  ros::Subscriber sub_ve = nh.subscribe ("/PoseArray_ve", 1, callback_ve);
  ros::Subscriber sub_incOdom = nh.subscribe ("/incOdom", 1, callback_incOdom);
  ros::Subscriber sub_poseOdom = nh.subscribe ("/poseOdom", 1, callback_poseOdom);
  ros::Subscriber sub_vel = nh.subscribe ("/lcm_to_ros/CAN_COCHE_VELOCIDAD", 1, callback_vel);
  ros::Subscriber sub_dir = nh.subscribe ("/lcm_to_ros/CAN_COCHE_DIRECCION", 1, callback_dir);
//  ros::Subscriber sub_incPositionOdom = nh.subscribe ("/incPositionOdom", 1, callback_incPositionOdom);
  ros::Publisher pub_ekf = nh.advertise<visualization_msgs::Marker>("pose_filtered", 1); // debugging
  ros::Publisher pub_ekfPoseOdom = nh.advertise<geometry_msgs::PoseStamped>("ekfPoseOdom", 1); // debugging
  ros::Publisher pub_ekfPred = nh.advertise<geometry_msgs::PoseStamped>("pose_predicted", 1); // debugging
  ros::Publisher pub_ekfCorr = nh.advertise<geometry_msgs::PoseStamped>("pose_corrected", 1); // debugging
  ros::Publisher pub_ekfIncOdom = nh.advertise<geometry_msgs::PoseStamped>("ekfIncOdom", 1); // debugging
  ros::Publisher pub_ekfIncOdom2 = nh.advertise<geometry_msgs::PoseStamped>("ekfIncOdom2", 1); // debugging
  ros::Publisher pub_ekfIncOdomRPY = nh.advertise<pcl_segment::positionRPY>("ekfIncOdomRPY", 1); // debugging
  ros::Publisher pub_ekfPosition = nh.advertise<pcl_segment::positionRPY>("ekfPosition", 1); // debugging
  ros::Publisher pub_ekfStrip = nh.advertise<visualization_msgs::Marker>("ekf_strip", 1); // debugging
  float loopRate = 100.0;
  ros::Rate loop_rate(loopRate);
  ros::Time initTime = ros::Time::now();
  ros::Time currentTime, pastTime;
  
  /*INITIALIZATION*/  
  geometry_msgs::PoseStamped poseZero;
  geometry_msgs::PoseStamped poseEKF;
  geometry_msgs::PoseStamped posePredEKF;
  geometry_msgs::PoseStamped poseCorrEKF;
  geometry_msgs::PoseStamped incOdom2;
  geometry_msgs::PoseStamped incOdom2Prev;
  geometry_msgs::PoseStamped incOdomPrev;

  pcl_segment::positionRPY positionZero;
  pcl_segment::positionRPY positionEKF;
  pcl_segment::positionRPY incOdomEKF;
  pcl_segment::positionRPY incOdomEKFPrev;  
  pcl_segment::positionRPY positionPredEKF;
  pcl_segment::positionRPY positionCorrEKF;
  pcl_segment::positionRPY sigma_odom;
  pcl_segment::positionRPY sigma_obs;
  
  Matrix <bool, 4, 6> B; // Binding matrix for EKF

  geometry_msgs::Point ekfPoint;
  visualization_msgs::Marker ekfStrip;

  tf::TransformBroadcaster br;
  tf::StampedTransform transform_ekf(tf::Transform::getIdentity(), initTime, "map", "ekf"); // Initialization;

  tf::Quaternion quat;
  
  bool tfEKF;
  
  poseZero.pose.position.x = 0.0;
  poseZero.pose.position.y = 0.0;
  poseZero.pose.position.z = 0.0;
  poseZero.pose.orientation.x = 0.0;
  poseZero.pose.orientation.y = 0.0;
  poseZero.pose.orientation.z = 0.0;
  poseZero.pose.orientation.w = 1.0;
  poseZero.header.stamp = initTime;
  poseZero.header.frame_id = "map";
  
  poseEKF = poseZero;// poseEKF init
  posePredEKF = poseZero; // posePredEKF init
  poseCorrEKF = poseZero; // poseCorrEKF init
  incOdomPrev = poseZero; // incOdomPrev init
  incOdom = poseZero; // incOdom init
  incOdom2 = poseZero; // incOdom2 init
  incOdom2Prev = poseZero; // incOdom2OPrev init
  
  positionZero.x = 0.0;
  positionZero.y = 0.0;
  positionZero.z = 0.0;
  positionZero.roll = 0.0;
  positionZero.pitch = 0.0;
  positionZero.yaw = 0.0;
  
  positionEKF = positionZero; // position init
  incOdomEKF = positionZero;  // incOdomEKF init
  incOdomEKFPrev = positionZero; // incOdomEKFPrev init
  positionPredEKF = positionZero; // positionPredEKF init
  positionCorrEKF = positionZero; // positionCorrEKF init
  
  sigma_odom.x = 0.5;
  sigma_odom.y = 0.5;
  sigma_odom.z = 0.5;
  sigma_odom.roll = 0.1;
  sigma_odom.pitch = 0.1;
  sigma_odom.yaw = 0.1; // odometry sigmas
  
  sigma_obs.x = 0.1;
  sigma_obs.y = 0.1;
  sigma_obs.z = 0.1;
  sigma_obs.roll = 0.05;
  sigma_obs.pitch = 0.05;
  sigma_obs.yaw = 0.05; // observation sigmas
  
  B << 1, 0, 0, 0, 0, 0, // x
       0, 1, 0, 0, 0, 0, // y
       0, 0, 0, 0, 1, 0, // pitch
       0, 0, 0, 0, 0, 1; // yaw ------> Binding matrix: we store what we're interested in (optional)

  ekfStrip.type = visualization_msgs::Marker::LINE_STRIP;
  ekfStrip.action = visualization_msgs::Marker::ADD;
  ekfStrip.header.frame_id = "map";
  ekfStrip.ns = "ekf_rviz";
  ekfStrip.id = 0;
  ekfStrip.pose.orientation.w = 1.0;
  ekfStrip.scale.x = 0.1;
  ekfStrip.color.r = 0.0;
  ekfStrip.color.g = 1.0;
  ekfStrip.color.b = 1.0;
  ekfStrip.color.a = 1.0;

  Matrix6f P = P.Zero(); // Kalman covariance matrix
  Matrix6f R = R.Zero(); // Observation covariance matrix -> sigma_obs
  Matrix6f Q = Q.Zero(); // Odometry covariance matrix -> sigma_odom

  Matrix6f Fx, Fu;
  
  int test; // 1 or 2
  ros::param::get("test", test);
  std::vector<pcl_segment::observationRPY> map; // FIXME fill with VE positions in document
  pcl_segment::observationRPY map_aux;
  
  /*
  test1
  58.0    0.2
  74.75   0.5
  91.9    1.1
  
  test2
  68.25 -3.5
  85.46 3.15
  */
  
  if (test==1){
  map_aux.position.x = 58.0; map_aux.position.y = 0.2; map_aux.position.z = -1.72; map_aux.position.roll = 0.0; map_aux.position.pitch = 0.0; map_aux.position.yaw = 0.0; map_aux.is_Known = true;
  map.push_back(map_aux);
  map_aux.position.x = 74.75; map_aux.position.y = 0.5; map_aux.position.z = -1.72; map_aux.position.roll = 0.0; map_aux.position.pitch = 0.0; map_aux.position.yaw = 0.0; map_aux.is_Known = true;
  map.push_back(map_aux);
  map_aux.position.x = 91.9; map_aux.position.y = 1.1; map_aux.position.z = -1.72; map_aux.position.roll = 0.0; map_aux.position.pitch = 0.0; map_aux.position.yaw = 0.0; map_aux.is_Known = true;
  map.push_back(map_aux);
  }
  else{
  map_aux.position.x = 68.25; map_aux.position.y = -3.5; map_aux.position.z = -1.72; map_aux.position.roll = 0.0; map_aux.position.pitch = 0.0; map_aux.position.yaw = 0.0; map_aux.is_Known = true;
  map.push_back(map_aux);
  map_aux.position.x = 85.46; map_aux.position.y = 3.15; map_aux.position.z = -1.72; map_aux.position.roll = 0.0; map_aux.position.pitch = 0.0; map_aux.position.yaw = 0.0; map_aux.is_Known = true;
  map.push_back(map_aux);
  }
  
  
  
  R(0,0) = sigma_obs.x*sigma_obs.x;
  R(1,1) = sigma_obs.y*sigma_obs.y;
  R(2,2) = sigma_obs.z*sigma_obs.z;
  R(3,3) = sigma_obs.roll*sigma_obs.roll;
  R(4,4) = sigma_obs.pitch*sigma_obs.pitch;
  R(5,5) = sigma_obs.yaw*sigma_obs.yaw;
  
  std::cout << "R:" << std::endl;
  std::cout << R << std::endl;
    
  Q(0,0) = sigma_odom.x*sigma_odom.x;
  Q(1,1) = sigma_odom.y*sigma_odom.y;
  Q(2,2) = sigma_odom.z*sigma_odom.z;
  Q(3,3) = sigma_odom.roll*sigma_odom.roll;
  Q(4,4) = sigma_odom.pitch*sigma_odom.pitch;
  Q(5,5) = sigma_odom.yaw*sigma_odom.yaw;
  
  std::cout << "Q:" << std::endl;
  std::cout << Q << std::endl;

  bool logfile;
  std::ofstream myfile ("logEKF.txt");
  
  int aux;
  double theta, thetaPrev, dT, wheelsL;
  theta = 0.0;
  thetaPrev = 0.0;
  dT = 1.0/loopRate;
  vel = 0.0;
  dir = 0.0;
  
  //*************************//
  //        MAIN LOOP        //
  //*************************//
  while(ros::ok()){
    ros::param::get("mahalanobisDistanceThreshold", mahalanobisDistanceThreshold);
    ros::param::get("tfEKF", tfEKF);
    ros::param::get("logfile", logfile);
    ros::param::get("wheelsL", wheelsL);
    currentTime = ros::Time::now();
    
    ros::spinOnce();

    /*PREDICTION*/ // needs: incOdom
      
    pub_ekfIncOdom.publish(incOdom); // -----------------------------------> Check that incOdom is the same that in odom node
    pub_ekfPoseOdom.publish(poseOdom); // ---------------------------------> Check that poseOdom is the same that in odom node
    
    theta = thetaPrev + vel*dT/wheelsL*tan(dir);                                     // Calculate incOdom locally
    incOdom2.pose.position.x = vel*dT*cos(theta);
    incOdom2.pose.position.y = vel*dT*sin(theta);
    incOdom2.pose.position.z = 0.0;
    quat.setRPY(0.0, 0.0, vel*dT/wheelsL*tan(dir));
    tf::quaternionTFToMsg(quat, incOdom2.pose.orientation);
    incOdom2.header.stamp = ros::Time::now();
    /*
    std::cout << "time: " << ros::Time::now() << std::endl;
    std::cout << "theta: " << theta << std::endl;
    std::cout << "thetaPrev: " << thetaPrev << std::endl;
    std::cout << "vel: " << vel << std::endl;
    std::cout << "dir: " << dir << std::endl;
    std::cout << "x: " << incOdom2.pose.position.x << std::endl;
    std::cout << "y: " << incOdom2.pose.position.y << std::endl;
    */
  
    pub_ekfIncOdom2.publish(incOdom2); // -----------------------------------> Check that incOdom is the same that in odom node
    

    incOdomEKF.x = incOdom2.pose.position.x;
    incOdomEKF.y = incOdom2.pose.position.y;
    incOdomEKF.z = incOdom2.pose.position.z;
    tf::quaternionMsgToTF(incOdom2.pose.orientation, quat); // pass rotation info from geometry_msgs::PoseS... to a tf::Quaternion object quat
    tf::Matrix3x3 quaternionToRPY(quat); // initialize a tf::Matrix3x3 object with quat quaternion
    quaternionToRPY.getRPY(incOdomEKF.roll, incOdomEKF.pitch, incOdomEKF.yaw); // get RPY angles from tf::Matrix3x3 object

    pub_ekfIncOdomRPY.publish(incOdomEKF);


    positionPredEKF = Comp(positionEKF, incOdomEKF); // -----------------------> Position prediction (from geometry_msgs::TransformStamped incOdom)
//    positionPredEKF = Comp(positionEKF, incPositionOdom); // -----------------------> Position prediction (from pcl_segment::positionRPY incPositionOdom)
    
    pub_ekfPosition.publish(positionPredEKF);
    
    Fx = J1_n(positionPredEKF, incOdomEKF);
    Fu = J2_n(positionPredEKF, incOdomEKF);
    
//    std::cout << "Fx: " << Fx << std::endl;
//    std::cout << "Fu: " << Fu << std::endl;
    
    P = Fx*P*Fx.transpose() + Fu*Q*Fu.transpose(); // -----------------------> Prediction of state's covariance
    
//    std::cout << "P: " << P << std::endl;
    
    /************************************************************************************************/
    /*UPDATE*/ // needs: observations
    std::vector<pcl_segment::observationRPY> observations;
    
    for (int i=0; i<verticalElements.poses.size(); i++) // read geometry_msgs::PoseArray and store as std::vector<observationRPY>
    {
      pcl_segment::observationRPY obs_aux;
      tf::Quaternion quat_aux;
      obs_aux.position.x = verticalElements.poses[i].position.x;
      obs_aux.position.y = verticalElements.poses[i].position.y;
      obs_aux.position.z = verticalElements.poses[i].position.z;
      quat_aux.setX(verticalElements.poses[i].orientation.x);
      quat_aux.setY(verticalElements.poses[i].orientation.y);
      quat_aux.setZ(verticalElements.poses[i].orientation.z);
      quat_aux.setW(verticalElements.poses[i].orientation.w);
      tf::Matrix3x3 quaternionToYPR_aux(quat);
      quaternionToYPR_aux.getEulerYPR(obs_aux.position.yaw, obs_aux.position.pitch, obs_aux.position.roll);
      
      observations.push_back(obs_aux);
    }
    
    int tamMax = 6*observations.size();
    std::cout << "tamMax: " << tamMax << std::endl;
    MatrixXf h(tamMax, 1); h.Zero(tamMax, 1);
    MatrixXf Hx(tamMax, 6); Hx.Zero(tamMax, 6);
    std::vector<Matrix<float, Dynamic, 6>> Hz_v;
    Vector6f hi; hi.Zero();
    Matrix6f Hxi; Hxi.Zero();
    Matrix6f Hzi; Hzi.Zero();
    int tam = 0;
    
    std::cout << "h.size(): " << h.size() << std::endl;
    std::cout << "Hx.size(): " << Hx.size() << std::endl;
    std::cout << "hi.size(): " << hi.size() << std::endl;
    std::cout << "Hxi.size(): " << Hxi.size() << std::endl;
    std::cout << "Hzi.size(): " << Hzi.size() << std::endl;
    
    bool match = false;
    int i_min = -1;
    int j_min = -1;
    std::vector<int> i_vec;
    std::vector<int> j_vec;
    if(observations.size()>0) // To avoid crash
    {
      float minMahalanobis = mahalanobisDistance(observations[0], map[0], R); // initial value
      for (int i=0; i<observations.size(); i++) // Compare all observations with all the elements of the map. If mahalanobisDistance < mahalanobisDistanceThreshold between i-th observation and j-th element, there is a match
      {
        for (int j=0; j<map.size(); j++)
        {
          std::cout << "mahalanobisDistance[" << i << "][" << j << "]: " << mahalanobisDistance(observations[i], map[j], R) << std::endl;
          if(mahalanobisDistance(observations[i], map[j], R) < mahalanobisDistanceThreshold && mahalanobisDistance(observations[i], map[j], R) <= minMahalanobis) //Theres is a match, but it must be the minimum value of all possible matches
          {
            match = true;
            i_min = i;
            j_min = j;
          }
        }
        if (match)
        {
          i_vec.push_back(i_min);
          j_vec.push_back(j_min);
          match = false;
        }
        minMahalanobis = mahalanobisDistance(observations[i+1], map[0], R);
      } // Minimum matches are stored in i_vec and j_vec, such as (i_vec(n), j_vec(n)) is the n-th association
      std::cout << "i_vec: ";
      for(int i=0; i<i_vec.size(); i++)
        std::cout <<  i_vec[i]  << " ";
      std::cout << std::endl;
      std::cout << "j_vec: ";
      for(int i=0; i<j_vec.size(); i++)
        std::cout <<  j_vec[i]  << " ";
      std::cout << std::endl;

    
    
      if(i_vec.size() != 0) // To avoid crash
      {
        for(int i=0; i<i_vec.size(); i++) // For all matches found (i_vec.size() == j_vec.size())
        {
          std::cout << "tam: " << tam << std::endl;
  /**/    hi = computeInnovation(positionPredEKF, observations[i_vec[i]], map[j_vec[i]]);
          std::cout << "hi: " << std::endl << hi << std::endl;
          std::cout << "1.- h: " << std::endl << h << std::endl;
          //h.block((tam+1)-1, 0, (tam+6)-1, 0) = hi; // ---> .block not working properly
  /**/    for (int i2=0; i2<6; i2++)
  /***/     h(i2+tam, 0) = hi(i2);
          
          std::cout << "2.- h: " << std::endl << h << std::endl;
          std::cout << "1.- Hxi: " << std::endl << Hxi << std::endl;
  /**/    Hxi = computeHx2(observations[i_vec[i]], positionPredEKF);
          std::cout << "2.- Hxi: " << std::endl << Hxi << std::endl;
          std::cout << "1.- Hx: " << std::endl << Hx << std::endl;
          //Hx.block((tam+1)-1, 0, (tam+6)-1, 6-1) = Hxi; // ---> .block not working properly
  /**/    for (int i2=0; i2<6; i2++)
  /***/   {
  /***/     for (int j2=0; j2<6; j2++)
  /***/       Hx(i2+tam,j2) = Hxi(i2,j2);
  /***/   }
          std::cout << "2.- Hx: " << std::endl << Hx << std::endl;
  /**/    Hzi = computeHz2(observations[i_vec[i]], positionPredEKF);
          std::cout << "Hzi: " << std::endl << Hzi << std::endl;
  /**/    Hz_v.push_back(Hzi);
  /**/    tam += 6;
        }
      }
      
      
      if (tam>0)
      {
        std::cout << "if tam>0" << std::endl;
        std::cout << "tam: " << tam << std::endl;
  /**/  MatrixXf PHt(6, tam);
        std::cout << "flag1" << std::endl;
  /**/  MatrixXf Hx_resized(tam, 6);
        std::cout << "Hx_resized: " << std::endl << Hx_resized << std::endl;
        std::cout << "Hx_resized.rows(): " << Hx_resized.rows() << " Hx_resized.cols(): " << Hx_resized.cols() << std::endl; 
        
        std::cout << "Hx.block(0, 0, (tam), 6): " << std::endl << Hx.block(0, 0, (tam), 6) << std::endl;
        std::cout << "flag2" << std::endl;
  /**/  Hx_resized = Hx.block(0, 0, (tam), 6);
        std::cout << "flag3" << std::endl;
        std::cout << "P.rows(): " << P.rows() << " P.cols(): " << P.cols() << std::endl;
        std::cout << "Hx_resized.rows(): " << Hx_resized.rows() << " Hx_resized.cols(): " << Hx_resized.cols() << std::endl;
        std::cout << "P: " << std::endl << P << std::endl;
        std::cout << "Hx_resized.transpose: " << std::endl << Hx_resized.transpose() << std::endl;
  /**/  PHt = P*Hx_resized.transpose();
        std::cout << "flag4" << std::endl;
  /**/  MatrixXf S(tam, tam);
        std::cout << "flag5" << std::endl;
        std::cout << "Hx_resized: " << std::endl << Hx_resized << std::endl;
        std::cout << "PHt: " << std::endl << PHt << std::endl;
  /**/  S = Hx_resized*PHt;
        std::cout << "flag6" << std::endl;
        
        for(int i=0; i<Hz_v.size(); i++)
        {
          std::cout << "flag7" << std::endl;
          Matrix6f Hzi;
          std::cout << "flag8" << std::endl;
          Hzi = Hz_v[i];
          std::cout << "flag9" << std::endl;
          Matrix6f aux1;
          std::cout << "flag10" << std::endl;
          aux1 = Hzi*R*Hzi.transpose();
          std::cout << "flag11" << std::endl;
          //Matrix6f aux2 = S.block(i*6, i*6, (i*6+6)-1, (i*6+6)-1);
          Matrix6f aux2;
          Matrix6f aux3;
          for(int i2=0; i2<6; i2++)
          {
            for(int j2=0; j2<6; j2++)
              aux2(i2,j2) = S(i*6 + i2, i*6 + j2);
          }
          std::cout << "flag12" << std::endl;
          std::cout << "aux1: " << aux1 << std::endl;
          std::cout << "aux2: " << aux2 << std::endl;
          aux3 = aux1+aux2;
          std::cout << "aux3: " << std::endl;
          //S.block(i*6, i*6, (i*6+7), (i*6+7)) = aux1 + aux2;
          for(int i2=0; i2<6; i2++)
          {
            for (int j2=0; j2<6; j2++)
              S(i*6+i2, i*6+j2) = aux3(i2, j2);
          }
          std::cout << "flag13" << std::endl;
        }
        
        MatrixXf K(6, tam);
          std::cout << "flag14" << std::endl;
        K = PHt*S.inverse(); // ------------------------> Kalman Gain
          std::cout << "flag15" << std::endl;
        
        MatrixXf h_resized(tam, 1);
          std::cout << "flag15" << std::endl;
          std::cout << "h_resized: " << h_resized << std::endl;
          std::cout << "h.block(0, 0, tam, 1): " << h.block(0, 0, tam, 1) << std::endl;
        h_resized = h.block(0, 0, tam, 1);
          std::cout << "flag16" << std::endl;
        
        std::cout << "K: " << K << std::endl;
        std::cout << "h_resized: " << h_resized << std::endl;

        positionCorrEKF = vec2RPY(RPY2Vec(positionPredEKF) - K*h_resized); // ------------------> Position update/correction
          std::cout << "flag17" << std::endl;
        Matrix<float, 3, 4>::Identity();
          std::cout << "flag18" << std::endl;
        P = (Matrix6f::Identity() - K*Hx_resized)*P;
          std::cout << "flag19" << std::endl;
      }
    }
    else
      positionCorrEKF = positionPredEKF;
    
/*     
*/
    
        /*
    std::cout << "poseCorrEKF" << std::endl;
    std::cout << poseCorrEKF << std::endl;
    */
    //Send pose message
    
    /************************************************************************************************/
    

//  positionCorrEKF = positionPredEKF; // FIXME bypassing correction stage ---------------------------------------------------------------------------------------------------------//
                                                                                                                                                                                    //
    poseCorrEKF.pose.position.x = positionCorrEKF.x;                                                                                                                                //
    poseCorrEKF.pose.position.y = positionCorrEKF.y;                                                                                                                                //
    poseCorrEKF.pose.position.z = positionCorrEKF.z;                                                                                                                                //
    poseCorrEKF.header.frame_id = "map";                                                                                                                                            //
    poseCorrEKF.header.stamp = ros::Time::now();                                                                                                                                    //
                                                                                                                                                                                    //
    ekfPoint.x = poseCorrEKF.pose.position.x; // Path painting                                                                                                                      //
    ekfPoint.y = poseCorrEKF.pose.position.y;                                                                                                                                       //
    ekfPoint.z = poseCorrEKF.pose.position.z;                                                                                                                                       //
    ekfStrip.points.push_back(ekfPoint);                                                                                                                                            //
    pub_ekfStrip.publish(ekfStrip);                                                                                                                                                 //
                                                                                                                                                                                    //
    pub_ekfCorr.publish(poseCorrEKF);                                                                                                                                               //
                                                                                                                                                                                    //
    tf::Quaternion quat_msg;                                                                                                                                                        //
    quat_msg.setRPY(positionCorrEKF.yaw, positionCorrEKF.pitch, positionCorrEKF.roll); // set a tf::Quaternion from RPY                                                             //
    tf::quaternionTFToMsg(quat_msg, poseCorrEKF.pose.orientation); // set quaternion in msg from tf::Quaternion                                                                     //
                                                                                                                                                                                    //
    transform_ekf.setOrigin(tf::Vector3(poseCorrEKF.pose.position.x, poseCorrEKF.pose.position.y, poseCorrEKF.pose.position.z));                                                    //
    transform_ekf.setRotation(tf::Quaternion(tfScalar(poseCorrEKF.pose.orientation.x), tfScalar(poseCorrEKF.pose.orientation.y), tfScalar(poseCorrEKF.pose.orientation.z),           tfScalar(poseCorrEKF.pose.orientation.w)));                                                                                                                                         //
                                                                                                                                                                                    //
    br.sendTransform(tf::StampedTransform(transform_ekf, ros::Time::now(), "map", "ekf"));                                                                                          //
                                                                                                                                                                                    //
    if(tfEKF)                                                                                                                                                                       //
      br.sendTransform(tf::StampedTransform(tf::Transform::getIdentity(), ros::Time::now(), "ekf", "base_link")); // -------> Plug /base_link to /ekf frame                         //
                                                                                                                                                                                    //
    if(logfile)                                                                                                                                                                     //
    {                                                                                                                                                                               //
      if (myfile.is_open()) // Log file                                                                                                                                             //
        myfile << positionPredEKF.x << ", " << positionPredEKF.y << std::endl;                                                                                                      //
      else std::cout << "Unable to open file"; // ----------------------------------------------------------------------------------------------------------------------------------//
    }
    
    if (incOdom.header.stamp < incOdomPrev.header.stamp)// FIXME debugging -------> To be consistent with loop-playing
    {
      std::cout << "RESET--------------------------------------" << std::endl;
      transform_ekf = tf::StampedTransform(tf::Transform::getIdentity(), initTime, "map", "ekf");
      positionEKF = positionZero;
      incOdomPrev = poseZero;
      thetaPrev = 0.0;
      theta = 0.0;
      dir = 0.0;
      vel = 0.0;
      ekfStrip.points = {};
    }
    else
    {
      positionEKF = positionCorrEKF;
      incOdomPrev = incOdom;
      thetaPrev = theta;
    }
    loop_rate.sleep();
  }
  
  return(0);
}
