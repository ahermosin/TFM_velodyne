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
#include "nav_msgs/Path.h"
#include "geometry_msgs/PoseStamped.h"
#include "geometry_msgs/PolygonStamped.h"
#include "geometry_msgs/Polygon.h"
#include "geometry_msgs/Pose.h"
#include <geometry_msgs/PoseArray.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include <lcm_to_ros/gps_data.h>
#include <std_msgs/Float64.h>
#include <Eigen/Dense>
#include <iostream>
#include <fstream>
#include "pugixml.hpp"

FILE * myfile;
FILE * myfileRaw;
double GPS_x_init, GPS_y_init, GPS_z_init;

bool init;
lcm_to_ros::gps_data GPSData;

void callback_GPS(const lcm_to_ros::gps_data input_GPS)
{
  if(!init){
    GPS_x_init = input_GPS.utm_este;
    GPS_y_init = input_GPS.utm_norte;
    GPS_z_init = input_GPS.altura;    
    init = true;
  }
  
  GPSData = input_GPS;
}


int 
main (int argc, char** argv)
{
  ros::init(argc, argv, "ground_truth");
  ros::NodeHandle nh;
  ros::Subscriber sub_GPS = nh.subscribe ("/lcm_to_ros/GPS_DATA", 1, callback_GPS);
  ros::Publisher pub_GPSStrip = nh.advertise<visualization_msgs::Marker>("GPS_strip", 1); // debugging
  ros::Rate loop_rate(20);
  
  lcm_to_ros::gps_data GPSDataPrev;
  
  geometry_msgs::Point GPSPoint;
  visualization_msgs::Marker GPSStrip;
  
  GPSStrip.type = visualization_msgs::Marker::LINE_STRIP;
  GPSStrip.action = visualization_msgs::Marker::ADD;
  GPSStrip.header.frame_id = "map";
  GPSStrip.ns = "gps_rviz";
  GPSStrip.id = 0;
  GPSStrip.pose.orientation.w = 1.0;
  GPSStrip.scale.x = 0.1;
  GPSStrip.color.r = 0.0;
  GPSStrip.color.g = 1.0;
  GPSStrip.color.b = 0.0;
  GPSStrip.color.a = 1.0;

  init = false;
  
  float_t x_init, y_init, z_init;
  
  tf::StampedTransform transform_GPS(tf::Transform::getIdentity(), ros::Time::now(), "map", "GPS"); // Initialization;
  tf::TransformBroadcaster br;
  
  bool tfGPS, tfEKF;
  bool logfile;
  int test;
  ros::param::get("test", test);
  
  Eigen::Matrix2f rotation;
  
  /*
  Direction of GPS on its first values. To rotate GPS to match the rest, we take "-rotation"
  rotation = cos(theta) -sin(theta) -------> -rotation = cos(-theta)   -sin(-theta)    =     cos(theta)  sin(theta)
             sin(theta)  cos(theta)                      sin(-theta)    cos(-theta)         -sin(theta)  cos(theta)
  */
  float theta;
  if (test==1)  
    theta = 7.4*(3.141592/180.0);   // ------------> Empirical (debugging)
  else if (test==2)
    theta = 5.4*(3.141592/180.0);   // ------------> Empirical (debugging)
    
  rotation << cos(theta), sin(theta),
              -sin(theta), cos(theta);

  myfile = fopen ("/home/alberto/workspaces/workspace14diciembre/logGPS.txt","w");
  myfileRaw = fopen ("/home/alberto/workspaces/workspace14diciembre/logGPSRaw.txt","w");
  while (ros::ok())
  {
    ros::param::get("tfGPS", tfGPS);
    ros::param::get("tfEKF", tfEKF);
    ros::param::get("logfile", logfile);
    
    GPSPoint.x = (GPSData.utm_este - GPS_x_init)*rotation(0,0) + (GPSData.utm_norte - GPS_y_init)*rotation(1,0);
    GPSPoint.y = (GPSData.utm_este - GPS_x_init)*rotation(0,1) + (GPSData.utm_norte - GPS_y_init)*rotation(1,1);
    GPSPoint.z = 0.0;
    
    transform_GPS.setOrigin(tf::Vector3(GPSPoint.x, GPSPoint.y , GPSPoint.z));
    transform_GPS.setRotation(tf::Quaternion(tfScalar(0.0), tfScalar(0.0), tfScalar(0.0), tfScalar(1.0)));
    br.sendTransform(tf::StampedTransform(transform_GPS, ros::Time::now(), "map", "GPS"));
    GPSStrip.points.push_back(GPSPoint);
    pub_GPSStrip.publish(GPSStrip);
    
    if (logfile)
    {
      if (init){
        fprintf(myfile, "%.16f ", GPSData.utm_este - GPS_x_init);
        fprintf(myfile, "%.16f ", GPSData.utm_norte - GPS_y_init);
        fprintf(myfile, "%.16f ", GPSData.altura - GPS_z_init);
        fprintf(myfile, "%d\n", GPSData.calidad);
        fprintf(myfileRaw, "%.16f ", GPSData.utm_este);
        fprintf(myfileRaw, "%.16f ", GPSData.utm_norte);
        fprintf(myfileRaw, "%.16f ", GPSData.altura);
        fprintf(myfileRaw, "%d\n", GPSData.calidad);
      }
    }

    if(GPSData.timestamp_sec*1.0 + GPSData.timestamp_nsec/(1.0e9) < GPSDataPrev.timestamp_sec*1.0 + GPSDataPrev.timestamp_nsec/(1e9))
    {
      GPSStrip.points = {};
      GPSDataPrev = GPSData;
    }
    else
    {
      GPSDataPrev = GPSData;
    }
      
    ros::spinOnce();
    loop_rate.sleep();
  }
  return(0);
}
