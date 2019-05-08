#include <ros/ros.h>
#include <time.h>
#include <math.h>
#include <tf/tf.h>
#include <tf/transform_listener.h>
#include <tf/LinearMath/Quaternion.h>
#include <pcl/ModelCoefficients.h>
#include <pcl/filters/passthrough.h>
#include <pcl/point_types.h>
#include <pcl/io/pcd_io.h>
#include <pcl/filters/extract_indices.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl/features/normal_3d.h>
#include <pcl/kdtree/kdtree.h>
#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/ransac.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/sample_consensus/sac_model_line.h>
#include <pcl/sample_consensus/sac_model_plane.h>
#include <pcl/sample_consensus/sac_model_sphere.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <pcl/segmentation/extract_clusters.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <boost/foreach.hpp>
#include "sensor_msgs/PointCloud2.h"
#include "std_msgs/Header.h"
#include "geometry_msgs/PoseStamped.h"
#include "geometry_msgs/Pose.h"
#include <geometry_msgs/PoseArray.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include "pcl_conversions/pcl_conversions.h"
#include <pcl_ros/transforms.h>
#include <stdexcept>

#include <iostream>
#include <fstream>

ofstream myfile ("logFile.txt"); 
tf::StampedTransform transform;
geometry_msgs::PoseArray msg_ve;
sensor_msgs::PointCloud2 msg_ds;
sensor_msgs::PointCloud2 msg_cl;
sensor_msgs::PointCloud2 msg_ng;
geometry_msgs::PoseStamped msg_ground;
visualization_msgs::MarkerArray marker_array;
visualization_msgs::MarkerArray cylinders; // Global messages definitions
  
void callback(const sensor_msgs::PointCloud2ConstPtr& input)
{
  clock_t t1, t2;
  t1 = clock();
  
	sensor_msgs::PointCloud2::Ptr clusters (new sensor_msgs::PointCloud2);	
  geometry_msgs::PoseArray msg_aux;
  visualization_msgs::MarkerArray marker_array_aux;
  visualization_msgs::MarkerArray cylinders_aux; // Local messages definitions
	
  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZ>), cloudCropped (new pcl::PointCloud<pcl::PointXYZ>), cloudDownsampled (new pcl::PointCloud<pcl::PointXYZ>);
  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud2 (new pcl::PointCloud<pcl::PointXYZ>);
  pcl::fromROSMsg(*input, *cloud);
	pcl::fromROSMsg(*input, *cloud2); // The ROS message, given as sensor_msgs::PointCloud2ConstPtr is translated to PCL type pcl::PointCloud<pcl::PointXYZ>::Ptr
  //std::cout << "PointCloud before filtering has: " << cloud->points.size () << " data points." << std::endl;
  
//                                                                      INPUT CLOUD
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           V
///////////////////////////////////////////////////////////////////      CROPPING

// The passthrough filter provided does not allow multiple-condition constraints
/*
  pcl::PassThrough<pcl::PointXYZ> pass;
  pass.setInputCloud (cloud);
  pass.setFilterFieldName ("x");
  pass.setFilterLimits (-0.5, 0.5);
  pass.setNegative (true);
  pass.setFilterFieldName ("y");
  pass.setFilterLimits (-0.5, 0.5);
  pass.setNegative (true);
  pass.setFilterFieldName ("z");
  pass.setFilterLimits (-0.5, 0.5);
  pass.setNegative (true);
  pass.filter (*cloudCropped);
*/

  float low_lim_x, low_lim_y, low_lim_z, up_lim_x, up_lim_y, up_lim_z;// So it will be done manually
  ros::param::get("low_lim_x", low_lim_x);
  ros::param::get("low_lim_y", low_lim_y);
  ros::param::get("low_lim_z", low_lim_z);
  ros::param::get("up_lim_x", up_lim_x);
  ros::param::get("up_lim_y", up_lim_y);
  ros::param::get("up_lim_z", up_lim_z);
  
  int k;
  
  pcl_ros::transformPointCloud(*cloud2, *cloud, transform.inverse());
  
  for(k=0; k<=cloud2->points.size(); k++) // Remove the points within a cube of volume (up_lim_x - low_lim_x)m x (up_lim_y - low_lim_y)m x (up_lim_z - low_lim_z)m centered in the sensor. In order to avoid 6 comparations at a time it will be performed in three steps, saving efforts
  {
    if(cloud2->points[k].x<low_lim_x || cloud2->points[k].x>up_lim_x)
      cloudCropped->points.push_back (cloud->points[k]);
    else if(cloud2->points[k].y<low_lim_y || cloud2->points[k].y>up_lim_y)
      cloudCropped->points.push_back (cloud->points[k]);
    else if(cloud2->points[k].z<low_lim_z || cloud2->points[k].z>up_lim_z)
      cloudCropped->points.push_back (cloud->points[k]);
  }
  
  cloudCropped->width = cloudCropped->points.size ();
  cloudCropped->height = 1;
  cloudCropped->is_dense = true;

