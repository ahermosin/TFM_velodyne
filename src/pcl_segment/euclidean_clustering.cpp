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
#include "pcl_conversions/pcl_conversions.h"
#include <stdexcept>

geometry_msgs::PoseArray mensaje;
sensor_msgs::PointCloud2 mensaje_ds; // for tracking-debugging purposes
sensor_msgs::PointCloud2 mensaje_cl; // for tracking-debugging purposes
sensor_msgs::PointCloud2 mensaje_ng; // for tracking-debugging purposes
  
void callback(const sensor_msgs::PointCloud2ConstPtr& input) // Debe estar publicando el /izq/velodyne_points para que la callback lo detecte
{
  clock_t t_start, t_end, t_aux1, t_aux2;
  t_start = clock();
	sensor_msgs::PointCloud2::Ptr clusters (new sensor_msgs::PointCloud2);	
  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZ>), cloud_filtered (new pcl::PointCloud<pcl::PointXYZ>), cloud_cropped (new pcl::PointCloud<pcl::PointXYZ>), cloud_downsampled (new pcl::PointCloud<pcl::PointXYZ>);
	pcl::fromROSMsg(*input, *cloud); // The ROS message, given as sensor_msgs::PointCloud2ConstPtr is translated to PCL type pcl::PointCloud<pcl::PointXYZ>::Ptr
  std::cout << "PointCloud before filtering has: " << cloud->points.size () << " data points." << std::endl;
  
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
  pass.filter (*cloud_cropped);
*/

