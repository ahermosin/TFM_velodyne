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

sensor_msgs::PointCloud2 PCMessage;
pcl::PointCloud<pcl::PointXYZ>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZ>), cloudCollect (new pcl::PointCloud<pcl::PointXYZ>);
int nCollect, nCollectPrev;
std::vector < pcl::PointCloud<pcl::PointXYZ>::Ptr > clouds = {};

tf::StampedTransform transform;
tf::StampedTransform transform2;

void callback_tf(const geometry_msgs::TransformStamped input)
{
  tf::transformStampedMsgToTF(input, transform);
}

void callback(const sensor_msgs::PointCloud2ConstPtr& input)
{
  ros::param::get("nCollect", nCollect); // debugging
	pcl::fromROSMsg(*input, *cloud); // The ROS message, given as sensor_msgs::PointCloud2ConstPtr is translated to PCL type pcl::PointCloud<pcl::PointXYZ>::Ptr
	int i;
	//std::cout << "flag 0" << std::endl;
	pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_2 (new pcl::PointCloud<pcl::PointXYZ>);
	  
	pcl_ros::transformPointCloud(*cloud, *cloud_2, transform.inverse());

  
	if(nCollect == nCollectPrev)
	{
	//std::cout << "flag 1" << std::endl;
	
    clouds.insert(clouds.begin(), cloud_2);
    if (clouds.size() > nCollect) // sliding window of size nCollect
      clouds.resize(nCollect);

   // std::cout << "cloud->size(): " << cloud->size() << std::endl;
   // std::cout << "cloud_2->size(): " << cloud_2->size() << std::endl;
  //  std::cout << "clouds.size: " << clouds.size() << std::endl;
    
    for (i = 0; i < clouds.size(); i++)
    //  std::cout << "clouds["<<i<<"]->points.size() " << clouds[i]->points.size() << std::endl;

	  	  //	std::cout << "flag 1c" << std::endl;

	  //*clouds[i] = *cloud;
	  	  //	std::cout << "flag 1d" << std::endl;

	  cloudCollect->clear();
	  for(i = 0; i < clouds.size(); i++)
	  {
	  	//  	std::cout << "flag 1e" << std::endl;

	        *cloudCollect = *cloudCollect + *clouds[i];
	  //	  	std::cout << "flag 1f" << std::endl;

	  }
	  
	//  std::cout << cloudCollect->size() << std::endl;
	  
	} else if (nCollect > nCollectPrev)
	{
//	std::cout << "flag 2" << std::endl;
	  // avoid duplications of point clouds
	}
		  	//std::cout << "flag 1g" << std::endl;

  //pcl_ros::transformPointCloud(*cloudCollect, *cloudCollect, transform);
	pcl::toROSMsg(*cloudCollect, PCMessage);
		  //	std::cout << "flag 1h" << std::endl;
		  

} 




int 
main (int argc, char** argv)
{
  ros::init(argc, argv, "point_cloud_collect");
  ros::NodeHandle nh;
  ros::Subscriber sub = nh.subscribe ("/pointcloudmerged", 1, callback);
  ros::Subscriber sub_tf = nh.subscribe ("/incOdom", 1, callback_tf);
  ros::Publisher chatter_pub = nh.advertise<sensor_msgs::PointCloud2>("pointcloudcollected", 1);
  ros::Rate loop_rate(10);
    
  tf::TransformListener listener;
  
  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZ>);

  while (ros::ok())
  {
    
    ros::spinOnce();
    
    try{
    listener.lookupTransform("map", "base_link",  
                             ros::Time::now(), transform2);
    }
    catch (tf::TransformException ex){
      ROS_ERROR("%s",ex.what());
      ros::Duration(1.0).sleep();
    }
    
   
    //pcl_conversions::toPCL(stamp_d, cloud_d->header.stamp);
 
    //pcl::toROSMsg(*cloud_i, mensaje_i);
    
    
    //pcl::fromROSMsg(mensaje_d, *cloud_d);
    //*cloud = *cloud_i2 + *cloud_d2;

    //pcl::toROSMsg(*cloud, mensaje);
    pcl_ros::transformPointCloud(*cloudCollect, *cloudCollect, transform2.inverse());
    PCMessage.header.frame_id = "base_link";
    PCMessage.header.stamp = ros::Time::now();
    chatter_pub.publish(PCMessage);
    loop_rate.sleep();
    nCollectPrev = nCollect;
  }
  return(0);
}
