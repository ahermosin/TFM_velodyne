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
float vel;
float dir, turnRate, angleOffset;
geometry_msgs::PoseStamped poseGround;

void callback_ground(const geometry_msgs::PoseStamped input_ground)
{
  poseGround = input_ground;
}


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
  ros::init(argc, argv, "odometry");
  ros::NodeHandle nh;
  ros::Subscriber sub_vel = nh.subscribe ("/lcm_to_ros/CAN_COCHE_VELOCIDAD", 1, callback_vel);
  ros::Subscriber sub_dir = nh.subscribe ("/lcm_to_ros/CAN_COCHE_DIRECCION", 1, callback_dir);
  ros::Subscriber sub_ground = nh.subscribe ("poseGround", 1, callback_ground);
  ros::Publisher pub_odom_strip = nh.advertise<visualization_msgs::Marker>("odom_strip", 1); // debugging
  ros::Publisher pub_incOdom = nh.advertise<geometry_msgs::TransformStamped>("incOdom", 50); // debugging
  ros::Publisher pub_incPositionOdom = nh.advertise<pcl_segment::positionRPY>("incPositionOdom", 1); // debugging
  float loopRate = 10.0;
  ros::Rate loop_rate(loopRate);
  
  tf::TransformBroadcaster br;
  tf::Transform transform_br;
  tf::Transform transform_brPrev;
  tf::Quaternion q_br;

  bool tfEKF;
  bool logfile;

  geometry_msgs::PoseStamped pose;
  geometry_msgs::PoseStamped posePrev;
  geometry_msgs::PoseStamped incPose;
  
  pcl_segment::positionRPY odomPos;
  pcl_segment::positionRPY odomPosPrev;
  pcl_segment::positionRPY incOdomPos;
  
  geometry_msgs::Point point_aux;
  visualization_msgs::Marker vis_odom_strip;

  pose.header.frame_id = "map";
  
  posePrev.pose.position.x = 0.0;
  posePrev.pose.position.y = 0.0;
  posePrev.pose.position.z = 0.0;
  posePrev.pose.orientation.x = 0.0;
  posePrev.pose.orientation.y = 0.0;
  posePrev.pose.orientation.z = 0.0;
  posePrev.pose.orientation.w = 1.0;
  posePrev.header.frame_id = "map";

  odomPosPrev.x = 0.0;
  odomPosPrev.y = 0.0;
  odomPosPrev.z = 0.0;
  odomPosPrev.roll = 0.0;
  odomPosPrev.pitch = 0.0;
  odomPosPrev.yaw = 0.0;
  
  vis_odom_strip.type = visualization_msgs::Marker::LINE_STRIP;
  vis_odom_strip.action = visualization_msgs::Marker::ADD;
  vis_odom_strip.header.frame_id = "map";
  vis_odom_strip.ns = "odom_rviz";
  vis_odom_strip.id = 0;
  vis_odom_strip.pose.orientation.w = 1.0;
  vis_odom_strip.scale.x = 0.1;
  vis_odom_strip.color.r = 1.0;
  vis_odom_strip.color.g = 0.0;
  vis_odom_strip.color.b = 1.0;
  vis_odom_strip.color.a = 1.0;
  
  float dT = 1.0/loopRate;
  float theta, thetaPrev;
  float wheelsL, wheelsA;
  float dirPrev=0.0;
  float lidarHeight;
  theta = 0.0;
  thetaPrev = 0.0;
  
  //clock_t t1, t2;
  
  float thetaq, u[3];
  tf::Quaternion q;
  geometry_msgs::Quaternion orientation_aux;
  
  tf::TransformListener listener;
  tf::StampedTransform transform;
  tf::StampedTransform transformPrev;
  tf::StampedTransform incOdom;
  tf::StampedTransform transform_br_msg;
  tf::StampedTransform transform_br_msgPrev;
  geometry_msgs::TransformStamped msg_incOdom;
  geometry_msgs::TransformStamped msg_incOdomPrev;
  msg_incOdom.header.frame_id = "map";
  msg_incOdomPrev.header.frame_id = "map";
  
  try{
    listener.lookupTransform("map", "base_link", ros::Time::now(), transform);
  }
  catch (tf::TransformException ex){
    ROS_ERROR("%s",ex.what());
    ros::Duration(1.0).sleep();
  }
  
  transformPrev = transform; // initial value
  
  while (ros::ok())
  {
    ros::param::get("turnRate", turnRate); // debugging
    ros::param::get("wheelsL", wheelsL); // debugging
    ros::param::get("wheelsA", wheelsA); // debugging
    ros::param::get("lidarHeight", lidarHeight);
    ros::param::get("tfEKF",tfEKF);
    ros::param::get("logfile",logfile);
//    ros::spinOnce();
    
    try{
      listener.lookupTransform("map", "base_link",  
                               ros::Time::now(), transform);
    }
    catch (tf::TransformException ex){
      ROS_ERROR("%s",ex.what());
      ros::Duration(1.0).sleep();
    }
    
    theta = thetaPrev + vel*dT/wheelsL*tan(dir); // --------------> Ackermann's model
    
    pose.pose.position.x = posePrev.pose.position.x + vel*dT*cos(theta); // --------------> Ackermann's model
    pose.pose.position.y = posePrev.pose.position.y + vel*dT*sin(theta); // --------------> Ackermann's model
    
    pose.pose.position.z = (lidarHeight-poseGround.pose.position.z)*0.0;
    pose.header.stamp = ros::Time::now();
    
    
    u[0] = 0.0; // --------------> Approximation. Absolutely flat ground hypothesis
    u[1] = 0.0;
    u[2] = 1.0;
    
    q = {sin(theta/2)*u[0], sin(theta/2)*u[1], sin(theta/2)*u[2], cos(theta/2)};  // We need to translate this information into quaternion form
    
    tf::quaternionTFToMsg(q, orientation_aux);
    
    pose.pose.orientation.x = orientation_aux.x; // Finally, the quaternion is introduced in the pose message, that will eventually be sent
    pose.pose.orientation.y = orientation_aux.y;
    pose.pose.orientation.z = orientation_aux.z;
    pose.pose.orientation.w = orientation_aux.w;
    
    transform_br.setOrigin(tf::Vector3(pose.pose.position.x, pose.pose.position.y, 0.0*pose.pose.position.z));
    tf::quaternionMsgToTF(pose.pose.orientation, q_br);
    transform_br.setRotation(q_br);
    
    incOdom.mult(transformPrev.inverse(),transform); // -----------------------> incOdom calculation as Transform
    
    tf::transformStampedTFToMsg(incOdom, msg_incOdom);
    
//    tf::transformTFToMsg(transform_brPrev, transform_br_msgPrev);
//    tf::transformTFToMsg(transform_br, transform_br_msg);
    
    br.sendTransform(tf::StampedTransform(transform_br, ros::Time::now() + ros::Duration(0.2), "map", "odom")); //FIXME ros::Duration(0.2) due to negative time doing tf from rosbag. Remove for further implementation
    
    transform_br.setOrigin(tf::Vector3(0.0, 0.0, 0.0));
    transform_br.setRotation(tf::Quaternion(tfScalar(0.0), tfScalar(0.0), tfScalar(0.0), tfScalar(1.0)));
    
    if(!tfEKF)
      br.sendTransform(tf::StampedTransform(transform_br, ros::Time::now() + ros::Duration(0.2), "odom", "base_link"));
    
    odomPos.x = odomPosPrev.x + vel*dT*cos(theta);    
    odomPos.y = odomPosPrev.y + vel*dT*sin(theta);    
    odomPos.z = 0.0; // --------------> Approximation. Absolutely flat ground hypothesis
    tf::Matrix3x3 quaternionToRPY(q);
    quaternionToRPY.getRPY(odomPos.yaw, odomPos.pitch, odomPos.roll);    
    
    
    msg_incOdom.header.stamp = ros::Time::now();
    msg_incOdomPrev.header.stamp = ros::Time::now();
        
    std::cout << "msg_incOdomPrev:" << std::endl << msg_incOdomPrev << std::endl;
    std::cout << "msg_incOdom:" << std::endl << msg_incOdom << std::endl;
    
    pub_incOdom.publish(msg_incOdom);
    incOdomPos.stamp = ros::Time::now();
    pub_incPositionOdom.publish(incOdomPos);
    
    incOdomPos = Comp(coordRPY(createHomogMatrInv(odomPosPrev)), odomPos); // -------------------------> incOdomPos calculation as pcl_segment::positionRPY
    
    
    transform_br.setOrigin(tf::Vector3(incOdomPos.x, incOdomPos.y, 0.0));
    transform_br.setRotation(q);    
    
    std::cout << "posePrev:" << std::endl << posePrev << std::endl;
    std::cout << "pose:" << std::endl << pose << std::endl;
    
    br.sendTransform(tf::StampedTransform(transform_br, ros::Time::now() + ros::Duration(0.2), "base_link", "base_link_fut")); //FIXME ros::Duration(0.2) due to negative time doing tf from rosbag. Remove for further implementation

        
    point_aux.x = pose.pose.position.x;
    point_aux.y = pose.pose.position.y;
    point_aux.z = 1.0*pose.pose.position.z;
    vis_odom_strip.points.push_back(point_aux);
    
    if (logfile)
    {
      if (myfile.is_open()) // Log file
      {
        myfile << point_aux.x << ", " << point_aux.y << std::endl;
      }
      else std::cout << "Unable to open file";
    }
    

    pub_odom_strip.publish(vis_odom_strip);
    

    if(pose.header.stamp < posePrev.header.stamp) // FIXME debugging
    {
      posePrev.header.stamp = pose.header.stamp;
      posePrev.pose = pose.pose;
      msg_incOdomPrev = msg_incOdom;
      transform_brPrev = transform_br;
      posePrev.pose.position.x = 0.0;
      posePrev.pose.position.y = 0.0;
      posePrev.pose.position.x = 0.0;
      posePrev.pose.orientation.x = 0.0;
      posePrev.pose.orientation.y = 0.0;
      posePrev.pose.orientation.z = 0.0;
      posePrev.pose.orientation.w = 1.0;
      
      odomPosPrev.x = 0.0;
      odomPosPrev.y = 0.0;
      odomPosPrev.z = 0.0;
      odomPosPrev.roll = 0.0;
      odomPosPrev.pitch = 0.0;
      odomPosPrev.yaw = 0.0;
      
      thetaPrev = 0.0;
      vis_odom_strip.points = {};
    } else
    {
      msg_incOdomPrev = msg_incOdom;
      posePrev.pose = pose.pose;
      posePrev.header.stamp = pose.header.stamp;
      dirPrev = dir;
      thetaPrev = theta;
      transformPrev = transform;
    }
    ros::spinOnce();
    loop_rate.sleep();
  }
  return(0);
}
