#include <ros/ros.h>
#include <time.h>
#include <math.h>
#include <tf/tf.h>
#include <tf/transform_listener.h>
#include <tf/LinearMath/Quaternion.h>
#include <boost/foreach.hpp>
#include "sensor_msgs/PointCloud2.h"
#include "nav_msgs/Path.h"
#include "geometry_msgs/PoseStamped.h"
#include "geometry_msgs/Pose.h"
#include <geometry_msgs/PoseArray.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include <lcm_to_ros/can_coche_direccion.h>
#include <lcm_to_ros/can_coche_velocidad.h>

nav_msgs::Path mypath;
float vel;
float dir, turnRate;

void callback_vel(const lcm_to_ros::can_coche_velocidad input_vel)
{
  vel = input_vel.velocidad/3.6; //from km/h to m/s
}


void callback_dir(const lcm_to_ros::can_coche_direccion input_dir)
{
  dir = input_dir.angulo_volante/turnRate*3.141592/180.0; //from degrees to rads?
}



int 
main (int argc, char** argv)
{
  ros::init(argc, argv, "path_stuff");
  ros::NodeHandle nh; 
  ros::Subscriber sub_vel = nh.subscribe ("/lcm_to_ros/CAN_COCHE_VELOCIDAD", 1, callback_vel);
  ros::Subscriber sub_dir = nh.subscribe ("/lcm_to_ros/CAN_COCHE_DIRECCION", 1, callback_dir);
//  ros::Publisher pub_path = nh.advertise<nav_msgs::Path>("mypath", 1);
  ros::Publisher pub_poses = nh.advertise<geometry_msgs::PoseStamped>("myposes", 10);
  ros::Rate loop_rate(100);
  geometry_msgs::PoseStamped pose;
//  geometry_msgs::Pose pose_aux;
  
  float dT = 0.01;
  float xn, yn, theta, xnPrev, ynPrev, thetaPrev, h;
  float wheelsL, wheelsA;
  float deltaD1, deltaD2, deltaD;
  float dirPrev=0.0;
  xn = 0.0;
  yn = 0.0;
  theta = 0.0;
  xnPrev = 0.0;
  ynPrev = 0.0;
  thetaPrev = 0.0;
  ros::param::get("turnRate", turnRate);
  
  //clock_t t1, t2;
  
  float thetaq, u[3];
  tf::Quaternion q;
  geometry_msgs::Quaternion orientation_aux;
  
  tf::TransformListener listener;
  tf::StampedTransform transform;
  
  while (ros::ok())
  {
    //t1 = clock();
    ros::param::get("turnRate", turnRate); // debugging
    ros::param::get("wheelsL", wheelsL); // debugging
    ros::param::get("wheelsA", wheelsA); // debugging
    
    try{
      listener.lookupTransform("map", "base_link",  
                               ros::Time(0), transform);
    }
    catch (tf::TransformException ex){
      ROS_ERROR("%s",ex.what());
      ros::Duration(1.0).sleep();
    }
    
    ros::spinOnce();
    
    /*
    h = wheelsL/tan(dir) + wheelsA/2.0;
    
    deltaD1 = (dir - dirPrev) * (h - wheelsA);
    deltaD2 = (dir - dirPrev) * (h);
        
    deltaD = (dir - dirPrev) * (h - wheelsA/2.0);
    
    xn = xnPrev + vel*dT*cos(theta);
    yn = ynPrev + vel*dT*sin(theta);
    */
    
    theta = thetaPrev + vel*dT/wheelsL*tan(dir);
    xn = xnPrev + vel*dT*cos(theta);
    yn = ynPrev + vel*dT*sin(theta);
    
    
    
    
    pose.header.frame_id = "map";
    pose.header.stamp = ros::Time::now();
    
    pose.pose.position.x = xn;
    pose.pose.position.y = yn;
    pose.pose.position.z = 0.0;
    
    u[0] = 0.0;
    u[1] = 0.0;
    u[2] = 1.0;
    
    thetaq = theta;
    
    q = {sin(thetaq/2)*u[0], sin(thetaq/2)*u[1], sin(thetaq/2)*u[2], cos(thetaq/2)};  // We need to translate this information into quaternion form
    
    tf::quaternionTFToMsg(q, orientation_aux);
    
    pose.pose.orientation.x = orientation_aux.x; // Finally, the quaternion is introduced in the pose message, that will eventually be sent
    pose.pose.orientation.y = orientation_aux.y;
    pose.pose.orientation.z = orientation_aux.z;
    pose.pose.orientation.w = orientation_aux.w;
    
    std::cout << pose << std::endl;
    pub_poses.publish(pose);

    if(abs(vel) <= 0.01) // FIXME debugging
    {
      xnPrev = 0.0;
      ynPrev = 0.0;
      thetaPrev = 0.0;
    } else
    {
      dirPrev = dir;
      xnPrev = xn;
      ynPrev = yn;
      thetaPrev = theta;
    }
    //t2 = clock();
    //std::cout << "Calculated in " << 1000.0*((float)(t2-t1))/CLOCKS_PER_SEC << " ms" << std::endl;
    loop_rate.sleep();
  }
  return(0);
}