//////////////////////////////////////////////////////////////////////////////////////
//                                                                     CLOUD CROPPED
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           V
///////////////////////////////////////////////////////////////////    DOWNSAMPLING
  bool do_downsampling; // Downsample the dataset using a leaf size of leafSize meters
  float leafSize;
  ros::param::get("do_downsampling", do_downsampling);
  int minPointsVoxel;
  ros::param::get("minPointsVoxel", minPointsVoxel);
  if (do_downsampling)
  {
    pcl::VoxelGrid<pcl::PointXYZ> vg;
    vg.setInputCloud (cloudCropped);
    ros::param::get("leafSize", leafSize);
    vg.setLeafSize (leafSize, leafSize, leafSize);
    vg.setMinimumPointsNumberPerVoxel(minPointsVoxel);
    vg.filter (*cloudDownsampled);
  }
  // If downsampling is disabled (discouraged, since computation time is extremely high)
  else
    *cloudDownsampled = *cloudCropped;
  
  pcl::toROSMsg(*cloudDownsampled, msg_ds); // For visualization purposes, the downsampled cloud is published to a topic
  float delay_ds;
  ros::param::get("delay_ds", delay_ds);
  t2 = clock();
  delay_ds = (float)(t2-t1)/CLOCKS_PER_SEC;
  msg_ds.header.stamp = ros::Time::now() - ros::Duration(0.0*delay_ds);
  t1 = clock();
  msg_ds.header.frame_id = "base_link"; 
//////////////////////////////////////////////////////////////////////////////////////
//                                                                 CLOUD (NOT) DOWNSAMPLED
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           V
//////////////////////////////////////////////////////////////     POINT NORMALS ESTIMATION
  pcl::PointCloud<pcl::Normal>::Ptr cloudNormals (new pcl::PointCloud<pcl::Normal>);
  pcl::NormalEstimation<pcl::PointXYZ, pcl::Normal> neGround, neClusters;
  pcl::SACSegmentationFromNormals<pcl::PointXYZ, pcl::Normal> segGroundN; 
  pcl::ExtractIndices<pcl::PointXYZ> extract;
  pcl::search::KdTree<pcl::PointXYZ>::Ptr treeGround (new pcl::search::KdTree<pcl::PointXYZ> ());
  pcl::ModelCoefficients::Ptr coefficientsGround (new pcl::ModelCoefficients);
  pcl::ModelCoefficients::Ptr coefficientsLine (new pcl::ModelCoefficients);
  pcl::PointIndices::Ptr inliersGround (new pcl::PointIndices), inliersLine (new pcl::PointIndices);
 
  neGround.setSearchMethod (treeGround);
  neGround.setInputCloud (cloudDownsampled); // Doing downsampling increases computation speed up to 10 times
  float KSearchGround;
  ros::param::get("KSearchGround", KSearchGround);
  neGround.setKSearch (KSearchGround); // The higher KSearchGround is, the slower neGround.compute gets
  neGround.compute (*cloudNormals);
