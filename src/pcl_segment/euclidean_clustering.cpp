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
#include <pcl/sample_consensus/sac_model_stick.h>
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

geometry_msgs::PoseArray msg;
sensor_msgs::PointCloud2 msg_ds; // for tracking-debugging purposes
sensor_msgs::PointCloud2 msg_cl; // for tracking-debugging purposes
sensor_msgs::PointCloud2 msg_ng; // for tracking-debugging purposes
visualization_msgs::MarkerArray marker_array;

  
void callback(const sensor_msgs::PointCloud2ConstPtr& input) // Debe estar publicando el /izq/velodyne_points para que la callback lo detecte
{

	sensor_msgs::PointCloud2::Ptr clusters (new sensor_msgs::PointCloud2);	
  geometry_msgs::PoseArray msg_aux;
  visualization_msgs::MarkerArray marker_array_aux;
	
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
  ros::param::get("do_downsampling", do_downsampling);
  if (do_downsampling)
  {
    pcl::VoxelGrid<pcl::PointXYZ> vg;
    vg.setInputCloud (cloudCropped);
    float leafSize;
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
  pcl::SACSegmentationFromNormals<pcl::PointXYZ, pcl::Normal> segGround; 
  pcl::ExtractIndices<pcl::PointXYZ> extract;
  pcl::search::KdTree<pcl::PointXYZ>::Ptr treeGround (new pcl::search::KdTree<pcl::PointXYZ> ());
  pcl::ModelCoefficients::Ptr coefficientsGround (new pcl::ModelCoefficients);
  pcl::ModelCoefficients::Ptr coefficientsLine (new pcl::ModelCoefficients), coefficientsCylinder (new pcl::ModelCoefficients);
  pcl::PointIndices::Ptr inliersGround (new pcl::PointIndices), inliersLine (new pcl::PointIndices), inliersCylinder (new pcl::PointIndices), inliersStick (new pcl::PointIndices);
 
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
  segGround.setOptimizeCoefficients (true);
  segGround.setModelType (pcl::SACMODEL_NORMAL_PLANE);
  float NormalDistanceWeightGround;
  ros::param::get("NormalDistanceWeightGround", NormalDistanceWeightGround);
  segGround.setNormalDistanceWeight (NormalDistanceWeightGround);
  segGround.setMethodType (pcl::SAC_RANSAC);
  float MaxIterationsGround;
  ros::param::get("MaxIterationsGround", MaxIterationsGround);
  segGround.setMaxIterations (MaxIterationsGround);
  float DistanceThresholdGround;
  ros::param::get("DistanceThresholdGround", DistanceThresholdGround);
  segGround.setDistanceThreshold (DistanceThresholdGround);
  segGround.setInputCloud (cloudDownsampled);
  segGround.setInputNormals (cloudNormals);
  segGround.segment (*inliersGround, *coefficientsGround);

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
  float clusterMinSize;
  ros::param::get("clusterMinSize", clusterMinSize);
  float clusterMaxSize;
  ros::param::get("clusterMaxSize", clusterMaxSize);
  
  ec.setClusterTolerance (clusterTolerance); // Be careful setting the right value for setClusterTolerance(). If you take a very small value, it can happen that an actual object can be seen as multiple clusters. On the other hand, if you set the value too high, it could happen, that multiple objects are seen as one cluster.
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
    
  int j = 0;
  int n = 0;
  for (std::vector<pcl::PointIndices>::const_iterator it = clusterIndices.begin (); it != clusterIndices.end (); ++it) // Each for-iteration means analysing one point cloud at a time, considered as a cluster according to the previous stage. The whole analysis of each cluster will be performed within the for-loop. We're iterating through clusterIndices. 
  {
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloudCluster (new pcl::PointCloud<pcl::PointXYZ>);
    for (std::vector<int>::const_iterator pit = it->indices.begin (); pit != it->indices.end (); ++pit)
      cloudCluster->points.push_back (cloudNoGround->points[*pit]);
      
    cloudCluster->width = cloudCluster->points.size ();
    cloudCluster->height = 1;
    cloudCluster->is_dense = true; // At this point, there is only one cluster stored in cloudCluster variable, and it will be analysed in order to being identified as a vertical element. If fitting is successful, its components will be stored

    pcl::SACSegmentationFromNormals<pcl::PointXYZ, pcl::Normal> segLine, segCylinder;
    pcl::SampleConsensusModelStick<pcl::PointXYZ> fitStick (cloudCluster);
    Eigen::VectorXf coefficientsStick(7);
    std::vector<double> distances;
    pcl::search::KdTree<pcl::PointXYZ>::Ptr treeCloudCluster (new pcl::search::KdTree<pcl::PointXYZ> ());
    pcl::PointCloud<pcl::Normal>::Ptr cloudClusterNormals (new pcl::PointCloud<pcl::Normal>);

    neClusters.setSearchMethod (treeCloudCluster);
    neClusters.setInputCloud (cloudCluster);
    float KSearchClusterFit;
    ros::param::get("KSearchClusterFit", KSearchClusterFit);
    neClusters.setKSearch (KSearchClusterFit);
    neClusters.compute (*cloudClusterNormals);

    segLine.setOptimizeCoefficients (true);
    segLine.setModelType (pcl::SACMODEL_LINE);
    segLine.setMethodType (pcl::SAC_RANSAC);
    float NormalDistanceWeightLine;
    ros::param::get("NormalDistanceWeightLine", NormalDistanceWeightLine);
    segLine.setNormalDistanceWeight (NormalDistanceWeightLine);
    int MaxIterationsLine;
    ros::param::get("MaxIterationsLine", MaxIterationsLine);
    segLine.setMaxIterations (MaxIterationsLine);
    float DistanceThresholdLine;
    ros::param::get("DistanceThresholdLine", DistanceThresholdLine);
    segLine.setDistanceThreshold (DistanceThresholdLine);
    segLine.setInputCloud (cloudCluster);
    segLine.setInputNormals (cloudClusterNormals);

    segLine.segment (*inliersLine, *coefficientsLine); // Obtain the line inliers and coefficients
    
    //std::cout << "inliersLine->indices.size(): " << inliersLine->indices.size() << " cloudCluster->points.size(): " << cloudCluster->points.size() << endl;
    
    float axis_line_x, axis_line_y, axis_line_z;
    ros::param::get("axis_line_x",axis_line_x);
    ros::param::get("axis_line_y",axis_line_y);
    ros::param::get("axis_line_z",axis_line_z);
     
    float maxWidth;
    ros::param::get("maxWidth", maxWidth);
    if(coefficientsLine->values.size() != 0)
    {
      if(abs(coefficientsLine->values[3])<axis_line_x && abs(coefficientsLine->values[4])<axis_line_y && abs(coefficientsLine->values[5])>axis_line_z) // inclinación menor a 10º aprox
      {
        
        coefficientsStick(0) = coefficientsLine->values[0];
        coefficientsStick(1) = coefficientsLine->values[1];
        coefficientsStick(2) = coefficientsLine->values[2];

        coefficientsStick(3) = coefficientsLine->values[3];
        coefficientsStick(4) = coefficientsLine->values[4];
        coefficientsStick(5) = coefficientsLine->values[5];

        fitStick.getDistancesToModel(coefficientsStick, distances);

        float cumsum, cumsum2, error;
        cumsum = 0.0;
        cumsum2 = 0.0;
        error = 0.0;
        
        for (int it2 = 0; it2 != distances.size (); ++it2)
        {
          cumsum2 += distances[it2];
        }
        
        cumsum = sqrt(cumsum2);
        error = cumsum/inliersLine->indices.size();
        
        visualization_msgs::Marker marker_aux;
        marker_aux.header.frame_id = "/base_link";
        marker_aux.header.stamp = ros::Time::now();
        marker_aux.ns = "error_display";
        marker_aux.id = n;
        marker_aux.type = visualization_msgs::Marker::TEXT_VIEW_FACING;
        marker_aux.action = visualization_msgs::Marker::ADD;

        marker_aux.pose.position.x = coefficientsStick(0);
        marker_aux.pose.position.y = coefficientsStick(1);
        marker_aux.pose.position.z = coefficientsStick(2) + 2.0;
        
        std::stringstream ss;
        float ratio = inliersLine->indices.size() / cloudCluster->points.size();
        ss << "Error: " << error << endl << "Inliers: " << inliersLine->indices.size() << endl << "Points: " << cloudCluster->points.size() << endl << "Ratio: " << ((float)inliersLine->indices.size()/(float)cloudCluster->points.size());
        marker_aux.text = ss.str();

        marker_aux.scale.z = 1.0;

        marker_aux.color.r = 1.0f;
        marker_aux.color.g = 1.0f;
        marker_aux.color.b = 1.0f;
        marker_aux.color.a = 1.0;

        marker_array_aux.markers.push_back(marker_aux);

/*
        //Una vez detectado como línea vertical se comprueba si tiene propiedades de cilindro de hasta cierto tamaño
        segCylinder.setModelType (pcl::SACMODEL_CYLINDER);
        segCylinder.setMethodType (pcl::SAC_RANSAC);
        float NormalDistanceWeightCylinder;
        ros::param::get("NormalDistanceWeightCylinder", NormalDistanceWeightCylinder);
        segCylinder.setNormalDistanceWeight (NormalDistanceWeightCylinder);
        int MaxIterationsCylinder;
        ros::param::get("MaxIterationsCylinder", MaxIterationsCylinder);
        segCylinder.setMaxIterations (MaxIterationsCylinder);
        float DistanceThresholdCylinder;
        ros::param::get("DistanceThresholdCylinder", DistanceThresholdCylinder);
        segCylinder.setDistanceThreshold (DistanceThresholdCylinder);
        segCylinder.setInputCloud (cloudCluster);
        segCylinder.setInputNormals (cloudClusterNormals);
        float minRadiusCylinder, maxRadiusCylinder;
        ros::param::get("minRadiusCylinder", minRadiusCylinder);
        ros::param::get("maxRadiusCylinder", maxRadiusCylinder);
        segCylinder.setRadiusLimits (minRadiusCylinder, maxRadiusCylinder);
          
        segCylinder.segment (*inliersCylinder, *coefficientsCylinder);
        
        float axis_cylinder_x, axis_cylinder_y, axis_cylinder_z;
        ros::param::get("axis_cylinder_x",axis_cylinder_x);
        ros::param::get("axis_cylinder_y",axis_cylinder_y);
        ros::param::get("axis_cylinder_z",axis_cylinder_z);
*/

        geometry_msgs::Pose pose;
        pose.position.x = coefficientsLine->values[0]; // Line coefficients
        pose.position.y = coefficientsLine->values[1];
        pose.position.z = coefficientsLine->values[2];
        
        float u[3]; // u is the normalized vector used to turn Z axis until it reaches the orientation of the vertical element, by turning theta radians. It is obtained by cross-multiplying Z-axis and the director vector of the vertical element
        float theta;

        u[0] = (-coefficientsLine->values[4]) / (sqrt(pow(coefficientsLine->values[3],2) + pow(coefficientsLine->values[4],2)));
        u[1] = (coefficientsLine->values[3]) / (sqrt(pow(coefficientsLine->values[3],2) + pow(coefficientsLine->values[4],2)));
        u[2] = 0.0;
        
        theta = acos(coefficientsLine->values[5]);
        
        tf::Quaternion q; // We need to translate this information into quaternion form
        q = {sin(theta/2)*u[0], sin(theta/2)*u[1], sin(theta/2)*u[2], cos(theta/2)};
        
        geometry_msgs::Quaternion element_orientation;
        tf::quaternionTFToMsg(q, element_orientation);
        
        pose.orientation.x = element_orientation.x; // Finally, the quaternion is introduced in the pose message, that will eventually be sent
        pose.orientation.y = element_orientation.y;
        pose.orientation.z = element_orientation.z;
        pose.orientation.w = element_orientation.w;

        msg_aux.poses.push_back(pose);
        n++;
      }
    }
    j++;
  }
  
  msg_aux.header.frame_id = "base_link";
  msg_aux.header.stamp = ros::Time::now();
  msg = msg_aux;
  marker_array = marker_array_aux;
}



int 
main (int argc, char** argv)
{
  ros::init(argc, argv, "euclidean_clustering");
  ros::NodeHandle nh; 
  ros::Subscriber sub = nh.subscribe ("pointcloudmerged", 1, callback);
  ros::Publisher chatter_pub = nh.advertise<geometry_msgs::PoseArray>("chatter", 1000);
  ros::Publisher chatter_pub_ds = nh.advertise<sensor_msgs::PointCloud2>("chatter_ds", 1000); // debugging
  ros::Publisher chatter_pub_cl = nh.advertise<sensor_msgs::PointCloud2>("chatter_cl", 1000); // debugging
  ros::Publisher chatter_pub_ng = nh.advertise<sensor_msgs::PointCloud2>("chatter_ng", 1000); // debugging
  ros::Publisher chatter_pub_text = nh.advertise<visualization_msgs::MarkerArray>("chatter_text", 1000); // debugging
  ros::Rate loop_rate(10);
  
  while (ros::ok())
  {
    visualization_msgs::Marker marker_main;
    ros::spinOnce();
    chatter_pub.publish(msg);
    chatter_pub_ds.publish(msg_ds); // debugging
    chatter_pub_cl.publish(msg_cl); // debugging
    chatter_pub_ng.publish(msg_ng); // debugging
    chatter_pub_text.publish(marker_array); // debugging

    loop_rate.sleep();
    
    marker_main.action = visualization_msgs::Marker::DELETEALL; // To avoid dead displays on screen
    marker_array.markers.push_back(marker_main);
    chatter_pub_text.publish(marker_array); // debugging
  }
  return(0);
}
