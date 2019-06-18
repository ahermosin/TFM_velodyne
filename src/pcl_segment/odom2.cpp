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
#include <customFunctions.h>

#include <iostream>
#include <fstream>

std::ofstream myfile ("logOdom.txt");
float_t vel;
float_t dir, turnRate, angleOffset;

void callback_vel(const lcm_to_ros::can_coche_velocidad input_vel)
{
  vel = input_vel.velocidad/3.6; //from km/h to m/s
}


void callback_dir(const lcm_to_ros::can_coche_direccion input_dir)
{
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
  float_t wheelsL;
  thetaPrev = 0.0;
  vel = 0.0;
  dir = 0.0;
  
  bool tfEKF;
  bool logfile;
  bool reset = false;
  
  tf::Quaternion q;
  tf::TransformBroadcaster br;
  tf::StampedTransform transform_odom(tf::Transform::getIdentity(), initTime, "map", "odom"); // Initialization;
  tf::StampedTransform transform_odomPrev(tf::Transform::getIdentity(), initTime, "map", "odom"); // Initialization
  
  while (ros::ok())
  {
//    ros::spinOnce();
    if(reset) // FIXME debugging
    {
      std::cout << poseOdomPrev << std::endl;
      std::cout << poseOdom << std::endl;      
      std::cout << theta << std::endl;
      std::cout << thetaPrev << std::endl;
      std::cout << vel << std::endl;
      std::cout << dir << std::endl;
      vel = 0.0;
      dir = 0.0; // --------------------------------> Avoid residual messages from previous replay
    }
    
    ros::param::get("turnRate", turnRate); // debugging
    ros::param::get("wheelsL", wheelsL); // debugging
    ros::param::get("tfEKF", tfEKF); // debugging
    ros::param::get("logfile", logfile); // debugging
    
    currentTime = ros::Time::now();
    
    theta = thetaPrev + vel*dT/wheelsL*tan(dir); // ----------------------------------------------> Ackermann's model: (heading angle)
//    theta = ((double)((int)(theta*10000.0)))/10000.0;                               // --------------> 4 decimals
    incOdom.pose.position.x = vel*dT*cos(theta);
    incOdom.pose.position.y = vel*dT*sin(theta);
    incOdom.pose.position.z = 0.0;
    q.setRPY(0.0, 0.0, vel*dT/wheelsL*tan(dir));
    tf::quaternionTFToMsg(q, incOdom.pose.orientation);
    incOdom.header.stamp = ros::Time::now();
    /*
    std::cout << "time: " << ros::Time::now() << std::endl;
    std::cout << "theta: " << theta << std::endl;
    std::cout << "thetaPrev: " << thetaPrev << std::endl;
    std::cout << "vel: " << vel << std::endl;
    std::cout << "dir: " << dir << std::endl;
    std::cout << "x: " << incOdom.pose.position.x << std::endl;
    std::cout << "y: " << incOdom.pose.position.y << std::endl;
    */
    pub_incOdom.publish(incOdom); // --------------------> Difference between poseOdomPrev and poseOdom. Should be around /map frame
    
    q.setRPY(0.0, 0.0, theta);                                                                                         // conversion RPY to Quaternion
    tf::quaternionTFToMsg(q, poseOdom.pose.orientation);                                                               // conversion RPY to Quaternion
    poseOdom.pose.position.x = poseOdomPrev.pose.position.x + vel*dT*cos(theta); // -------------->                       Ackermann's model (x position)
    poseOdom.pose.position.y = poseOdomPrev.pose.position.y + vel*dT*sin(theta); // -------------->                       Ackermann's model (y position)
    poseOdom.pose.position.z = poseOdomPrev.pose.position.z + 0.0; // ---------------------------->                       Ackermann's model (z position) -> ignoring
    poseOdom.header.stamp = ros::Time::now();
    
    pub_poseOdom.publish(poseOdom); // -----------------> Should match /odom frame CHECKED
    
    transform_odom.setOrigin(tf::Vector3(poseOdom.pose.position.x, poseOdom.pose.position.y, 0.0));
    transform_odom.setRotation(q);
    
    
    odomPoint.x = poseOdom.pose.position.x;
    odomPoint.y = poseOdom.pose.position.y;
    odomPoint.z = poseOdom.pose.position.z;
    odomStrip.points.push_back(odomPoint);
    pub_odomStrip.publish(odomStrip);
    
    br.sendTransform(tf::StampedTransform(transform_odom, ros::Time::now(), "map", "odom")); //FIXME +ros::Duration(0.2) due to negative time doing tf from rosbag. Remove for further implementation
    
    if(!tfEKF)
      br.sendTransform(tf::StampedTransform(tf::Transform::getIdentity(), ros::Time::now(), "odom", "base_link")); // -------> Plug /base_link to /odom frame (Identity Transform)
    
    
    if(logfile)                                                                                                                                                                     //
    {                                                                                                                                                                               //
      if (myfile.is_open()) // Log file                                                                                                                                             //
        myfile << poseOdom.pose.position.x << ", " << poseOdom.pose.position.y << std::endl;                                                                                                      //
      else std::cout << "Unable to open file"; // ----------------------------------------------------------------------------------------------------------------------------------//
    }
    
    
    if(reset) // FIXME debugging
    {
      std::cout << poseOdom << std::endl;
      reset = false;
    }
      
    if(poseOdom.header.stamp < poseOdomPrev.header.stamp) // FIXME debugging -------> To be consistent with loop-playing
    {
      reset = true;
      transform_odomPrev = tf::StampedTransform(tf::Transform::getIdentity(), initTime, "map", "odom");
      transform_odom = tf::StampedTransform(tf::Transform::getIdentity(), initTime, "map", "odom");
      poseOdom = poseZero;
      poseOdomPrev = poseZero;
      incOdom = poseZero;  
      thetaPrev = 0.0;
      theta = 0.0;
      dir = 0.0;
      vel = 0.0;
      odomStrip.points = {};
    }
    else
    {
      transform_odomPrev = transform_odom;
      poseOdomPrev = poseOdom;
      thetaPrev = theta;
    }
    
    
    
    ros::spinOnce();
    loop_rate.sleep();
  }
  return(0);
}