//////////////////////////////////////////////////////////////////////////////////////
//                                                                 POINT NORMALS ESTIMATED
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           V
///////////////////////////////////////////////////////////////////  GROUND EXTRACTION
  bool OptimizeCoefficientsGround;
  ros::param::get("OptimizeCoefficientsGround", OptimizeCoefficientsGround);
  segGroundN.setOptimizeCoefficients (OptimizeCoefficientsGround);
  segGroundN.setModelType (pcl::SACMODEL_NORMAL_PLANE);
  float NormalDistanceWeightGround;
  ros::param::get("NormalDistanceWeightGround", NormalDistanceWeightGround);
  segGroundN.setNormalDistanceWeight (NormalDistanceWeightGround);
  segGroundN.setMethodType (pcl::SAC_RANSAC);
  float MaxIterationsGround;
  ros::param::get("MaxIterationsGround", MaxIterationsGround);
  segGroundN.setMaxIterations (MaxIterationsGround);
  float DistanceThresholdGround;
  ros::param::get("DistanceThresholdGround", DistanceThresholdGround);
  segGroundN.setDistanceThreshold (DistanceThresholdGround);
  segGroundN.setInputCloud (cloudDownsampled);
  segGroundN.setInputNormals (cloudNormals);
  segGroundN.segment (*inliersGround, *coefficientsGround);
  
  //std::cout << *coefficientsGround << std::endl;
  
  geometry_msgs::Vector3 groundDistance;
  geometry_msgs::Vector3 groundDirection;
  
  
  groundDirection.x = coefficientsGround->values[0];
  groundDirection.y = coefficientsGround->values[1];
  groundDirection.z = coefficientsGround->values[2];

  groundDistance.x = coefficientsGround->values[3]*coefficientsGround->values[0];
  groundDistance.y = coefficientsGround->values[3]*coefficientsGround->values[1];
  groundDistance.z = coefficientsGround->values[3]*coefficientsGround->values[2];
  
  
  
  geometry_msgs::PoseStamped pose; // For quaternion conversions
  tf::Quaternion tfQuat;
  geometry_msgs::Quaternion gmQuat; 
  float theta;
  float u[3]; // u is the normalized vector used to turn Z axis until it reaches the orientation of the ground, by turning theta radians. It is obtained by cross-multiplying Z-axis and the director vector of the vertical element

  msg_ground.header.stamp = ros::Time::now();
  msg_ground.header.frame_id = "base_link";
  msg_ground.pose.position.x = groundDistance.x;
  msg_ground.pose.position.y = groundDistance.y;
  msg_ground.pose.position.z = groundDistance.z;
  
  u[0] = (-groundDirection.y) / (sqrt(pow(groundDirection.x,2) + pow(groundDirection.y,2)));
  u[1] = (groundDirection.x) / (sqrt(pow(groundDirection.x,2) + pow(groundDirection.y,2)));
  u[2] = 0.0;
  
  theta = acos(groundDirection.z);
  
  tfQuat = {sin(theta/2)*u[0], sin(theta/2)*u[1], sin(theta/2)*u[2], cos(theta/2)};  // We need to translate this information into quaternion form
  
  tf::quaternionTFToMsg(tfQuat, gmQuat);
  //std::cout << msg_ground.pose << std::endl;
  msg_ground.pose.orientation = gmQuat;

  extract.setInputCloud (cloudDownsampled); // Extract the planar inliers from the input cloud
  extract.setIndices (inliersGround);
  extract.setNegative (true);
  pcl::PointCloud<pcl::PointXYZ>::Ptr cloudNoGround (new pcl::PointCloud<pcl::PointXYZ> ());
  extract.filter (*cloudNoGround);
  
  pcl::toROSMsg(*cloudNoGround, msg_ng);
  float delay_ng;
  ros::param::get("delay_ng", delay_ng);
  t2 = clock();
  delay_ng = (float)(t2-t1)/CLOCKS_PER_SEC;
  msg_ng.header.stamp = ros::Time::now() - ros::Duration(0.0*delay_ng);
  t1 = clock();
  msg_ng.header.frame_id = "base_link";
