#include <ros/ros.h>
#include <tf/transform_listener.h>
#include <time.h>
#include <math.h>
#include <tf/tf.h>
#include <tf/LinearMath/Quaternion.h>
#include <pcl/point_types.h>
#include <pcl/io/pcd_io.h>
#include "pcl_conversions/pcl_conversions.h"
#include <pcl_ros/transforms.h>
#include "std_msgs/Header.h"
#include "std_msgs/Float32.h"
#include "geometry_msgs/PoseStamped.h"
#include "geometry_msgs/Pose.h"
#include <geometry_msgs/PoseArray.h>
#include "sensor_msgs/PointCloud2.h"
#include <lcm_to_ros/can_coche_velocidad.h>

pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_i (new pcl::PointCloud<pcl::PointXYZ>);
pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_d (new pcl::PointCloud<pcl::PointXYZ>);
float stamp_i, stamp_d;

void callback_i(const sensor_msgs::PointCloud2ConstPtr& input)
{
  stamp_i = input->header.seq;
	pcl::fromROSMsg(*input, *cloud_i); // The ROS message, given as sensor_msgs::PointCloud2ConstPtr is translated to PCL type pcl::PointCloud<pcl::PointXYZ>::Ptr
} 

void callback_d(const sensor_msgs::PointCloud2ConstPtr& input)
{
  stamp_d = input->header.seq;
	pcl::fromROSMsg(*input, *cloud_d); // The ROS message, given as sensor_msgs::PointCloud2ConstPtr is translated to PCL type pcl::PointCloud<pcl::PointXYZ>::Ptr
}  

int 
main (int argc, char** argv)
{
  ros::init(argc, argv, "point_cloud_merge");
  ros::NodeHandle nh;
  ros::Subscriber sub_i = nh.subscribe ("izq/velodyne_points", 1, callback_i);
  ros::Subscriber sub_d = nh.subscribe ("der/velodyne_points", 1, callback_d);
  ros::Publisher pubPointcloudMerged = nh.advertise<sensor_msgs::PointCloud2>("pointcloudmerged", 1);
  ros::Rate loop_rate(20);
  
  float stamp_iPrev, stamp_dPrev;
  
  sensor_msgs::PointCloud2 PointcloudMerged;
  
  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_i2 (new pcl::PointCloud<pcl::PointXYZ>);
  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_i2Prev (new pcl::PointCloud<pcl::PointXYZ>);
  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_d2 (new pcl::PointCloud<pcl::PointXYZ>);
  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_d2Prev (new pcl::PointCloud<pcl::PointXYZ>);
  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZ>);
  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud2 (new pcl::PointCloud<pcl::PointXYZ>);

  tf::TransformListener listener_i_map;
  tf::TransformListener listener_d_map;
  tf::TransformListener listener;
      
  tf::StampedTransform transform_i_map;
  tf::StampedTransform transform_d_map;
  tf::StampedTransform transform;

  while (ros::ok())
  {  
    try
    {
      listener_i_map.lookupTransform("/map", "/velodyne_i", ros::Time(0), transform_i_map);
      listener_d_map.lookupTransform("/map", "/velodyne_d", ros::Time(0), transform_d_map);
      listener.lookupTransform("/base_link", "/map", ros::Time(0), transform);
    }
    catch (tf::TransformException ex){
      ROS_ERROR("%s",ex.what());
      ros::Duration(1.0).sleep();
    }

    if(stamp_iPrev == stamp_i && stamp_dPrev != stamp_d)                // only der updated
    {
      pcl_ros::transformPointCloud(*cloud_d, *cloud_d2, transform_d_map);
      cloud_i2 = cloud_i2Prev;
    }
    else if(stamp_iPrev != stamp_i && stamp_dPrev == stamp_d)           // only izq updated
    {
      pcl_ros::transformPointCloud(*cloud_i, *cloud_i2, transform_i_map);
      cloud_d2 = cloud_d2Prev;
    }
    else if(stamp_iPrev == stamp_i && stamp_dPrev == stamp_d) // none has updated
    {
      cloud_i2 = cloud_i2Prev;
      cloud_d2 = cloud_d2Prev;
    }
    else                                               // both have updated
    {
      pcl_ros::transformPointCloud(*cloud_d, *cloud_d2, transform_d_map);
      pcl_ros::transformPointCloud(*cloud_i, *cloud_i2, transform_i_map);
    }
    
    *cloud2 = *cloud_i2 + *cloud_d2;
    
    pcl_ros::transformPointCloud(*cloud2, *cloud, transform);
    
    pcl::toROSMsg(*cloud, PointcloudMerged);
    PointcloudMerged.header.frame_id = "base_link";
    PointcloudMerged.header.stamp = ros::Time::now();
    
    pubPointcloudMerged.publish(PointcloudMerged);

    cloud_i2Prev = cloud_i2;
    cloud_d2Prev = cloud_d2;
    stamp_iPrev = stamp_i;
    stamp_dPrev = stamp_d;
  
    ros::spinOnce();
    loop_rate.sleep();
  }
  return(0);
}
