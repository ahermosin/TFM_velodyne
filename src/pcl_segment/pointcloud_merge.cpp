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
#include "geometry_msgs/PoseStamped.h"
#include "geometry_msgs/Pose.h"
#include <geometry_msgs/PoseArray.h>
#include "sensor_msgs/PointCloud2.h"

sensor_msgs::PointCloud2 mensaje_i;
sensor_msgs::PointCloud2 mensaje_d;
pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_i (new pcl::PointCloud<pcl::PointXYZ>);
pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_d (new pcl::PointCloud<pcl::PointXYZ>);


void callback_i(const sensor_msgs::PointCloud2ConstPtr& input)
{
	pcl::fromROSMsg(*input, *cloud_i); // The ROS message, given as sensor_msgs::PointCloud2ConstPtr is translated to PCL type pcl::PointCloud<pcl::PointXYZ>::Ptr
} 

void callback_d(const sensor_msgs::PointCloud2ConstPtr& input)
{
	pcl::fromROSMsg(*input, *cloud_d); // The ROS message, given as sensor_msgs::PointCloud2ConstPtr is translated to PCL type pcl::PointCloud<pcl::PointXYZ>::Ptr
}  




int 
main (int argc, char** argv)
{
  ros::init(argc, argv, "point_cloud_merge");
  ros::NodeHandle nh;
  ros::Subscriber sub_i = nh.subscribe ("izq/velodyne_points", 1, callback_i);
  ros::Subscriber sub_d = nh.subscribe ("der/velodyne_points", 1, callback_d);
  ros::Publisher chatter_pub = nh.advertise<sensor_msgs::PointCloud2>("pointcloudmerged", 1);
  ros::Rate loop_rate(10);
  
  tf::TransformListener listener_i;
  tf::TransformListener listener_d;
  
  sensor_msgs::PointCloud2 mensaje_i2;
  sensor_msgs::PointCloud2 mensaje_d2;
  sensor_msgs::PointCloud2 mensaje;
  
  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_i2 (new pcl::PointCloud<pcl::PointXYZ>);
  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_d2 (new pcl::PointCloud<pcl::PointXYZ>);
  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZ>);

  ros::Time stamp_i;
  ros::Time stamp_d;
      
  tf::StampedTransform transform_i;
  tf::StampedTransform transform_d;
  tf::StampedTransform transform;
  float delay_merge;
  while (ros::ok())
  {
    
    
    ros::spinOnce();
   
   // pcl_conversions::toPCL(stamp_i, cloud_i->header.stamp);
   // pcl_conversions::toPCL(stamp_d, cloud_d->header.stamp);
 
    try{
      listener_i.lookupTransform("/base_link", "/velodyne_i", ros::Time::now(), transform_i); // Not necessarily inside the loop?
      listener_d.lookupTransform("/base_link", "/velodyne_d", ros::Time::now(), transform_d);
      listener_d.lookupTransform("/map", "/base_link", ros::Time::now(), transform);
    }
    catch (tf::TransformException ex){
      ROS_ERROR("%s",ex.what());
      ros::Duration(1.0).sleep();
    }
        
    //pcl::toROSMsg(*cloud_i, mensaje_i);
    //pcl::toROSMsg(*cloud_d, mensaje_d);
    
    pcl_ros::transformPointCloud(*cloud_i, *cloud_i2, transform_i);
    pcl_ros::transformPointCloud(*cloud_d, *cloud_d2, transform_d);
    
    //pcl::fromROSMsg(mensaje_i, *cloud_i);
    //pcl::fromROSMsg(mensaje_d, *cloud_d);
    *cloud = *cloud_i2 + *cloud_d2;

    pcl_ros::transformPointCloud(*cloud, *cloud, transform);

    pcl::toROSMsg(*cloud, mensaje);
    mensaje.header.frame_id = "map";
    mensaje.header.stamp = ros::Time::now() - ros::Duration(delay_merge); //CUIDAO AQUÍ
//    mensaje.header.stamp = ros::Time::now(); //CUIDAO AQUÍ
    chatter_pub.publish(mensaje);
    loop_rate.sleep();
  }
  return(0);
}