//////////////////////////////////////////////////////////////////////////////////////
//                                                                 CLOUD WITHOUT GROUND
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           V
///////////////////////////////////////////////////////////////////EUCLIDEAN CLUSTERING
  pcl::search::KdTree<pcl::PointXYZ>::Ptr treeClusters (new pcl::search::KdTree<pcl::PointXYZ>);
  treeClusters->setInputCloud (cloudNoGround);
  std::vector<pcl::PointIndices> clusterIndices;
  pcl::EuclideanClusterExtraction<pcl::PointXYZ> ec;
  float clusterTolerance;
  ros::param::get("clusterTolerance", clusterTolerance);
  
  ec.setClusterTolerance (clusterTolerance); // Be careful setting the right value for setClusterTolerance(). If you take a very small value, it can happen that an actual object can be seen as multiple clusters. On the other hand, if you set the value too high, it could happen, that multiple objects are seen as one cluster.

  float clusterMinSize, clusterMaxSize;
  clusterMinSize = -25.0*leafSize + 17.5; // for leafSize = 0.1 -> clusterMinSize = 15 | for leafSize = 0.5 -> clusterMinSize = 5
  clusterMaxSize = -500.0*leafSize + 350.0; // for leafSize = 0.1 -> clusterMaxSize = 300 | for leafSize = 0.5 -> clusterMinSize = 100 
  
  ec.setMinClusterSize (clusterMinSize);
  ec.setMaxClusterSize (clusterMaxSize);
  ec.setSearchMethod (treeClusters);
  ec.setInputCloud (cloudNoGround);
  ec.extract (clusterIndices); // "VECTOR OF POINT CLOUDS (std::vector<pcl::PointIndices>)": Here we are creating a vector of PointIndices, which contain the actual index information in a vector<int>. The indices of each detected cluster are saved here - please take note of the fact that clusterIndices is a vector containing one instance of PointIndices for each detected cluster. So clusterIndices[0] contains all indices of the first cluster in our point cloud.
