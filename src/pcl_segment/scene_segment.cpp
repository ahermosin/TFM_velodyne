#include "std_msgs/String.h"

#include <sstream>


#include <ros/ros.h>
#include <pcl_ros/point_cloud.h>
#include <boost/foreach.hpp>
#include <pcl/ModelCoefficients.h>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <pcl/filters/extract_indices.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl/kdtree/kdtree.h>


#include <pcl/filters/passthrough.h>
#include <pcl/features/normal_3d.h>
#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <pcl/segmentation/extract_clusters.h>

typedef pcl::PointXYZ PointT;

//********************************************************************************************************************//
//SUBSCRIPTION (?)

typedef pcl::PointCloud<pcl::PointXYZ> PointCloud;

void callback(const PointCloud::ConstPtr& msg)
{
  printf ("Cloud: width = %d, height = %d\n", msg->width, msg->height);
  BOOST_FOREACH (const pcl::PointXYZ& pt, msg->points)
    printf ("\t(%f, %f, %f)\n", pt.x, pt.y, pt.z);
}  

//********************************************************************************************************************//


int
main (int argc, char** argv)
{

  //********************************************************************************************************************//
  //SUBSCRIPTION (?)

  //ros::init(argc, argv, "scene_segment");
  //ros::NodeHandle nh;
  //ros::Subscriber sub = nh.subscribe<PointCloud>("points2", 1, callback);
  //ros::spin();
   
  //********************************************************************************************************************//



  // All the objects needed
  pcl::PCDReader reader;
  pcl::PassThrough<PointT> pass;
  pcl::NormalEstimation<PointT, pcl::Normal> ne;
  pcl::SACSegmentationFromNormals<PointT, pcl::Normal> seg; 
  pcl::PCDWriter writer;
  pcl::ExtractIndices<PointT> extract;
  pcl::ExtractIndices<pcl::Normal> extract_normals;
  pcl::search::KdTree<PointT>::Ptr tree (new pcl::search::KdTree<PointT> ());

  // Datasets
  pcl::PointCloud<PointT>::Ptr cloud (new pcl::PointCloud<PointT>);
  pcl::PointCloud<PointT>::Ptr cloud_filtered (new pcl::PointCloud<PointT>);
  pcl::PointCloud<PointT>::Ptr cloud_filtered1 (new pcl::PointCloud<PointT>);
  pcl::PointCloud<pcl::Normal>::Ptr cloud_normals (new pcl::PointCloud<pcl::Normal>);
  pcl::PointCloud<PointT>::Ptr cloud_filtered2 (new pcl::PointCloud<PointT>);
  pcl::PointCloud<pcl::Normal>::Ptr cloud_normals2 (new pcl::PointCloud<pcl::Normal>);
  pcl::ModelCoefficients::Ptr coefficients_plane (new pcl::ModelCoefficients), coefficients_cylinder (new pcl::ModelCoefficients);
  pcl::PointIndices::Ptr inliers_plane (new pcl::PointIndices), inliers_cylinder (new pcl::PointIndices);

  // Read in the cloud data
  reader.read ("src/pcl_segment/pcd_example/example2.pcd", *cloud);
  std::cerr << "PointCloud has: " << cloud->points.size () << " data points." << std::endl;
/*
  // Build a passthrough filter to remove spurious NaNs
  pass.setInputCloud (cloud);
  pass.setFilterFieldName ("z");
  pass.setFilterLimits (-4.0, 0.0);
  pass.setNegative (false);
  pass.filter (*cloud_filtered);
  pass.filter (*cloud_filtered1);
  std::cerr << "PointCloud after filtering has: " << cloud_filtered->points.size () << " data points." << std::endl;

  // Write filtered cloud to disk
  std::cerr << "PointCloud representing the filtered point cloud: " << cloud_filtered->points.size () << " data points." << std::endl;
  writer.write ("src/pcl_segment/pcd_example/segmented/example_textured_filtered.pcd", *cloud_filtered, false);
*/

//////////////////// /|\  el filtrado de la nube de puntos por altura se puede obviar. La detección del suelo sucede igualmente si se hace con la nube entera.

  // Estimate point normals
  ne.setSearchMethod (tree);
  ne.setInputCloud (cloud); // original: cloud_filtered1
  ne.setKSearch (200); // original: 50 ---- BUENO: 200
  ne.compute (*cloud_normals);

  // Create the segmentation object for the planar model and set all the parameters
  seg.setOptimizeCoefficients (true);
  seg.setModelType (pcl::SACMODEL_NORMAL_PLANE);
  seg.setNormalDistanceWeight (0.5); // original: 0.1 ---- BUENO: 0.5
  seg.setMethodType (pcl::SAC_RANSAC);
  seg.setMaxIterations (100); // original: 100 ---- BUENO: 100
  seg.setDistanceThreshold (0.2); // original: 0.03 ---- BUENO:0.2
  seg.setInputCloud (cloud); // original: cloud_filtered1
  seg.setInputNormals (cloud_normals);
  // Obtain the plane inliers and coefficients
  seg.segment (*inliers_plane, *coefficients_plane);
  std::cerr << "Plane coefficients: " << *coefficients_plane << std::endl;

  // Extract the planar inliers from the input cloud
  extract.setInputCloud (cloud); // original: cloud_filtered1
  extract.setIndices (inliers_plane);
  extract.setNegative (true); // original: false

  // Write the planar inliers to disk
  pcl::PointCloud<PointT>::Ptr cloud_plane (new pcl::PointCloud<PointT> ());
  extract.filter (*cloud_plane);
  std::cerr << "PointCloud representing the planar component: " << cloud_plane->points.size () << " data points." << std::endl;
  writer.write ("src/pcl_segment/pcd_example/segmented/example_textured_plane.pcd", *cloud_plane, false);

  // Remove the planar inliers, extract the rest
  extract.setNegative (true);
  extract.filter (*cloud_filtered2);
  extract_normals.setNegative (true);
  extract_normals.setInputCloud (cloud_normals);
  extract_normals.setIndices (inliers_plane);
  extract_normals.filter (*cloud_normals2);







  // Create the segmentation object for line segmentation and set all the parameters
  seg.setOptimizeCoefficients (true);
  seg.setModelType (pcl::SACMODEL_LINE);
  seg.setMethodType (pcl::SAC_RANSAC);
  seg.setNormalDistanceWeight (0.5); // original: 0.1
  seg.setMaxIterations (100); // original: 10000
  seg.setDistanceThreshold (0.15); // original: 0.05
  //seg.setRadiusLimits (0, 0.15); // original: 0.1
  seg.setInputCloud (cloud_filtered2);
  seg.setInputNormals (cloud_normals2);

  // Obtain the line inliers and coefficients
  seg.segment (*inliers_cylinder, *coefficients_cylinder);
  std::cerr << "Line coefficients: " << *coefficients_cylinder << std::endl;

  // Write the line inliers to disk
  extract.setInputCloud (cloud_filtered2);
  extract.setIndices (inliers_cylinder);
  extract.setNegative (false);
  pcl::PointCloud<PointT>::Ptr cloud_cylinder (new pcl::PointCloud<PointT> ());
  extract.filter (*cloud_cylinder);
  if (cloud_cylinder->points.empty ()) 
    std::cerr << "Can't find the line component." << std::endl;
  else
  {
	  std::cerr << "PointCloud representing the line component: " << cloud_cylinder->points.size () << " data points." << std::endl;
	  writer.write ("src/pcl_segment/pcd_example/segmented/example_textured_cylinder.pcd", *cloud_cylinder, false);
  }
  return (0);
}
