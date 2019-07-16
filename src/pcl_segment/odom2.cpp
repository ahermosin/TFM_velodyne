#include <ros/ros.h>
#include <time.h>
#include <math.h>
#include <tf/tf.h>
#include <tf_conversions/tf_eigen.h>
#include <tf/transform_listener.h>
#include <tf/transform_broadcaster.h>
#include <tf/LinearMath/Quaternion.h>
#include <boost/foreach.hpp>
#include "sensor_msgs/PointCloud2.h"
#include "geometry_msgs/PoseStamped.h"
#include "geometry_msgs/Pose.h"
#include <visualization_msgs/Marker.h>
#include <lcm_to_ros/can_coche_direccion.h>
#include <lcm_to_ros/can_coche_velocidad.h>
#include <lcm_to_ros/gps_data.h>
#include <customFunctions.h>
#include <pcl_segment/positionRPY.h>

#include <iostream>
#include <fstream>

float_t vel;
float_t dir, turnRate, angleOffset;


void callback_vel(const lcm_to_ros::can_coche_velocidad input_vel)
{
  vel = input_vel.velocidad/3.6; //from km/h to m/s
}


void callback_dir(const lcm_to_ros::can_coche_direccion input_dir)
{
  ros::param::get("turnRate", turnRate); // debugging
  ros::param::get("angleOffset", angleOffset); // debugging
  dir = ((input_dir.angulo_volante - angleOffset)/turnRate)*3.141592/180.0; //from degrees to rads
}