//////////////////////////////////////////////////////////////////////////////////////
//                                                              CLUSTERS (in clusterIndices)
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           |
//                                                                           V
///////////////////////////////////////////////////////////////////  CLUSTERS ANALYSIS
  pcl::PointCloud<pcl::PointXYZ>::Ptr clustersTotal (new pcl::PointCloud<pcl::PointXYZ>); // By means of visualization, all the clusters can be merged as one alone, so that they can be seen from one only topic
  for (std::vector<pcl::PointIndices>::const_iterator it = clusterIndices.begin (); it != clusterIndices.end (); ++it)
  {
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloudCluster (new pcl::PointCloud<pcl::PointXYZ>);
    for (std::vector<int>::const_iterator pit = it->indices.begin (); pit != it->indices.end (); ++pit)
      cloudCluster->points.push_back (cloudNoGround->points[*pit]);
      
    cloudCluster->width = cloudCluster->points.size ();
    cloudCluster->height = 1;
    cloudCluster->is_dense = true;
    
    *clustersTotal = *clustersTotal + *cloudCluster;
  }
  pcl::toROSMsg(*clustersTotal, msg_cl); 
  float delay_cl;
  ros::param::get("delay_cl",delay_cl);
  t2 = clock();
  delay_cl = (float)(t2-t1)/CLOCKS_PER_SEC;
  msg_cl.header.stamp= ros::Time::now() - ros::Duration(0.0*delay_cl);
  t1 = clock();
  msg_cl.header.frame_id = "base_link";
    
  float textScale;
  ros::param::get("textScale", textScale);
  float xpLine, ypLine, zpLine, xdLine, ydLine, zdLine;
  int j = 0;
  int n = 0;
  
  pcl::SACSegmentationFromNormals<pcl::PointXYZ, pcl::Normal> segLineN;
  pcl::search::KdTree<pcl::PointXYZ>::Ptr treeCloudCluster (new pcl::search::KdTree<pcl::PointXYZ> ());
    
  float KSearchClusterFit;
  ros::param::get("KSearchClusterFit", KSearchClusterFit);
  bool OptimizeCoefficientsLine;
  ros::param::get("OptimizeCoefficientsLine", OptimizeCoefficientsLine);
  float NormalDistanceWeightLine;
  ros::param::get("NormalDistanceWeightLine", NormalDistanceWeightLine);
  int MaxIterationsLine;
  ros::param::get("MaxIterationsLine", MaxIterationsLine);
  float DistanceThresholdLine;
  ros::param::get("DistanceThresholdLine", DistanceThresholdLine);
  float errorMax, ratioMin;
  ros::param::get("errorMax", errorMax);
  ros::param::get("ratioMin", ratioMin);
  float axis_line_x, axis_line_y, axis_line_z;
  ros::param::get("axis_line_x",axis_line_x);
  ros::param::get("axis_line_y",axis_line_y);
  ros::param::get("axis_line_z",axis_line_z);
  float heightMax;
  ros::param::get("heightMax",heightMax);
  float zMax, zMin, x_zMax, x_zMin, y_zMax, y_zMin, height;
  float cumsum, cumsum2, error, ratio; // error is taking into account all distances from the point in the cluster, not only inliers
  bool isVerticalElement;
  float tiltLim;
  ros::param::get("tiltLim",tiltLim);
  
  bool logfile;
  ros::param::get("logfile",logfile);
  
  visualization_msgs::Marker marker_aux;
  visualization_msgs::Marker cylinder_aux;
  neClusters.setSearchMethod (treeCloudCluster);
  neClusters.setKSearch (KSearchClusterFit);
  
  segLineN.setOptimizeCoefficients (OptimizeCoefficientsLine);
  segLineN.setModelType (pcl::SACMODEL_LINE);
  segLineN.setMethodType (pcl::SAC_RANSAC);
  segLineN.setNormalDistanceWeight (NormalDistanceWeightLine);
  segLineN.setMaxIterations (MaxIterationsLine);
  segLineN.setDistanceThreshold (DistanceThresholdLine);

  marker_aux.header.frame_id = "base_link";
  marker_aux.ns = "error_display";
  marker_aux.type = visualization_msgs::Marker::TEXT_VIEW_FACING;
  marker_aux.action = visualization_msgs::Marker::ADD;
  marker_aux.scale.z = textScale;
  marker_aux.color.a = 1.0;

  
  for (std::vector<pcl::PointIndices>::const_iterator it = clusterIndices.begin (); it != clusterIndices.end (); ++it) // Each for-iteration means analysing one point cloud at a time, considered as a cluster according to the previous stage. The whole analysis of each cluster will be performed within the for-loop. We're iterating through clusterIndices. 
  {
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloudCluster (new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::Normal>::Ptr cloudClusterNormals (new pcl::PointCloud<pcl::Normal>);
    Eigen::VectorXf coefficientsFitLine(6);
    std::vector<double> distances;
    
    for (std::vector<int>::const_iterator pit = it->indices.begin (); pit != it->indices.end (); ++pit)
      cloudCluster->points.push_back (cloudNoGround->points[*pit]);
      
    cloudCluster->width = cloudCluster->points.size ();
    cloudCluster->height = 1;
    cloudCluster->is_dense = true; // At this point, there is only one cluster stored in cloudCluster variable, and it will be analysed in order to being identified as a vertical element. If fitting is successful, its components will be stored

    neClusters.setInputCloud (cloudCluster);
    neClusters.compute (*cloudClusterNormals);
    segLineN.setInputCloud (cloudCluster);
    segLineN.setInputNormals (cloudClusterNormals);
    segLineN.segment (*inliersLine, *coefficientsLine); // Obtain the line inliers and coefficients
//    pcl::SampleConsensusModelLine<pcl::PointXYZ> fitLine (cloudCluster, inliersLine->indices); //We take into account only inliers of the cluster
    pcl::SampleConsensusModelLine<pcl::PointXYZ> fitLine (cloudCluster);

//    std::cout << " inliersLine->indices.size(): " << inliersLine->indices.size() << " cloudCluster->points.size(): " << cloudCluster->points.size() << std::endl;
    
//    std::cout << *coefficientsLine << std::endl;
    coefficientsLine->header.frame_id = "base_link";
    xpLine = coefficientsLine->values[0];
    ypLine = coefficientsLine->values[1];
    zpLine = coefficientsLine->values[2];
    xdLine = coefficientsLine->values[3];
    ydLine = coefficientsLine->values[4];
    zdLine = coefficientsLine->values[5];

    if(inliersLine->indices.size() != 0) // coefficientsLine->values.size() = 6 siempre
    {
      if(zdLine > cos(tiltLim*3.1415/180.0)) // less than a user-given tilt
      {
//        std::cout << "--------------------------------------------------" << std::endl;
        coefficientsFitLine(0) = xpLine;
        coefficientsFitLine(1) = ypLine;
        coefficientsFitLine(2) = zpLine;
        coefficientsFitLine(3) = xdLine;
        coefficientsFitLine(4) = ydLine;
        coefficientsFitLine(5) = zdLine;
        
        /*Calculate height of cluster by finding zMax and zMin*/ //APPROX
        zMax = -9.99e+10;
        zMin = 9.99e+10;
        for (k=0; k<=cloudCluster->points.size(); k++)
        {
          if (cloudCluster->points[k].z < zMin)
          {
            zMin = cloudCluster->points[k].z;
            x_zMin = cloudCluster->points[k].x;
            y_zMin = cloudCluster->points[k].y;
            
          }
          if (cloudCluster->points[k].z > zMax)
          {
            zMax = cloudCluster->points[k].z;
            x_zMax = cloudCluster->points[k].x;
            y_zMax = cloudCluster->points[k].y;
          }
        }
        //height = sqrt(pow(zMax-zMin,2) + pow(x_zMax-x_zMin,2) + pow(y_zMax-y_zMin,2));
        height = zMax - zMin;
        /******************************************************/
        
        fitLine.getDistancesToModel(coefficientsFitLine, distances);

        cumsum  = 0.0;
        cumsum2 = 0.0;
        error   = 0.0;
        
        for (int it2 = 0; it2 != distances.size (); ++it2)
        {
          cumsum2 += distances[it2];
        }
        
        cumsum = sqrt(cumsum2);
        error = cumsum/inliersLine->indices.size();
        ratio = (float)inliersLine->indices.size()/(float)cloudCluster->points.size();
        
        if (error < errorMax && ratio > ratioMin && height < heightMax)
        {
          isVerticalElement = true;
          marker_aux.color.r = 0.0f;
          marker_aux.color.g = 1.0f;
          marker_aux.color.b = 0.0f;
        }
        else
        {
          isVerticalElement = false;
          marker_aux.color.r = 1.0f;
          marker_aux.color.g = 0.0f;
          marker_aux.color.b = 0.0f;
        }
        
        //marker_aux.header.stamp = ros::Time::now();
        marker_aux.id = n;
        marker_aux.pose.position.x = xpLine;
        marker_aux.pose.position.y = ypLine;
        marker_aux.pose.position.z = zpLine + 2.0;


        pose.pose.position.x = xpLine; // Line coefficients
        pose.pose.position.y = ypLine;
        pose.pose.position.z = zpLine;

        u[0] = (-ydLine) / (sqrt(pow(xdLine,2) + pow(ydLine,2)));
        u[1] = (xdLine) / (sqrt(pow(xdLine,2) + pow(ydLine,2)));
        u[2] = 0.0;
        
        theta = acos(zdLine);
        
        tfQuat = {sin(theta/2)*u[0], sin(theta/2)*u[1], sin(theta/2)*u[2], cos(theta/2)};  // We need to translate this information into quaternion form
        
        tf::quaternionTFToMsg(tfQuat, gmQuat);
        
        pose.pose.orientation.x = gmQuat.x; // Finally, the quaternion is introduced in the pose message, that will eventually be sent
        pose.pose.orientation.y = gmQuat.y;
        pose.pose.orientation.z = gmQuat.z;
        pose.pose.orientation.w = gmQuat.w;
        
        tf::Vector3 pose_point; // seen from base_link
        tf::Vector3 odom_point; // seen from map

        pose_point[0] = xpLine;
        pose_point[1] = ypLine;
        pose_point[2] = zpLine;
        
        odom_point = transform*pose_point;
        
        std::stringstream ss;
        coefficientsLine->header.frame_id = "base_link";
        ss << "Points: " << cloudCluster->points.size() << "\tError: " << error << endl << "Inliers: " << inliersLine->indices.size() << "\tRatio: " << ratio << endl << "Tilt: " << (float)acos(zdLine)*180.0/3.14 << "\tHeight: " << height << endl << "x: " << odom_point[0] << "\ty: " << odom_point[1] << endl <<"Vertical Element: " << isVerticalElement;
        
        marker_aux.text = ss.str();
        marker_array_aux.markers.push_back(marker_aux);

        msg_aux.poses.push_back(pose.pose);
        n++;
        
        if (logfile)
        {
          if (myfile.is_open()) // Log file
          {
            if(isVerticalElement)
              myfile << 1 << ", " << odom_point[0] << ", " << odom_point[1] << ", " << error << ", " << inliersLine->indices.size() << ", " << ratio << std::endl;
            else
              myfile << 0 << ", " << odom_point[0] << ", " << odom_point[1] << ", " << error << ", " << inliersLine->indices.size() << ", " << ratio << std::endl;
          }
          else cout << "Unable to open file";
        }
        
      } // end if(zdLine > cos(tiltLim*3.1415/180.0))
    } // end if(coefficientsLine->values.size() != 0)
    j++;
  } // end for (std::vector<pcl::PointIndices>::const_iterator it = clusterIndices.begin (); it != clusterIndices.end (); ++it)
  float delay_ve;
  ros::param::get("delay_ve", delay_ve);
  t2 = clock();
  delay_ve = (float)(t2-t1)/CLOCKS_PER_SEC;
  msg_aux.header.stamp = ros::Time::now() - ros::Duration(0.0*delay_ve);
  msg_aux.header.frame_id = "base_link";
  
  msg_ve = msg_aux; // Pass local messages to global messages, in order to be published in main
  marker_array = marker_array_aux;
}



