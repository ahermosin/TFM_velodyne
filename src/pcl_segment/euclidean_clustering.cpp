#include <ros/ros.h>
#include <time.h>
#include <math.h>
#include <tf/tf.h>
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
#include <stdexcept>

geometry_msgs::PoseArray msg_ve;
sensor_msgs::PointCloud2 msg_ds;
sensor_msgs::PointCloud2 msg_cl;
sensor_msgs::PointCloud2 msg_ng;
visualization_msgs::MarkerArray marker_array; // Global messages definitions

  
void callback(const sensor_msgs::PointCloud2ConstPtr& input)
{

	sensor_msgs::PointCloud2::Ptr clusters (new sensor_msgs::PointCloud2);	
  geometry_msgs::PoseArray msg_aux;
  visualization_msgs::MarkerArray marker_array_aux; // Local messages definitions
	
  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZ>), cloudCropped (new pcl::PointCloud<pcl::PointXYZ>), cloudDownsampled (new pcl::PointCloud<pcl::PointXYZ>);
	pcl::fromROSMsg(*input, *cloud); // The ROS message, given as sensor_msgs::PointCloud2ConstPtr is translated to PCL type pcl::PointCloud<pcl::PointXYZ>::Ptr
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
  for(k=0; k<=cloud->points.size(); k++) // Remove the points within a cube of volume (up_lim_x - low_lim_x)m x (up_lim_y - low_lim_y)m x (up_lim_z - low_lim_z)m centered in the sensor. In order to avoid 6 comparations at a time it will be performed in three steps, saving efforts
  {
    if(cloud->points[k].x<low_lim_x || cloud->points[k].x>up_lim_x)
      cloudCropped->points.push_back (cloud->points[k]);
    else if(cloud->points[k].y<low_lim_y || cloud->points[k].y>up_lim_y)
      cloudCropped->points.push_back (cloud->points[k]);
    else if(cloud->points[k].z<low_lim_z || cloud->points[k].z>up_lim_z)
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
  if (do_downsampling)
  {
    pcl::VoxelGrid<pcl::PointXYZ> vg;
    vg.setInputCloud (cloudCropped);
    ros::param::get("leafSize", leafSize);
    vg.setLeafSize (leafSize, leafSize, leafSize);
    vg.filter (*cloudDownsampled);
  }
  // If downsampling is disabled (disapproved, since computation time is extremely high)
  else
    *cloudDownsampled = *cloudCropped;
  
  pcl::toROSMsg(*cloudDownsampled, msg_ds); // For visualization purposes, the downsampled cloud is published to a topic
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

  extract.setInputCloud (cloudDownsampled); // Extract the planar inliers from the input cloud
  extract.setIndices (inliersGround);
  extract.setNegative (true);
  pcl::PointCloud<pcl::PointXYZ>::Ptr cloudNoGround (new pcl::PointCloud<pcl::PointXYZ> ());
  extract.filter (*cloudNoGround);
  
  pcl::toROSMsg(*cloudNoGround, msg_ng);
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
  clusterMinSize = -37.5*leafSize + 23.75; // for leafSize = 0.1 -> clusterMinSize = 20 | for leafSize = 0.5 -> clusterMinSize = 5
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
  float cumsum, cumsum2, error, ratio; // error is taking into account all distances from the point in the cluster, not only inliers
  bool isVerticalElement;
  float tiltLim;
  ros::param::get("tiltLim",tiltLim);
  
  float u[3]; // u is the normalized vector used to turn Z axis until it reaches the orientation of the vertical element, by turning theta radians. It is obtained by cross-multiplying Z-axis and the director vector of the vertical element
  float theta;

  visualization_msgs::Marker marker_aux;
  geometry_msgs::Pose pose;
  tf::Quaternion q;
  geometry_msgs::Quaternion element_orientation;

  neClusters.setSearchMethod (treeCloudCluster);
  neClusters.setKSearch (KSearchClusterFit);
  
  segLineN.setOptimizeCoefficients (OptimizeCoefficientsLine);
  segLineN.setModelType (pcl::SACMODEL_LINE);
  segLineN.setMethodType (pcl::SAC_RANSAC);
  segLineN.setNormalDistanceWeight (NormalDistanceWeightLine);
  segLineN.setMaxIterations (MaxIterationsLine);
  segLineN.setDistanceThreshold (DistanceThresholdLine);

  marker_aux.header.frame_id = "/base_link";
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

    pcl::SampleConsensusModelLine<pcl::PointXYZ> fitLine (cloudCluster);
    neClusters.setInputCloud (cloudCluster);
    neClusters.compute (*cloudClusterNormals);
    segLineN.setInputCloud (cloudCluster);
    segLineN.setInputNormals (cloudClusterNormals);
    segLineN.segment (*inliersLine, *coefficientsLine); // Obtain the line inliers and coefficients

    //std::cout << "inliersLine->indices.size(): " << inliersLine->indices.size() << " cloudCluster->points.size(): " << cloudCluster->points.size() << endl;

    xpLine = coefficientsLine->values[0];
    ypLine = coefficientsLine->values[1];
    zpLine = coefficientsLine->values[2];
    xdLine = coefficientsLine->values[3];
    ydLine = coefficientsLine->values[4];
    zdLine = coefficientsLine->values[5];

    if(coefficientsLine->values.size() != 0)
    {
      if(zdLine > cos(tiltLim*3.1415/180.0)) // less than a user-given tilt
      {
        coefficientsFitLine(0) = xpLine;
        coefficientsFitLine(1) = ypLine;
        coefficientsFitLine(2) = zpLine;
        coefficientsFitLine(3) = xdLine;
        coefficientsFitLine(4) = ydLine;
        coefficientsFitLine(5) = zdLine;
        
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
        
        if (error < errorMax && ratio > ratioMin)
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
        
        marker_aux.header.stamp = ros::Time::now();
        marker_aux.id = n;
        marker_aux.pose.position.x = xpLine;
        marker_aux.pose.position.y = ypLine;
        marker_aux.pose.position.z = zpLine + 2.0;
        
        std::stringstream ss;
        ss << "Points: " << cloudCluster->points.size() << "\tError: " << error << endl << "Inliers: " << inliersLine->indices.size() << "\tRatio: " << ratio << endl << "Tilt: " << (float)acos(zdLine)*180.0/3.14 << endl << "Vertical Element: " << isVerticalElement;
        
        marker_aux.text = ss.str();
        marker_array_aux.markers.push_back(marker_aux);

        pose.position.x = xpLine; // Line coefficients
        pose.position.y = ypLine;
        pose.position.z = zpLine;

        u[0] = (-ydLine) / (sqrt(pow(xdLine,2) + pow(ydLine,2)));
        u[1] = (xdLine) / (sqrt(pow(xdLine,2) + pow(ydLine,2)));
        u[2] = 0.0;
        
        theta = acos(zdLine);
        
        q = {sin(theta/2)*u[0], sin(theta/2)*u[1], sin(theta/2)*u[2], cos(theta/2)};  // We need to translate this information into quaternion form
        
        tf::quaternionTFToMsg(q, element_orientation);
        
        pose.orientation.x = element_orientation.x; // Finally, the quaternion is introduced in the pose message, that will eventually be sent
        pose.orientation.y = element_orientation.y;
        pose.orientation.z = element_orientation.z;
        pose.orientation.w = element_orientation.w;

        msg_aux.poses.push_back(pose);
        n++;
        
      } // end if(zdLine > cos(tiltLim*3.1415/180.0))
    } // end if(coefficientsLine->values.size() != 0)
    j++;
  } // end for (std::vector<pcl::PointIndices>::const_iterator it = clusterIndices.begin (); it != clusterIndices.end (); ++it)
  
  msg_aux.header.frame_id = "base_link";
  msg_aux.header.stamp = ros::Time::now();
  
  msg_ve = msg_aux; // Pass local messages to global messages, to be published in main
  marker_array = marker_array_aux;
}