int 
main (int argc, char** argv)
{
  ros::init(argc, argv, "odometry2");
  ros::NodeHandle nh;
  ros::Subscriber sub_vel = nh.subscribe ("/lcm_to_ros/CAN_COCHE_VELOCIDAD", 1, callback_vel);
  ros::Subscriber sub_dir = nh.subscribe ("/lcm_to_ros/CAN_COCHE_DIRECCION", 1, callback_dir);
  ros::Publisher pub_poseOdom = nh.advertise <geometry_msgs::PoseStamped>("poseOdom", 1);
  ros::Publisher pub_incOdom = nh.advertise <geometry_msgs::PoseStamped>("incOdom", 1);
  ros::Publisher pub_odomStrip = nh.advertise<visualization_msgs::Marker>("odom_strip", 1); // debugging
  float loopRate = 100.0;
  ros::Rate loop_rate(loopRate);
  ros::Time initTime = ros::Time::now();
  ros::Time currentTime;
  
  float easting_ref, northing_ref;
  ros::param::get("easting_ref", easting_ref);
  ros::param::get("northing_ref", northing_ref);
  
  pcl_segment::positionRPY zeroRPY;
  pcl_segment::positionRPY odomRPY;
  pcl_segment::positionRPY odomPrevRPY;
  pcl_segment::positionRPY incOdomRPY;
  
  zeroRPY.x = 0.0;
  zeroRPY.y = 0.0;
  zeroRPY.z = 0.0;
  zeroRPY.roll = 0.0;
  zeroRPY.pitch = 0.0;
  zeroRPY.yaw = 0.0;
  
//  odomRPY = zeroRPY;
//  odomPrevRPY = zeroRPY;
  ros::param::get("x_init", odomRPY.x);
  ros::param::get("y_init", odomRPY.y);
  ros::param::get("z_init", odomRPY.z);
  ros::param::get("roll_init", odomRPY.roll);
  ros::param::get("pitch_init", odomRPY.pitch);
  ros::param::get("yaw_init", odomRPY.yaw);
  odomRPY.yaw = odomRPY.yaw*3.141592/180.0;
  odomPrevRPY = odomRPY;
  incOdomRPY = zeroRPY;
  
  geometry_msgs::PoseStamped poseZero;
  geometry_msgs::PoseStamped poseOdom;
  geometry_msgs::PoseStamped poseOdomPrev;
  geometry_msgs::PoseStamped incOdom;
  visualization_msgs::Marker odomStrip;
  geometry_msgs::Point odomPoint;

  tf::pointTFToMsg (tf::Point(0.0, 0.0, 0.0), poseZero.pose.position);
  poseZero.pose.orientation = tf::createQuaternionMsgFromRollPitchYaw(0.0, 0.0, 0.0);
  poseZero.header.stamp = initTime;
  poseZero.header.frame_id = "map";

  poseOdom = poseZero;
  poseOdomPrev = poseZero;
  incOdom = poseZero;  
  
  odomStrip.type = visualization_msgs::Marker::LINE_STRIP;
  odomStrip.action = visualization_msgs::Marker::ADD;
  odomStrip.header.frame_id = "map";
  odomStrip.ns = "odom_rviz";
  odomStrip.id = 0;
  odomStrip.pose.orientation.w = 1.0;
  odomStrip.scale.x = 0.1;
  odomStrip.color.r = 1.0;
  odomStrip.color.g = 0.0;
  odomStrip.color.b = 1.0;
  odomStrip.color.a = 1.0;
  
  
  float dT = 1.0/loopRate;
  double theta, thetaPrev;
  ros::param::get("yaw_init", thetaPrev);
  thetaPrev = thetaPrev*3.141592/180.0;
  float_t wheelsL;
  vel = 0.0;
  dir = 0.0;
  
  bool tfEKF;
  bool logfile;
  bool reset = false;
  
  tf::Quaternion q;
  tf::TransformBroadcaster br;
  tf::StampedTransform transform_odom(tf::Transform::getIdentity(), initTime, "map", "odom"); // Initialization;
  
  ros::param::get("wheelsL", wheelsL); // debugging
  ros::param::get("tfEKF", tfEKF); // debugging
  ros::param::get("logfile", logfile); // debugging
  FILE * myfile;
  if(logfile)
    myfile = fopen ("/home/alberto/workspaces/workspace14diciembre/logOdom.txt", "w");
  
  tf::StampedTransform transform_odomPrev(tf::Transform::getIdentity(), initTime, "map", "odom"); // Initialization
  
  while (ros::ok())
  {
    if(reset) // FIXME debugging
    {
      vel = 0.0;
      dir = 0.0; // --------------------------------> Avoid residual messages from previous replay
    }
    std::cout << "dir (degrees): " << dir*180.0/3.141592 << std::endl;
    std::cout << "vel: " << vel << std::endl;
    std::cout << "thetaPrev (degrees): " << thetaPrev*180.0/3.141592 << std::endl;
    theta = thetaPrev - vel*dT/wheelsL*tan(dir); // ----------------------------------------------> Ackermann's model: (heading angle)
    std::cout << "theta (degrees): " << theta*180.0/3.141592 << std::endl;
    
    incOdomRPY.x = vel*dT*cos(theta - thetaPrev);
    std::cout << "incOdomRPY.x: " << incOdomRPY.x << std::endl;
    incOdomRPY.y = vel*dT*sin(theta - thetaPrev);
    std::cout << "incOdomRPY.y: " << incOdomRPY.y << std::endl;
    incOdomRPY.z = 0.0;
    incOdomRPY.yaw = -vel*dT/wheelsL*tan(dir);
    
    std::cout << "odomPrevRPY: " << std::endl << odomPrevRPY << std::endl;
    std::cout << "incOdomRPY: " << std::endl << incOdomRPY << std::endl;

    odomRPY = Comp(odomPrevRPY, incOdomRPY);
    
    std::cout << "odomRPY: " << std::endl << odomRPY << std::endl;
 
    q.setRPY(0.0, 0.0, -theta);
    
    transform_odom.setOrigin(tf::Vector3(odomRPY.x, odomRPY.y, 0.0));
    transform_odom.setRotation(q);
    
    odomPoint.x = odomRPY.x;
    odomPoint.y = odomRPY.y;
    odomPoint.z = odomRPY.z;
    odomStrip.points.push_back(odomPoint);
    pub_odomStrip.publish(odomStrip);
    
    br.sendTransform(tf::StampedTransform(transform_odom, ros::Time::now(), "map", "odom"));
    
    if(!tfEKF)
      br.sendTransform(tf::StampedTransform(tf::Transform::getIdentity(), ros::Time::now(), "odom", "base_link")); // -------> Plug /base_link to /odom frame (Identity Transform)
    
    
    if(logfile)
      fprintf(myfile, "%f , %f\n", odomRPY.x, odomRPY.y);
    
    if(poseOdom.header.stamp < poseOdomPrev.header.stamp) // FIXME debugging -------> To be consistent with loop-playing
    {
      reset = true;
      transform_odomPrev = tf::StampedTransform(tf::Transform::getIdentity(), initTime, "map", "odom");
      transform_odom = tf::StampedTransform(tf::Transform::getIdentity(), initTime, "map", "odom");
      poseOdom = poseZero;
      poseOdomPrev = poseZero;
      incOdom = poseZero;

      odomRPY = zeroRPY;
      odomPrevRPY = zeroRPY;
      incOdomRPY = zeroRPY;

      thetaPrev = 0.0;
      theta = 0.0;
      dir = 0.0;
      vel = 0.0;
      odomStrip.points = {};
    }
    else
    {
      odomPrevRPY = odomRPY;
      transform_odomPrev = transform_odom;
      poseOdomPrev = poseOdom;
      thetaPrev = theta;
    }
    
    ros::spinOnce();
    loop_rate.sleep();
  }
  return(0);
}