int 
main (int argc, char** argv)
{
  ros::init(argc, argv, "euclidean_clustering");
  ros::NodeHandle nh;
  std::string subscription;
  ros::param::get("subscription", subscription);
  ros::Subscriber sub = nh.subscribe (subscription.c_str(), 1, callback);
  ros::Publisher pub_ds = nh.advertise<sensor_msgs::PointCloud2>("PointCloud2_ds", 1); // debugging
  ros::Publisher pub_ground = nh.advertise<geometry_msgs::PoseStamped>("poseGround", 1); // debugging
  ros::Publisher pub_ng = nh.advertise<sensor_msgs::PointCloud2>("PointCloud2_ng", 1); // debugging
  ros::Publisher pub_cl = nh.advertise<sensor_msgs::PointCloud2>("PointCloud2_cl", 1); // debugging
  ros::Publisher pub_ve = nh.advertise<geometry_msgs::PoseArray>("PoseArray_ve", 1);
  ros::Publisher pub_text = nh.advertise<visualization_msgs::MarkerArray>("MarkerArray_text", 1); // debugging
  ros::Rate loop_rate(10);
  visualization_msgs::Marker marker_main;
	tf::TransformListener listener;


  while (ros::ok())
  {
    
    try
    {
      listener.waitForTransform("map", "base_link", ros::Time::now(), ros::Duration(1.0));
      listener.lookupTransform("map", "base_link", ros::Time::now(), transform);
    }
    catch(tf::TransformException& ex)
    {
      ROS_ERROR("Received an exception trying to transform: %s", ex.what());
    }
    ros::spinOnce();
    
    pub_ve.publish(msg_ve);
    pub_ds.publish(msg_ds); // debugging
    pub_cl.publish(msg_cl); // debugging
    pub_ng.publish(msg_ng); // debugging
    pub_ground.publish(msg_ground); // debugging
    pub_text.publish(marker_array); // debugging

    loop_rate.sleep();
    
    marker_main.action = visualization_msgs::Marker::DELETEALL; // To avoid dead displays on screen
    marker_array.markers.push_back(marker_main);
    pub_text.publish(marker_array); // debugging
    
  }
  myfile.close();
  return(0);
}