// So it will be done manually
  float low_lim_x, low_lim_y, low_lim_z, up_lim_x, up_lim_y, up_lim_z;
  ros::param::get("low_lim_x", low_lim_x);
  ros::param::get("low_lim_y", low_lim_y);
  ros::param::get("low_lim_z", low_lim_z);
  ros::param::get("up_lim_x", up_lim_x);
  ros::param::get("up_lim_y", up_lim_y);
  ros::param::get("up_lim_z", up_lim_z);
  
  // Remove the points within a cube of volume (up_lim_x - low_lim_x)m x (up_lim_y - low_lim_y)m x (up_lim_z - low_lim_z)m centered in the sensor. In order to avoid 6 comparations at a time it will be performed in three steps, saving efforts
  int k;
  for(k=0; k<=cloud->points.size(); k++)
  {
    if(cloud->points[k].x<low_lim_x || cloud->points[k].x>up_lim_x)
      cloud_cropped->points.push_back (cloud->points[k]);
    else if(cloud->points[k].y<low_lim_y || cloud->points[k].y>up_lim_y)
      cloud_cropped->points.push_back (cloud->points[k]);
    else if(cloud->points[k].z<low_lim_z || cloud->points[k].z>up_lim_z)
      cloud_cropped->points.push_back (cloud->points[k]);
  }
  
  cloud_cropped->width = cloud_cropped->points.size ();
  cloud_cropped->height = 1;
  cloud_cropped->is_dense = true;
  std::cerr << "PointCloud after crop has: " << cloud_cropped->points.size () << " data points." << std::endl;

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
  // Create the filtering object: downsample the dataset using a leaf size of leaf_size meters
  bool do_downsampling;
  ros::param::get("do_downsampling", do_downsampling);
  if (do_downsampling)
  {
    pcl::VoxelGrid<pcl::PointXYZ> vg;
    vg.setInputCloud (cloud_cropped);
    float leaf_size;
    ros::param::get("leaf_size", leaf_size);
    vg.setLeafSize (leaf_size, leaf_size, leaf_size);
    vg.filter (*cloud_downsampled);
    std::cout << "PointCloud after downsampling has: " << cloud_downsampled->points.size ()  << " data points." << std::endl; //*
  }
  
  // Para procesar la nube cortada sin hacer downsampling
  else
    *cloud_downsampled = *cloud_cropped; // a partir de aquí se sigue con cloud_downsampled, esté hecho o no el downsampling (?)
    
  pcl::toROSMsg(*cloud_downsampled, mensaje_ds);
  mensaje_ds.header.frame_id = "base_link";
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
  pcl::PointCloud<pcl::Normal>::Ptr cloud_normals (new pcl::PointCloud<pcl::Normal>);
  pcl::NormalEstimation<pcl::PointXYZ, pcl::Normal> ne;
  pcl::SACSegmentationFromNormals<pcl::PointXYZ, pcl::Normal> segNorm; 
  pcl::ExtractIndices<pcl::PointXYZ> extract;
  pcl::ExtractIndices<pcl::Normal> extract_normals;
  pcl::search::KdTree<pcl::PointXYZ>::Ptr treePlane (new pcl::search::KdTree<pcl::PointXYZ> ());
  pcl::ModelCoefficients::Ptr coefficients_plane (new pcl::ModelCoefficients);
  pcl::ModelCoefficients::Ptr coefficients_line (new pcl::ModelCoefficients), coefficients_cylinder (new pcl::ModelCoefficients);
  pcl::PointIndices::Ptr inliers_plane (new pcl::PointIndices), inliers_line (new pcl::PointIndices), inliers_cylinder (new pcl::PointIndices);
 
  ne.setSearchMethod (treePlane);
  ne.setInputCloud (cloud_downsampled); // ---------------------->>>>>>>> CON DOWNSAMPLING SE HACE DEL ORDEN DE 10 VECES MÁS RÁPIDO
  float KSearchPlane;
  ros::param::get("KSearchPlane", KSearchPlane);
  ne.setKSearch (KSearchPlane); // ----------------------->>>>> CUANTO MÁS ALTO SEA KSearchPlane más lento es ne.compute
                    t_aux1 = clock();
  ne.compute (*cloud_normals); // ------------------->>>>> ~230-240 ms LEEEEEENTOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
                    t_aux2 = clock();
  
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

  // Create the segmentation object for the planar model and set all the parameters
  segNorm.setOptimizeCoefficients (true);
  segNorm.setModelType (pcl::SACMODEL_NORMAL_PLANE);
  float NormalDistanceWeightPlane;
  ros::param::get("NormalDistanceWeightPlane", NormalDistanceWeightPlane);
  segNorm.setNormalDistanceWeight (NormalDistanceWeightPlane);
  segNorm.setMethodType (pcl::SAC_RANSAC);
  float MaxIterationsPlane;
  ros::param::get("MaxIterationsPlane", MaxIterationsPlane);
  segNorm.setMaxIterations (MaxIterationsPlane);
  float DistanceThresholdPlane;
  ros::param::get("DistanceThresholdPlane", DistanceThresholdPlane);
  segNorm.setDistanceThreshold (DistanceThresholdPlane);
  segNorm.setInputCloud (cloud_downsampled);
  segNorm.setInputNormals (cloud_normals);
  // Obtain the plane inliers and coefficients
  segNorm.segment (*inliers_plane, *coefficients_plane);
  std::cerr << "Plane coefficients: " << *coefficients_plane << std::endl;
  
    // Extract the planar inliers from the input cloud
  extract.setInputCloud (cloud_downsampled);
  extract.setIndices (inliers_plane);
  extract.setNegative (true);
  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_NoGround (new pcl::PointCloud<pcl::PointXYZ> ());
  extract.filter (*cloud_NoGround);
  
  pcl::toROSMsg(*cloud_NoGround, mensaje_ng);
  mensaje_ng.header.frame_id = "base_link";
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

  // Creating the KdTree object for the search method of the extraction
  pcl::search::KdTree<pcl::PointXYZ>::Ptr treeSeg (new pcl::search::KdTree<pcl::PointXYZ>);
  treeSeg->setInputCloud (cloud_NoGround);

  std::vector<pcl::PointIndices> cluster_indices;
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
  ec.setSearchMethod (treeSeg);
  ec.setInputCloud (cloud_NoGround);
  ec.extract (cluster_indices); ///////////////////// "VECTOR OF POINT CLOUDS (std::vector<pcl::PointIndices>)" (DESCRIPTION BELOW)
  
  /*********************************************************KEY**********************************************************************/
  /* Here we are creating a vector of PointIndices, which contain the actual index information in a vector<int>. The indices of each detected cluster are saved here - please take note of the fact that cluster_indices is a vector containing one instance of PointIndices for each detected cluster. So cluster_indices[0] contains all indices of the first cluster in our point cloud.
  */
  /****************************************************************************************************************************************/

