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
#include <visualization_msgs/MarkerArray.h>
#include "geometry_msgs/PoseStamped.h"
#include "geometry_msgs/PoseWithCovarianceStamped.h"
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
#include "tinyxml.h"
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
geometry_msgs::PoseArray verticalElements_BL;
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

void callback_ve_BL(const geometry_msgs::PoseArray input_ve_BL)
{
  verticalElements_BL = input_ve_BL;
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
  ros::Subscriber sub_ve_BL = nh.subscribe ("/PoseArray_ve_BL", 1, callback_ve_BL);
  ros::Subscriber sub_incOdom = nh.subscribe ("/incOdom", 1, callback_incOdom);
  ros::Subscriber sub_poseOdom = nh.subscribe ("/poseOdom", 1, callback_poseOdom);
  ros::Subscriber sub_vel = nh.subscribe ("/lcm_to_ros/CAN_COCHE_VELOCIDAD", 1, callback_vel);
  ros::Subscriber sub_dir = nh.subscribe ("/lcm_to_ros/CAN_COCHE_DIRECCION", 1, callback_dir);
//  ros::Subscriber sub_incPositionOdom = nh.subscribe ("/incPositionOdom", 1, callback_incPositionOdom);
  ros::Publisher pub_ekf = nh.advertise<visualization_msgs::Marker>("pose_filtered", 1); // debugging
  ros::Publisher pub_ekfPoseOdom = nh.advertise<geometry_msgs::PoseStamped>("ekfPoseOdom", 1); // debugging
  ros::Publisher pub_ekfPred = nh.advertise<geometry_msgs::PoseWithCovarianceStamped>("pose_predicted", 1); // debugging
  ros::Publisher pub_ekfCorr = nh.advertise<geometry_msgs::PoseWithCovarianceStamped>("pose_corrected", 1); // debugging
  ros::Publisher pub_ekfIncOdom = nh.advertise<geometry_msgs::PoseStamped>("ekfIncOdom", 1); // debugging
  ros::Publisher pub_ekfIncOdom2 = nh.advertise<geometry_msgs::PoseStamped>("ekfIncOdom2", 1); // debugging
  ros::Publisher pub_ekfIncOdomRPY = nh.advertise<pcl_segment::positionRPY>("ekfIncOdomRPY", 1); // debugging
  ros::Publisher pub_ekfPosition = nh.advertise<pcl_segment::positionRPY>("ekfPosition", 1); // debugging
  ros::Publisher pub_ekfStrip = nh.advertise<visualization_msgs::Marker>("ekf_strip", 1); // debugging
  ros::Publisher pub_obsMatches = nh.advertise<visualization_msgs::MarkerArray>("obs_Matches", 1); // debugging
  ros::Publisher pub_mapElementIds = nh.advertise<visualization_msgs::MarkerArray>("map_element_ids", 1); // debugging
  ros::Publisher pub_mapElements = nh.advertise<geometry_msgs::PoseArray>("map_elements", 1);
  float loopRate = 100.0;
  ros::Rate loop_rate(loopRate);
  ros::Time initTime = ros::Time::now();
  ros::Time currentTime, pastTime;
  
  /*INITIALIZATION*/  
  geometry_msgs::PoseStamped poseZero;

  geometry_msgs::PoseWithCovarianceStamped posePredEKF;
  geometry_msgs::PoseWithCovarianceStamped poseCorrEKF;
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
  
  posePredEKF.pose.pose = poseZero.pose; // posePredEKF init
  posePredEKF.header = poseZero.header;
  poseCorrEKF.pose.pose = poseZero.pose; // poseCorrEKF init
  poseCorrEKF.header = poseZero.header;
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
  
  visualization_msgs::MarkerArray map_ids;
  visualization_msgs::Marker map_id;
  visualization_msgs::Marker deleter;
//  deleter.action = visualization_msgs::Marker::DELETEALL;

  ros::param::get("sigma_odom_x", sigma_odom.x);
  ros::param::get("sigma_odom_y", sigma_odom.y);
  ros::param::get("sigma_odom_z", sigma_odom.z);
  ros::param::get("sigma_odom_roll", sigma_odom.roll);
  ros::param::get("sigma_odom_pitch", sigma_odom.pitch);
  ros::param::get("sigma_odom_yaw", sigma_odom.yaw); // odometry sigmas

  ros::param::get("sigma_obs_x", sigma_obs.x);
  ros::param::get("sigma_obs_y", sigma_obs.y);
  ros::param::get("sigma_obs_z", sigma_obs.z);
  ros::param::get("sigma_obs_roll", sigma_obs.roll);
  ros::param::get("sigma_obs_pitch", sigma_obs.pitch);
  ros::param::get("sigma_obs_yaw", sigma_obs.yaw); // observation sigmas
  
  Matrix <float, 6, 6> B; // Binding matrix for EKF
  
  B << 1, 0, 0, 0, 0, 0, // x
       0, 1, 0, 0, 0, 0, // y
       0, 0, 1, 0, 0, 0, // z
       0, 0, 0, 1, 0, 0, // roll
       0, 0, 0, 0, 1, 0, // pitch
       0, 0, 0, 0, 0, 1; // yaw  ------> Binding matrix: we store the components of elements in which we're interested (optional)

  int B_rows = B.rows();

  ekfStrip.type = visualization_msgs::Marker::LINE_STRIP;
  ekfStrip.action = visualization_msgs::Marker::ADD;
  ekfStrip.header.frame_id = "map";
  ekfStrip.ns = "ekf_rviz";
  ekfStrip.id = 0;
  ekfStrip.pose.orientation.w = 1.0;
  ekfStrip.scale.x = 0.1;
  ekfStrip.color.r = 1.0;
  ekfStrip.color.g = 0.0;
  ekfStrip.color.b = 0.0;
  ekfStrip.color.a = 1.0;

  Matrix6f P = P.Zero(); // Kalman covariance matrix
  Matrix6f R = R.Zero(); // Observation covariance matrix -> sigma_obs
  Matrix6f Q = Q.Zero(); // Odometry covariance matrix -> sigma_odom

  Matrix6f Fx, Fu;
  
  int test; // 1 or 2
  ros::param::get("test", test);
  std::vector<pcl_segment::observationRPY> map; // FIXME fill with VE positions in document
  geometry_msgs::PoseArray map_elements;
  geometry_msgs::PoseStamped map_element;
  pcl_segment::observationRPY map_aux;
  
  std::string inputFileName; // ------------------------------------------------------> Read CSV file with coordinates of the vertical elements
  if(test==1) //FIXME
    inputFileName = "/home/alberto/workspaces/workspace14diciembre/map1.csv";
  else
    inputFileName = "/home/alberto/workspaces/workspace14diciembre/map2.csv";
  
  std::ifstream inputFile(inputFileName.c_str());
  
  int l = 0;
  while (inputFile) {
    std::string s;
    if (!std::getline(inputFile, s)) break;
    if (s[0] != '#') {
      std::istringstream ss(s);
      std::vector<double> record;

      while (ss) {
        std::string line;
        if (!std::getline(ss, line, ','))
          break;
        try {
          record.push_back(std::stof(line));
        }
        catch (const std::invalid_argument e) {
          std::cout << "NaN found in file " << " line " << l+1 << std::endl;
          e.what();
        }
      }
      map_aux.position.x = record[0];
      map_aux.position.y = record[1];
      map_aux.position.z = -1.8;
      map_aux.position.roll = 0.0;
      map_aux.position.pitch = 0.0;
      map_aux.position.yaw = 0.0;
      map.push_back(map_aux);
      
      map_element.pose.position.x = record[0];
      map_element.pose.position.y = record[1];
      map_element.pose.position.z = -1.8;
      map_element.pose.orientation.x = 0.0;
      map_element.pose.orientation.y = 0.0;
      map_element.pose.orientation.z = 0.0;
      map_element.pose.orientation.w = 1.0;
      map_elements.poses.push_back(map_element.pose);
      
      std::stringstream label;
      map_id.header.frame_id = "map";
      map_id.ns = "map_id_display";
      map_id.type = visualization_msgs::Marker::TEXT_VIEW_FACING;
      map_id.action = visualization_msgs::Marker::ADD;
      map_id.color.a = 1.0;
      map_id.color.r = 1.0f;
      map_id.color.g = 1.0f;
      map_id.color.b = 1.0f;
      map_id.pose.position.x = record[0];
      map_id.pose.position.y = record[1];
      map_id.pose.position.z = 1.0;
      map_id.pose.orientation.w = 1.0;
      label << "ID: " << l;
      map_id.id = l;
      map_id.text = label.str();
      map_id.scale.z = 1.5;
      
      map_ids.markers.push_back(map_id);
    }
    l++;
  }

  if (!inputFile.eof()) {
    std::cerr << "Could not read file " << "\n";
  }
  map_elements.header.frame_id = "map";
  int mapSize = map.size();
  
  R(0, 0) = sigma_obs.x*sigma_obs.x;
  R(1, 1) = sigma_obs.y*sigma_obs.y;
  R(2, 2) = sigma_obs.z*sigma_obs.z;
  R(3, 3) = sigma_obs.roll*sigma_obs.roll;
  R(4, 4) = sigma_obs.pitch*sigma_obs.pitch;
  R(5, 5) = sigma_obs.yaw*sigma_obs.yaw;
  
  std::cout << "R:" << std::endl;
  std::cout << R << std::endl;
    
  Q(0, 0) = sigma_odom.x*sigma_odom.x;
  Q(1, 1) = sigma_odom.y*sigma_odom.y;
  Q(2, 2) = sigma_odom.z*sigma_odom.z;
  Q(3, 3) = sigma_odom.roll*sigma_odom.roll;
  Q(4, 4) = sigma_odom.pitch*sigma_odom.pitch;
  Q(5, 5) = sigma_odom.yaw*sigma_odom.yaw;
  float QFactor;
  ros::param::get("QFactor", QFactor);
  Q = Q*QFactor;
  
  ros::param::get("P00_init", P(0, 0));
  ros::param::get("P11_init", P(1, 1));
  ros::param::get("P22_init", P(2, 2));
  ros::param::get("P33_init", P(3, 3));
  ros::param::get("P44_init", P(4, 4));
  ros::param::get("P55_init", P(5, 5));
  float PFactor;
  ros::param::get("PFactor", PFactor);
  P = P*PFactor;
  
  std::cout << "Q:" << std::endl;
  std::cout << Q << std::endl;

  float textScale;
  bool logfile;
  std::ofstream myfile ("/home/alberto/workspaces/workspace14diciembre/logEKF.txt");
  
  int aux;
  double theta, thetaPrev, dT, wheelsL;
  theta = 0.0;
  thetaPrev = 0.0;
  dT = 1.0/loopRate;
  vel = 0.0;
  dir = 0.0;
  visualization_msgs::Marker obs_match;
  visualization_msgs::MarkerArray obs_matches;
  
  //*************************//
  //        MAIN LOOP        //
  //*************************//
  while(ros::ok()){
    ros::param::get("mahalanobisDistanceThreshold", mahalanobisDistanceThreshold);
    ros::param::get("tfEKF", tfEKF);
    ros::param::get("logfile", logfile);
    ros::param::get("wheelsL", wheelsL);
    currentTime = ros::Time::now();
//    obs_matches.markers.push_back(deleter);
//    pub_obsMatches.publish(obs_matches);
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
  
    pub_ekfIncOdom2.publish(incOdom2); // -----------------------------------> Check that incOdom is the same that in odom node
    
    incOdomEKF.x = vel*dT*cos(theta);
    incOdomEKF.y = vel*dT*sin(theta);
    incOdomEKF.z = 0.0;
    quat.setRPY(0.0, 0.0, theta);
    tf::Matrix3x3 quaternionToRPY(quat); // initialize a tf::Matrix3x3 object with quat quaternion
    quaternionToRPY.getRPY(incOdomEKF.roll, incOdomEKF.pitch, incOdomEKF.yaw); // get RPY angles from tf::Matrix3x3 object

    pub_ekfIncOdomRPY.publish(incOdomEKF);

    positionPredEKF = Comp(positionEKF, incOdomEKF); // -----------------------> Position prediction
    
    pub_ekfPosition.publish(positionPredEKF);
    
    Fx = J1_n(positionEKF, incOdomEKF);
    Fu = J2_n(positionEKF, incOdomEKF);
    
    P = Fx*P*Fx.transpose() + Fu*Q*Fu.transpose(); // -----------------------> Prediction of state's covariance
    std::cout << "P: " << std::endl << P << std::endl;
    /************************************************************************************************/
    /*UPDATE*/ // needs: observations
    std::vector<pcl_segment::observationRPY> observations;
    std::vector<pcl_segment::observationRPY> observations_BL;
    
    for (int i=0; i<verticalElements.poses.size(); i++) // read geometry_msgs::PoseArray and store as std::vector<observationRPY>
    {
      pcl_segment::observationRPY obs_aux; // ------------------------> Frame id: "map"
      tf::Quaternion quat_aux;
      obs_aux.position.x = verticalElements.poses[i].position.x;
      obs_aux.position.y = verticalElements.poses[i].position.y;
      obs_aux.position.z = verticalElements.poses[i].position.z;
      quat_aux.setX(verticalElements.poses[i].orientation.x);
      quat_aux.setY(verticalElements.poses[i].orientation.y);
      quat_aux.setZ(verticalElements.poses[i].orientation.z);
      quat_aux.setW(verticalElements.poses[i].orientation.w);
      tf::Matrix3x3 quaternionToYPR_aux(quat_aux);
      quaternionToYPR_aux.getEulerYPR(obs_aux.position.yaw, obs_aux.position.pitch, obs_aux.position.roll);
      
      pcl_segment::observationRPY obs_aux_BL; // -----------------------> Frame id: "base_link"
      tf::Quaternion quat_aux_BL;
      obs_aux_BL.position.x = verticalElements_BL.poses[i].position.x;
      obs_aux_BL.position.y = verticalElements_BL.poses[i].position.y;
      obs_aux_BL.position.z = verticalElements_BL.poses[i].position.z;
      quat_aux_BL.setX(verticalElements_BL.poses[i].orientation.x);
      quat_aux_BL.setY(verticalElements_BL.poses[i].orientation.y);
      quat_aux_BL.setZ(verticalElements_BL.poses[i].orientation.z);
      quat_aux_BL.setW(verticalElements_BL.poses[i].orientation.w);
      tf::Matrix3x3 quaternionToYPR_aux_BL(quat_aux_BL);
      quaternionToYPR_aux_BL.getEulerYPR(obs_aux_BL.position.yaw, obs_aux_BL.position.pitch, obs_aux_BL.position.roll);

      observations.push_back(obs_aux);
      observations_BL.push_back(obs_aux_BL);
    }

    int obsSize = observations.size();
    
    MatrixXf h_ij(B_rows*obsSize*mapSize, 1);  h_ij = h_ij.Zero(obsSize*mapSize, 1);
    MatrixXf H_x_ij(B_rows, 6);                H_x_ij = H_x_ij.Zero(B_rows, 6);
    MatrixXf H_z_ij(B_rows, 6);                H_z_ij = H_z_ij.Zero(B_rows, 6);
    MatrixXf S_ij(B_rows, B_rows);             S_ij = S_ij.Zero(B_rows, B_rows);
    
    if(obsSize > 0)
    {
      bool match = false;
      int i_min = -1;
      int j_min = -1;
      std::vector<int> i_vec;
      std::vector<int> j_vec;

      float minMahalanobis = mahalanobisDistanceThreshold;

      for (int i=0; i<obsSize; i++) // Compare all observations with all the elements of the map. If mahalanobisDistance < mahalanobisDistanceThreshold between i-th observation and j-th element, there is a match
      {
        for (int j=0; j<mapSize; j++)
        {
          std::cout << "observations[" << i << "]:" << std::endl << observations[i] << std::endl;
          std::cout << "map[" << j << "]:" << std::endl << map[j] << std::endl;
          h_ij = B*RPY2Vec(Comp(Inv(map[j].position), Comp(positionPredEKF, observations_BL[i].position)));
/**/      std::cout << "h_ij: " << std::endl << h_ij << std::endl;
          H_x_ij = B*J2_n(Inv(map[j].position), Comp(positionPredEKF, observations_BL[i].position))*J1_n(positionPredEKF, observations_BL[i].position);
/**/      std::cout << "H_x_ij: " << std::endl << H_x_ij << std::endl;
          H_z_ij = B*J2_n(Inv(map[j].position), Comp(positionPredEKF, observations_BL[i].position))*J2_n(positionPredEKF, observations_BL[i].position);
/**/      std::cout << "H_z_ij: " << std::endl << H_z_ij << std::endl;
          S_ij = H_x_ij*P*H_x_ij.transpose() + H_z_ij*R*H_z_ij.transpose();                   
/**/      std::cout << "S_ij: " << std::endl << S_ij << std::endl;
          std::cout << "mahalanobisDistance[" << i << "][" << j << "]: " << sqrt(mahalanobisDistance(h_ij, S_ij)) << std::endl;
          if(sqrt(mahalanobisDistance(h_ij, S_ij)) < mahalanobisDistanceThreshold && sqrt(mahalanobisDistance(h_ij, S_ij)) < minMahalanobis) //Theres is a match, but it must be the minimum value of all possible matches
          {
            if(match)
              std::cout << "***************************************REMATCH!***************************************" << std::endl;
            else
              std::cout << "***************************************MATCH!***************************************" << std::endl;
              
            match = true;
            i_min = i;
            j_min = j;
            minMahalanobis = sqrt(mahalanobisDistance(h_ij, S_ij));
          }
        }
        if (match)
        {
          i_vec.push_back(i_min);
          j_vec.push_back(j_min);
          obs_match.pose.position.x = observations[i].position.x;
          obs_match.pose.position.y = observations[i].position.y;
          obs_match.pose.position.z = 1.0;
          std::stringstream label;
          obs_match.header.frame_id = "map";
          obs_match.ns = "obs_match_display";
          obs_match.type = visualization_msgs::Marker::TEXT_VIEW_FACING;
          obs_match.action = visualization_msgs::Marker::ADD;
          obs_match.color.a = 1.0;
          obs_match.color.r = 1.0f;
          obs_match.color.g = 1.0f;
          obs_match.color.b = 1.0f;
          label << "Match: [" << i_min << "][" << j_min << "]" << std::endl << "Mahalanobis: " << minMahalanobis;
          obs_match.id = i;
          obs_match.text = label.str();
          obs_match.scale.z = textScale;
          obs_matches.markers.push_back(obs_match);
          match = false;
        }
        
        
        minMahalanobis = mahalanobisDistanceThreshold;
      } // Minimum matches are stored in i_vec and j_vec, such that (i_vec(k), j_vec(k)) is the k-th association
      
      int M = i_vec.size(); // -------> M: number of valid associations.
      if(M > 0) // There has been at least 1 match (M=1)
      {
        std::cout << "i_vec: ";
        for(int i=0; i<i_vec.size(); i++)
          std::cout <<  i_vec[i]  << " ";
        std::cout << std::endl;
        std::cout << "j_vec: ";
        for(int i=0; i<j_vec.size(); i++)
          std::cout <<  j_vec[i]  << " ";
        std::cout << std::endl;

        MatrixXf h_i(B_rows, 1);            h_i = h_i.Zero(B_rows, 1);   // -------> h_ij for a valid association between observation_i and map_j
        MatrixXf h_k(M*B_rows, 1);          h_k = h_k.Zero(M*B_rows, 1); // -------> All vectors h_i stacked, corresponding to valid matches between an observed element and an element in the map
        MatrixXf H_x_i(B_rows, 6);          H_x_i = H_x_i.Zero(B_rows, 6);        // -------> H_ij for a valid association
        MatrixXf H_x_k(M*B_rows, 6);        H_x_k = H_x_k.Zero(M*B_rows, 6);
        MatrixXf H_z_i(B_rows, 6);          H_z_i = H_z_i.Zero(B_rows, 6);
        MatrixXf H_z_k(M*B_rows, M*6);      H_z_k = H_z_k.Zero(M*B_rows, M*6);
        MatrixXf R_k(M*6, M*6);             R_k = R_k.Zero(M*6, M*6);
        MatrixXf S_k(M*B_rows, M*B_rows);   S_k = S_k.Zero(M*B_rows, M*B_rows);
        MatrixXf W(6, M*B_rows);            W = W.Zero(6, M*B_rows);
        
        for(int i=0; i<M; i++)
        {
/**/      std::cout << "h_i = B*RPY2Vec(Comp(Inv(map[" << j_vec[i] << "].position), Comp(positionPredEKF, observations_BL[" << i_vec[i] << "].position)))" << std::endl;
/**/      std::cout << "map[" << j_vec[i] << "].position: " << std::endl << map[j_vec[i]].position << std::endl;
/**/      std::cout << "Inv(map[" << j_vec[i] << "].position): " << std::endl << Inv(map[j_vec[i]].position) << std::endl;
/**/      std::cout << "positionPredEKF: " << std::endl << positionPredEKF << std::endl;
/**/      std::cout << "observations_BL[" << i_vec[i] << "].position: " << std::endl << observations_BL[i_vec[i]].position << std::endl;
/**/      std::cout << "Comp(positionPredEKF, observations_BL[" << i_vec[i] << "].position): " << std::endl << Comp(positionPredEKF, observations_BL[i_vec[i]].position) << std::endl;
          h_i = B*RPY2Vec(Comp(Inv(map[j_vec[i]].position), Comp(positionPredEKF, observations_BL[i_vec[i]].position))); // ----> Observations as seen from base_link FIXME
          h_k.block(i*B_rows, 0, B_rows, 1) = h_i;
/**/      std::cout << "h_i: " << std::endl << h_i << std::endl;
/**/      std::cout << "h_k: " << std::endl << h_k << std::endl;
          H_x_i = B*J2_n(Inv(map[j_vec[i]].position), Comp(positionPredEKF, observations_BL[i_vec[i]].position))*J1_n(positionPredEKF, observations_BL[i_vec[i]].position);
          H_x_k.block(i*B_rows, 0, B_rows, 6) = H_x_i; 
/**/      std::cout << "H_x_i: " << std::endl << H_x_i << std::endl;
/**/      std::cout << "H_x_k: " << std::endl << H_x_k << std::endl;
          H_z_i = B*J2_n(Inv(map[j_vec[i]].position), Comp(positionPredEKF, observations_BL[i_vec[i]].position))*J2_n(positionPredEKF, observations_BL[i_vec[i]].position);
          H_z_k.block(i*B_rows, i*6, B_rows, 6) = H_z_i;
/**/      std::cout << "H_z_i: " << std::endl << H_z_i << std::endl;
/**/      std::cout << "H_z_k: " << std::endl << H_z_k << std::endl;

          R_k.block(i*6, i*6, 6, 6) = R;
/**/      std::cout << "R_k: " << std::endl << R_k << std::endl;
        }
        
        S_k = H_x_k*P*H_x_k.transpose() + H_z_k*R_k*H_z_k.transpose();
/**/    std::cout << "S_k = H_x_k*P*H_x_k.transpose() + H_z_k*R_k*H_z_k.transpose(): " << std::endl;
/**/    std::cout << "H_x_k*P*H_x_k.transpose(): " << std::endl << H_x_k*P*H_x_k.transpose() << std::endl;
/**/    std::cout << "H_z_k*R_k*H_z_k.transpose(): " << std::endl << H_z_k*R_k*H_z_k.transpose() << std::endl;
/**/    std::cout << "S_k: " << std::endl << S_k << std::endl;

        W = P*H_x_k.transpose()*S_k.inverse();
/**/    std::cout << "W: " << std::endl << W << std::endl;
/**/    std::cout << "-W*h_k: " << std::endl << -W*h_k << std::endl;
        
        positionCorrEKF = vec2RPY(RPY2Vec(positionPredEKF) - W*h_k);

        P = (Matrix6f::Identity() - W*H_x_k)*P;
/**/    std::cout << "P updated: " << std::endl << P << std::endl;
      }
      else // vertical elements found but no matches
        positionCorrEKF = positionPredEKF;
    }
    else // no vertical elements found
      positionCorrEKF = positionPredEKF;
    /*
    */
    //Send pose message
    
    /************************************************************************************************/
    

//  positionCorrEKF = positionPredEKF; // FIXME bypassing correction stage

    poseCorrEKF.pose.pose.position.x = positionCorrEKF.x;
    poseCorrEKF.pose.pose.position.y = positionCorrEKF.y;
    poseCorrEKF.pose.pose.position.z = 0.0; //-------------> Ignored
    for(int i=0; i<6; i++)
    {
      for(int j=0; j<6; j++)
        poseCorrEKF.pose.covariance[i+j] = P(i, j);
    }
    poseCorrEKF.header.frame_id = "map";
    poseCorrEKF.header.stamp = ros::Time::now();
    ekfPoint.x = poseCorrEKF.pose.pose.position.x; // Path painting
    ekfPoint.y = poseCorrEKF.pose.pose.position.y;
    ekfPoint.z = poseCorrEKF.pose.pose.position.z;
    ekfStrip.points.push_back(ekfPoint);
    pub_ekfStrip.publish(ekfStrip);

    tf::Quaternion quat_msg;
    quat_msg.setRPY(0.0, 0.0, theta); // set a tf::Quaternion from RPY
    tf::quaternionTFToMsg(quat_msg, poseCorrEKF.pose.pose.orientation); // set quaternion in msg from tf::Quaternion

    std::cout << "poseCorrEKF: " << std::endl << poseCorrEKF.pose.pose << std::endl;
    pub_ekfCorr.publish(poseCorrEKF);

    transform_ekf.setOrigin(tf::Vector3(poseCorrEKF.pose.pose.position.x, poseCorrEKF.pose.pose.position.y, poseCorrEKF.pose.pose.position.z));
    transform_ekf.setRotation(quat_msg);

    br.sendTransform(tf::StampedTransform(transform_ekf, ros::Time::now(), "map", "ekf"));

    if(tfEKF)
      br.sendTransform(tf::StampedTransform(tf::Transform::getIdentity(), ros::Time::now(), "ekf", "base_link")); // -------> Plug /base_link to /ekf frame

    if(logfile)
    {
      if (myfile.is_open()) // Log file
        myfile << positionCorrEKF.x << ", " << positionCorrEKF.y << std::endl;
      else std::cout << "Unable to open file"; // 
    }
    
    if (incOdom.header.stamp < incOdomPrev.header.stamp)// FIXME debugging -------> To be consistent with loop-playing
    {
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
    
    
    pub_mapElements.publish(map_elements); //Coordinates from map
    pub_mapElementIds.publish(map_ids); // ID according to order in map
    pub_obsMatches.publish(obs_matches); // match(es) of observation(s)
    ros::spinOnce();
    loop_rate.sleep();
  }
  
  return(0);
}
