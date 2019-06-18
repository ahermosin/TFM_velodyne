//  Created on: Jul 29, 2013
//      Author: pdelapuente

#include <ros/ros.h>
#include <time.h>
#include <math.h>
#include <assert.h>
#include <tf/tf.h>
#include <tf/LinearMath/Matrix3x3.h>
#include <tf_conversions/tf_eigen.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include "geometry_msgs/PoseStamped.h"
#include <geometry_msgs/PoseArray.h>
#include "pugixml.hpp"
#include <pcl_segment/positionRPY.h>
#include <pcl_segment/observationRPY.h>
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

geometry_msgs::TransformStamped incOdom;
geometry_msgs::PoseArray verticalElements;
pcl_segment::positionRPY incPositionOdom;

void callback_ve(const geometry_msgs::PoseArray input_ve)
{
  verticalElements = input_ve;
}

void callback_incOdom(const geometry_msgs::TransformStamped input_incOdom)
{
  incOdom = input_incOdom;
  std::cout << "RECEIVED INCODOM:" << std::endl << incOdom << std::endl;
}

void callback_incPositionOdom(pcl_segment::positionRPY input_incPositionOdom)
{
  incPositionOdom = input_incPositionOdom;
  std::cout << "RECEIVED incPositionOdom:" << std::endl << incPositionOdom << std::endl;
}