//                                                              CLUSTERS (in cluster_indices)
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

  int j = 0;
  int n = 0;
       
  geometry_msgs::PoseArray mensaje_aux;
  
  //////////////////////////////////////////////////////////////////////DEBUGGING///////////////////////////////////////////////////////////////////////////////////////
    
    pcl::PointCloud<pcl::PointXYZ>::Ptr cluster_total (new pcl::PointCloud<pcl::PointXYZ>);
    for (std::vector<pcl::PointIndices>::const_iterator it = cluster_indices.begin (); it != cluster_indices.end (); ++it)
  {
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_cluster (new pcl::PointCloud<pcl::PointXYZ>);
    for (std::vector<int>::const_iterator pit = it->indices.begin (); pit != it->indices.end (); ++pit)
      cloud_cluster->points.push_back (cloud_NoGround->points[*pit]);
      
    cloud_cluster->width = cloud_cluster->points.size ();
    cloud_cluster->height = 1;
    cloud_cluster->is_dense = true;
    
    *cluster_total = *cluster_total + *cloud_cluster;
  }
  pcl::toROSMsg(*cluster_total, mensaje_cl);
  mensaje_cl.header.frame_id = "base_link";
  //////////////////////////////////////////////////////////////////////DEBUGGING///////////////////////////////////////////////////////////////////////////////////////
  
  
  
  
  
  // Each for-iteration means analysing one point cloud at a time, considered as a cluster according to the previous stage. The whole analysis of each cluster will be performed within the for-loop. We're iterating through cluster_indices. 
  
  
  for (std::vector<pcl::PointIndices>::const_iterator it = cluster_indices.begin (); it != cluster_indices.end (); ++it)
  {
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_cluster (new pcl::PointCloud<pcl::PointXYZ>);
    for (std::vector<int>::const_iterator pit = it->indices.begin (); pit != it->indices.end (); ++pit)
      cloud_cluster->points.push_back (cloud_NoGround->points[*pit]);
      
    cloud_cluster->width = cloud_cluster->points.size ();
    cloud_cluster->height = 1;
    cloud_cluster->is_dense = true;

      
    /************************************************************************************************************************************************************************/
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // En este punto, cada clúster que se va encontrando se analiza para ver si se puede representar como elemento vertical. Si el Fitting sale positivo, guardaremos únicamente las componentes
    // At this point, each cluster is analysed in order to 
         
    // Create the segmentation object for cylinder segmentation and set all the parameters
    pcl::SACSegmentationFromNormals<pcl::PointXYZ, pcl::Normal> seg;
    pcl::search::KdTree<pcl::PointXYZ>::Ptr tree (new pcl::search::KdTree<pcl::PointXYZ> ());
    pcl::PointCloud<pcl::Normal>::Ptr cloud_normals_cluster (new pcl::PointCloud<pcl::Normal>);
            
    ne.setSearchMethod (tree);
    ne.setInputCloud (cloud_cluster);
    float KSearch;
    ros::param::get("KSearch", KSearch);
    ne.setKSearch (KSearch);
    ne.compute (*cloud_normals_cluster);
    
    seg.setOptimizeCoefficients (true);
    seg.setModelType (pcl::SACMODEL_LINE);
    seg.setMethodType (pcl::SAC_RANSAC);
    float NormalDistanceWeight;
    ros::param::get("NormalDistanceWeight", NormalDistanceWeight);
    seg.setNormalDistanceWeight (NormalDistanceWeight);
    int MaxIterationsFit;
    ros::param::get("MaxIterationsFit", MaxIterationsFit);
    seg.setMaxIterations (MaxIterationsFit);
    float DistanceThresholdFit;
    ros::param::get("DistanceThresholdFit", DistanceThresholdFit);
    seg.setDistanceThreshold (DistanceThresholdFit);
    seg.setInputCloud (cloud_cluster);
    seg.setInputNormals (cloud_normals_cluster);

    // Obtain the line inliers and coefficients
    seg.segment (*inliers_line, *coefficients_line);
    
    float axis_line_x, axis_line_y, axis_line_z;
    ros::param::get("axis_line_x",axis_line_x);
    ros::param::get("axis_line_y",axis_line_y);
    ros::param::get("axis_line_z",axis_line_z);
    
    if(abs(coefficients_line->values[3])<axis_line_x && abs(coefficients_line->values[4])<axis_line_y && abs(coefficients_line->values[5])>axis_line_z) // inclinación menor a 10º aprox
    {
      std::cout << "Line coefficients: " << *coefficients_line << std::endl;
      //std::cout << "Possible vertical element found at" << endl;
      //std::cout << "x: " << coefficients_line->values[0] << " y: " << coefficients_line->values[1] << endl;
      
      ///////////////////////////////////////////////////////////////FILTRO CILINDRO/////////////////////////////////////////////////////////
      //Una vez detectado como línea vertical se comprueba si tiene propiedades de cilindro de hasta cierto tamaño
      seg.setModelType (pcl::SACMODEL_CYLINDER);
      seg.setMethodType (pcl::SAC_RANSAC);
      seg.setInputCloud (cloud_cluster);
      seg.setInputNormals (cloud_normals_cluster);
      float minRadius, maxRadius;
      ros::param::get("minRadius", minRadius);
      ros::param::get("maxRadius", maxRadius);
      seg.setRadiusLimits (minRadius, maxRadius);
        
      seg.segment (*inliers_cylinder, *coefficients_cylinder);
      
      float axis_cylinder_x, axis_cylinder_y, axis_cylinder_z;
      ros::param::get("axis_cylinder_x",axis_cylinder_x);
      ros::param::get("axis_cylinder_y",axis_cylinder_y);
      ros::param::get("axis_cylinder_z",axis_cylinder_z);
      
      if(coefficients_cylinder->values.size() != 0)
      {
        if(abs(coefficients_cylinder->values[3])<axis_cylinder_x && abs(coefficients_cylinder->values[4])<axis_cylinder_y && abs(coefficients_cylinder->values[5])>axis_cylinder_z)  // inclinación menor a 10º aprox - cilindro
        {     
          std::cout << "***************************Cylinder coefficients:" << std::endl;
          std::cout << *coefficients_cylinder << std::endl;
          geometry_msgs::Pose pose;
          //pose.position.x = coefficients_line->values[0]; // Line coefficients
          //pose.position.y = coefficients_line->values[1];
          //pose.position.z = coefficients_line->values[2];
          pose.position.x = coefficients_cylinder->values[0]; // Cylinder coefficients
          pose.position.y = coefficients_cylinder->values[1];
          pose.position.z = coefficients_cylinder->values[2];
                  
          //tf::Vector3 axis_vector(coefficients_line->values[3], coefficients_line->values[4], coefficients_line->values[5]); // Line coefficients
          tf::Vector3 axis_vector(coefficients_cylinder->values[3], coefficients_cylinder->values[4], abs(coefficients_cylinder->values[5])); // Cylinder coefficients

          tf::Vector3 up_vector(1.0, 0.0, 0.0);
          tf::Vector3 right_vector = axis_vector.cross(up_vector);
          right_vector.normalized();
          tf::Quaternion q(right_vector, -1.0*acos(axis_vector.dot(up_vector)));
          q.normalize();
          geometry_msgs::Quaternion element_orientation;
          tf::quaternionTFToMsg(q, element_orientation);
          
          pose.orientation.x = element_orientation.x;
          pose.orientation.y = element_orientation.y;
          pose.orientation.z = element_orientation.z;
          pose.orientation.w = element_orientation.w;
          
          mensaje_aux.poses.push_back(pose);
          n++;
        }
      } 
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /************************************************************************************************************************************************************************/
    
    j++;
  }
  
  mensaje_aux.header.frame_id = "base_link";
  mensaje = mensaje_aux;
  
  std::cout << j+1 << " clusters found" << std::endl;
  std::cout << n << " clusters have been identified as vertical elements" << std::endl;
  
  t_end = clock();
  std::cout << "Calculated in " << 1000.0*((float)(t_end-t_start))/CLOCKS_PER_SEC << " milliseconds" << std::endl;
  std::cout << "Aux Calculated in " << 1000.0*((float)(t_aux2-t_aux1))/CLOCKS_PER_SEC << " milliseconds" << std::endl;
  //t = t - clock();
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
  ros::Rate loop_rate(10);
  
  while (ros::ok())
  {
    ros::spinOnce();
    chatter_pub.publish(mensaje);
    chatter_pub_ds.publish(mensaje_ds); // debugging
    chatter_pub_cl.publish(mensaje_cl); // debugging
    chatter_pub_ng.publish(mensaje_ng); // debugging
    loop_rate.sleep();
    //boost::this_thread::sleep (boost::posix_time::microseconds (10000));
  }
  return(0);
}