int 
main (int argc, char** argv)
{
  ros::init(argc, argv, "euclidean_clustering");
  ros::NodeHandle nh; 
  ros::Subscriber sub = nh.subscribe ("pointcloudmerged", 1, callback);
  ros::Publisher pub_ve = nh.advertise<geometry_msgs::PoseArray>("PoseArray_ve", 1);
  ros::Publisher pub_ds = nh.advertise<sensor_msgs::PointCloud2>("PointCloud2_ds", 1); // debugging
  ros::Publisher pub_cl = nh.advertise<sensor_msgs::PointCloud2>("PointCloud2_cl", 1); // debugging
  ros::Publisher pub_ng = nh.advertise<sensor_msgs::PointCloud2>("PointCloud2_ng", 1); // debugging
  ros::Publisher pub_text = nh.advertise<visualization_msgs::MarkerArray>("MarkerArray_text", 1); // debugging
  ros::Rate loop_rate(10);
  
  while (ros::ok())
  {
    visualization_msgs::Marker marker_main;
    ros::spinOnce();
    pub_ve.publish(msg_ve);
    pub_ds.publish(msg_ds); // debugging
    pub_cl.publish(msg_cl); // debugging
    pub_ng.publish(msg_ng); // debugging
    pub_text.publish(marker_array); // debugging

    loop_rate.sleep();
    
    marker_main.action = visualization_msgs::Marker::DELETEALL; // To avoid dead displays on screen
    marker_array.markers.push_back(marker_main);
    pub_text.publish(marker_array); // debugging
  }
  return(0);
}