int 
main (int argc, char** argv)
{
  ros::init(argc, argv, "ekf");
  ros::NodeHandle nh;
  ros::Subscriber sub_ve = nh.subscribe ("/PoseArray_ve", 20, callback_ve);
  ros::Subscriber sub_incOdom = nh.subscribe ("/incOdom2", 20, callback_incOdom);
  ros::Subscriber sub_incPositionOdom = nh.subscribe ("/incPositionOdom", 20, callback_incPositionOdom);
  ros::Publisher pub_ekf = nh.advertise<visualization_msgs::Marker>("pose_filtered", 1); // debugging
  ros::Publisher pub_ekfPred = nh.advertise<geometry_msgs::PoseStamped>("pose_predicted", 1); // debugging
  ros::Publisher pub_ekfCorr = nh.advertise<geometry_msgs::PoseStamped>("pose_corrected", 20); // debugging
  ros::Rate loop_rate(10);
  
  /*INITIALIZATION*/
  geometry_msgs::PoseStamped poseEKF;
  geometry_msgs::PoseStamped posePredEKF;
  geometry_msgs::PoseStamped poseCorrEKF;

  pcl_segment::positionRPY positionEKF;
  pcl_segment::positionRPY incOdomEKF;
  pcl_segment::positionRPY incOdomEKFPrev;  
  pcl_segment::positionRPY incOdomInit;
  pcl_segment::positionRPY positionPredEKF;
  pcl_segment::positionRPY positionCorrEKF;
  pcl_segment::positionRPY sigma_odom;
  pcl_segment::positionRPY sigma_obs;
  Matrix <bool, 4, 6> B; // Binding matrix for EKF
  
  tf::Quaternion quat;
  
  poseEKF.pose.position.x = 0.0;
  poseEKF.pose.position.y = 0.0;
  poseEKF.pose.position.z = 0.0;
  poseEKF.pose.orientation.x = 0.0;
  poseEKF.pose.orientation.y = 0.0;
  poseEKF.pose.orientation.z = 0.0;
  poseEKF.pose.orientation.w = 1.0; // poseEKF init
  
  incOdomInit.x = 0.0;
  incOdomInit.y = 0.0;
  incOdomInit.z = 0.0;
  incOdomInit.roll = 0.0;
  incOdomInit.pitch = 0.0;
  incOdomInit.yaw = 0.0; //incOdom init
  
  positionEKF.x = 0.0;
  positionEKF.y = 0.0;
  positionEKF.z = 0.0;
  positionEKF.roll = 0.0;
  positionEKF.pitch = 0.0*45.0*3.141592/180.0;
  positionEKF.yaw = 0.0; // position init
  
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

  Matrix6f P = P.Zero(); // Kalman covariance matrix
  Matrix6f R = R.Zero(); // Observation covariance matrix -> sigma_obs
  Matrix6f Q = Q.Zero(); // Odometry covariance matrix -> sigma_odom

  Matrix6f Fx, Fu;
  
  int test = 1; // 1 or 2
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

  incOdomEKFPrev = incOdomInit; // FIXME
  std::ofstream myfile ("logEKF.txt");
  
  while(ros::ok()){
    ros::param::get("mahalanobisDistanceThreshold", mahalanobisDistanceThreshold);
    /*PREDICTION*/ // needs: incOdom, poseEKF
      
    incOdomEKF.x = incOdom.transform.translation.x;
    incOdomEKF.y = incOdom.transform.translation.y;
    incOdomEKF.z = incOdom.transform.translation.z;

    tf::quaternionMsgToTF(incOdom.transform.rotation, quat); // pass rotation info from geometry_msgs::transf... to a tf::Quaternion object quat
    tf::Matrix3x3 quaternionToRPY(quat); // initialize a tf::Matrix3x3 object with quat quaternion
    quaternionToRPY.getRPY(incOdomEKF.roll, incOdomEKF.pitch, incOdomEKF.yaw); // get RPY angles from tf::Matrix3x3 object
    
    if (isnan(incPositionOdom.x) || isnan(incPositionOdom.y) || isnan(incPositionOdom.z) || isnan(incPositionOdom.roll) || isnan(incPositionOdom.pitch) || isnan(incPositionOdom.yaw)) // Avoid NaNs
      incPositionOdom = incOdomInit;
      
    if (isnan(incOdomEKF.x) || isnan(incOdomEKF.y) || isnan(incOdomEKF.z) || isnan(incOdomEKF.roll) || isnan(incOdomEKF.pitch) || isnan(incOdomEKF.yaw))
      incOdomEKF = incOdomInit;

    std::cout << "positionEKF: " << positionEKF << std::endl;
    std::cout << "incOdom message: " << incOdom << std::endl;
    std::cout << "incOdomEKF: " << incOdomEKF << std::endl;
    std::cout << "incPositionOdom: " << incPositionOdom << std::endl;
    
    
    positionPredEKF = Comp(positionEKF, incOdomEKF); // -----------------------> Position prediction (from geometry_msgs::TransformStamped incOdom)
//    positionPredEKF = Comp(positionEKF, incPositionOdom); // -----------------------> Position prediction (from pcl_segment::positionRPY incPositionOdom)
    std::cout << "Composit: " << positionPredEKF << std::endl;
        
    if (myfile.is_open()) // Log file
    {
      myfile << positionPredEKF.x << ", " << positionPredEKF.y << std::endl;
    }
    else std::cout << "Unable to open file";
    
    Fx = J1_n(positionPredEKF, incOdomEKF);
    Fu = J2_n(positionPredEKF, incOdomEKF);
    
    std::cout << "Fx: " << Fx << std::endl;
    std::cout << "Fu: " << Fu << std::endl;
    
    P = Fx*P*Fx.transpose() + Fu*Q*Fu.transpose(); // -----------------------> Prediction of state's covariance
    
    std::cout << "P: " << P << std::endl;
    
    positionCorrEKF = positionPredEKF; // FIXME bypassing correction stage
    
    poseCorrEKF.pose.position.x = positionCorrEKF.x;
    poseCorrEKF.pose.position.y = positionCorrEKF.y;
    poseCorrEKF.pose.position.z = positionCorrEKF.z;
    
    tf::Quaternion quat_msg;
    quat_msg.setRPY(positionCorrEKF.roll, positionCorrEKF.pitch, positionCorrEKF.yaw); // set a tf::Quaternion from RPY
    tf::quaternionTFToMsg(quat_msg, poseCorrEKF.pose.orientation); // set quaternion in msg from tf::Quaternion
    
    poseCorrEKF.header.frame_id = "map";
    poseCorrEKF.header.stamp = ros::Time::now();
    
    positionEKF = positionPredEKF;
    incOdomEKFPrev = incOdomEKF;
    /************************************************************************************************/
    /*UPDATE*/ // needs: observations
/*    
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
      
      // FIXME ASSIGN TRUE/FALSE IN obs_aux.position.isKnown? Mahalanobis?
      
      std::cout << "obs_aux: " << obs_aux << std::endl; 
      
      observations.push_back(obs_aux);
    }
    
//    std::cout << "observations.size(): " << observations.size() << std::endl;
    
    int tamMax = 6*observations.size();
    std::cout << "tamMax: " << tamMax << std::endl;
    MatrixXf h(tamMax, 1); h.Zero(tamMax, 1);
    MatrixXf Hx(tamMax, 6); Hx.Zero(tamMax, 6);
    std::vector<Matrix<float, Dynamic, 6>> Hz_v;
    Vector6f hi;
    Matrix6f Hxi;
    Matrix6f Hzi;
    int tam = 0;
    
    std::cout << "h.size(): " << h.size() << std::endl;
    std::cout << "Hx.size(): " << Hx.size() << std::endl;
    std::cout << "hi.size(): " << hi.size() << std::endl;
    std::cout << "Hxi.size(): " << Hxi.size() << std::endl;
    std::cout << "Hzi.size(): " << Hzi.size() << std::endl;
    
    //Examino el elemento i-ésimo de las observaciones hasta hacer match con el j-ésimo elemento del mapa
    
    for (int i=0; i<observations.size(); i++) // Compare all observations with all the elements of the map. If mahalanobisDistance < mahalanobisDistanceThreshold between i-th observation and j-th element, there is a match
    {
      for (int j=0; j<map.size(); j++)
      {
        std::cout << "isPromising[" << i << "][" << j << "]: " << std::endl;
        if(isPromising(observations[i], map[j], R)) //Theres is a match
        {
          std::cout << "tam: " << tam << std::endl;
          hi = computeInnovation(positionEKF, observations[i], map[j]);
          std::cout << "hi: " << hi << std::endl;
          std::cout << "1.- h: " << h << std::endl;
          //h.block((tam+1)-1, 0, (tam+6)-1, 0) = hi;
          for (int i2=0; i2<6; i2++)
            h(i2+tam, 0) = hi(i2);
          
          std::cout << "2.- h: " << h << std::endl;
          std::cout << "1.- Hxi: " << Hxi << std::endl;
          Hxi = computeHx2(observations[i], positionEKF);
          std::cout << "2.- Hxi: " << Hxi << std::endl;
          std::cout << "1.- Hx: " << Hx << std::endl;
          //Hx.block((tam+1)-1, 0, (tam+6)-1, 6-1) = Hxi;
          for (int i2=0; i2<6; i2++)
          {
            for (int j2=0; j2<6; j2++)
              Hx(i2+tam,j2) = Hxi(i2,j2);
          }
          std::cout << "2.- Hx: " << Hx << std::endl;
          Hzi = computeHz2(observations[i], positionEKF);
          std::cout << "Hzi: " << Hzi << std::endl;
          Hz_v.push_back(Hzi);
          tam += 6;
        }
      }
    }
    
    if (tam>0)
    {
      std::cout << "if tam>0" << std::endl;
      std::cout << "tam: " << tam << std::endl;
      MatrixXf PHt(6, tam);
      std::cout << "flag1" << std::endl;
      MatrixXf Hx_resized(tam, 6);
      std::cout << "Hx_resized: " << Hx_resized << std::endl;
      std::cout << "Hx_resized.rows(): " << Hx_resized.rows() << " Hx_resized.cols(): " << Hx_resized.cols() << std::endl; 
      
      std::cout << "Hx.block(0, 0, (tam), 6): " << Hx.block(0, 0, (tam), 6) << std::endl;
      std::cout << "flag2" << std::endl;
      Hx_resized = Hx.block(0, 0, (tam), 6);
      std::cout << "flag3" << std::endl;
      std::cout << "P.rows(): " << P.rows() << " P.cols(): " << P.cols() << std::endl;
      std::cout << "Hx_resized.rows(): " << Hx_resized.rows() << " Hx_resized.cols(): " << Hx_resized.cols() << std::endl;
      std::cout << "P: " << P << std::endl;
      std::cout << "Hx_resized.transpose: " << Hx_resized.transpose() << std::endl;
      PHt = P*Hx_resized.transpose();
      std::cout << "flag4" << std::endl;
      MatrixXf S(tam, tam);
      std::cout << "flag5" << std::endl;
      std::cout << "Hx_resized: " << Hx_resized << std::endl;
      std::cout << "PHt: " << PHt << std::endl;
      S = Hx_resized*PHt;
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

      positionEKF = vec2RPY(RPY2Vec(positionEKF) - K*h_resized); // ------------------> Position update/correction
        std::cout << "flag17" << std::endl;
      Matrix<float, 3, 4>::Identity();
        std::cout << "flag18" << std::endl;
      P = (Matrix6f::Identity() - K*Hx_resized)*P;
        std::cout << "flag19" << std::endl;
    }
*/
        
    std::cout << "poseCorrEKF" << std::endl;
    std::cout << poseCorrEKF << std::endl;
    
    //Send pose message
    
    /************************************************************************************************/
    
    pub_ekfCorr.publish(poseCorrEKF);
    ros::spinOnce();
    loop_rate.sleep();
  }
  
  return(0);
}
