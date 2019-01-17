#include <ros/ros.h>
#include <time.h>
#include <math.h>
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
#include "geometry_msgs/PoseStamped.h"
#include "pcl_conversions/pcl_conversions.h"
#include <stdexcept>

//ros::NodeHandle nh;
geometry_msgs::PoseStamped mensaje;
  
void callback(const sensor_msgs::PointCloud2ConstPtr& input) // Debe estar publicando el /izq/velodyne_points para que la callback lo detecte
{
  std::cout << "llega" << endl;
	sensor_msgs::PointCloud2::Ptr clusters (new sensor_msgs::PointCloud2);	
	pcl::PointCloud<pcl::PointXYZ>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZ>), cloud_f (new pcl::PointCloud<pcl::PointXYZ>);
	pcl::fromROSMsg(*input, *cloud); // Con esto ya tengo la nube de puntos de los mensajes en el puntero cloud
  
    mensaje.pose.position.x= (rand()%5);
    mensaje.pose.position.y= (rand()%5);
    mensaje.pose.position.z= (rand()%5);
    mensaje.pose.orientation.x= 0.0;
    mensaje.pose.orientation.y= 0.0;
    mensaje.pose.orientation.z= 0.0;
    mensaje.pose.orientation.w= 1.0;
    
    
    std::cout << "mensaje: " << mensaje << endl;
    
    
}



int 
main (int argc, char** argv)
{
  clock_t t;
  t = clock();
  ros::init(argc, argv, "euclidean_clustering");
  ros::NodeHandle nh; 
  ros::Subscriber sub = nh.subscribe ("izq/velodyne_points", 1, callback);
  ros::Publisher chatter_pub = nh.advertise<geometry_msgs::PoseStamped>("chatter", 1000);
  srand (time(NULL));
  
  // Read in the cloud data
  pcl::PCDReader reader;
  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZ>), cloud_filtered (new pcl::PointCloud<pcl::PointXYZ>), cloud_cropped (new pcl::PointCloud<pcl::PointXYZ>), cloud_downsampled (new pcl::PointCloud<pcl::PointXYZ>);
  
  XmlRpc::XmlRpcValue cloud_filename;
  ros::param::get("cloud_filename", cloud_filename);
  reader.read (cloud_filename, *cloud);
  std::cout << "PointCloud before filtering has: " << cloud->points.size () << " data points." << std::endl; //*
  


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


// El filtro incluido en la librería filters/passthrough no permite múltiples condiciones simultáneas
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

// De manera que se hace más manual
  float low_lim_x, low_lim_y, low_lim_z, up_lim_x, up_lim_y, up_lim_z;
  ros::param::get("low_lim_x", low_lim_x);
  ros::param::get("low_lim_y", low_lim_y);
  ros::param::get("low_lim_z", low_lim_z);
  ros::param::get("up_lim_x", up_lim_x);
  ros::param::get("up_lim_y", up_lim_y);
  ros::param::get("up_lim_z", up_lim_z);
  
  //Eliminar los puntos dentro de un cubo de un volumen de (up_lim_x - low_lim_x)m x (up_lim_y - low_lim_y)m x (up_lim_z - low_lim_z)m centrado en el sensor
  int k;
  for(k=0; k<=cloud->points.size(); k++) // Para no hacer 6 comparaciones en una línea se separa en tres pasos, así se podrían ahorrar algunas
  {
    if(cloud->points[k].x<low_lim_x || cloud->points[k].x>up_lim_x)
      cloud_cropped->points.push_back (cloud->points[k]); //*
    else if(cloud->points[k].y<low_lim_y || cloud->points[k].y>up_lim_y)
      cloud_cropped->points.push_back (cloud->points[k]); //*
    else if(cloud->points[k].z<low_lim_z || cloud->points[k].z>up_lim_z)
      cloud_cropped->points.push_back (cloud->points[k]); //*
  }
  
  pcl::PCDWriter writer;
  cloud_cropped->width = cloud_cropped->points.size ();
  cloud_cropped->height = 1;
  cloud_cropped->is_dense = true;
  std::cerr << "PointCloud after crop has: " << cloud_cropped->points.size () << " data points." << std::endl;
  std::stringstream ss;
  ss << "cloud_cropped.pcd";
  //writer.write<pcl::PointXYZ> (ss.str (), *cloud_cropped, false);


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
//////////////////////////////////////////////////////////////     POINT NORMAL ESTIMATION
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
  ne.setInputCloud (cloud_downsampled);
  ne.setKSearch (200);
  ne.compute (*cloud_normals);
//////////////////////////////////////////////////////////////////////////////////////












                                                                 

  // Create the segmentation object for the planar model and set all the parameters
  segNorm.setOptimizeCoefficients (true);
  segNorm.setModelType (pcl::SACMODEL_NORMAL_PLANE);
  segNorm.setNormalDistanceWeight (0.5);
  segNorm.setMethodType (pcl::SAC_RANSAC);
  segNorm.setMaxIterations (100);
  segNorm.setDistanceThreshold (0.2);
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
  
  
  
  
  
  
  boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer (new pcl::visualization::PCLVisualizer ("3D Viewer"));
  viewer->setBackgroundColor (0, 0, 0);
  viewer->addPointCloud<pcl::PointXYZ> (cloud, "sample cloud");
  viewer->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 1, "sample cloud");
  viewer->addCoordinateSystem (1.0);
  viewer->initCameraParameters ();
  viewer->setCameraPosition (0.0, 0.0, 20.0, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, 0);
    
  pcl::ModelCoefficients coeffs;
  coeffs.values.push_back (coefficients_plane->values[0]);
  coeffs.values.push_back (coefficients_plane->values[1]);
  coeffs.values.push_back (coefficients_plane->values[2]);
  coeffs.values.push_back (coefficients_plane->values[3]);
  viewer->addPlane (coeffs, "plane");
  
  boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer2 (new pcl::visualization::PCLVisualizer ("3D Viewer cropped"));
  viewer2->setBackgroundColor (0, 0, 0);
  viewer2->addPointCloud<pcl::PointXYZ> (cloud_cropped, "sample cloud 2");
  viewer2->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 1, "sample cloud 2");
  viewer2->addCoordinateSystem (1.0);
  viewer2->initCameraParameters ();
  viewer2->setCameraPosition (0.0, 0.0, 20.0, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, 0);
  
  
  boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer3 (new pcl::visualization::PCLVisualizer ("3D Viewer downsampled"));
  if (do_downsampling)
  {
    viewer3->setBackgroundColor (0, 0, 0);
    viewer3->addPointCloud<pcl::PointXYZ> (cloud_downsampled, "sample cloud 3");
    viewer3->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 1, "sample cloud 3");
    viewer3->addCoordinateSystem (1.0);
    viewer3->initCameraParameters ();
    viewer3->setCameraPosition (0.0, 0.0, 20.0, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, 0);
  }


  boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer_NoGround (new pcl::visualization::PCLVisualizer ("3D Viewer no ground"));
  viewer_NoGround->setBackgroundColor (0, 0, 0);
  viewer_NoGround->addPointCloud<pcl::PointXYZ> (cloud_NoGround, "sample cloud no ground");
  viewer_NoGround->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 1, "sample cloud no ground");
  viewer_NoGround->addCoordinateSystem (1.0);
  viewer_NoGround->initCameraParameters ();
  viewer_NoGround->setCameraPosition (0.0, 0.0, 20.0, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, 0);
  

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
  ec.extract (cluster_indices); ///////////////////// "VECTOR DE NUBES DE PUNTOS" (DESCRIPCIÓN A CONTINUACIÓN)
  
  
  /*********************************************************CLAVÍSIMO**********************************************************************/
  /* Here we are creating a vector of PointIndices, which contain the actual index information in a vector<int>. The indices of each detected cluster are saved here - please take note of the fact that cluster_indices is a vector containing one instance of PointIndices for each detected cluster. So cluster_indices[0] contains all indices of the first cluster in our point cloud.
  */
  /****************************************************************************************************************************************/
    
  boost::shared_ptr<pcl::visualization::PCLVisualizer> viewerclusters (new pcl::visualization::PCLVisualizer ("3D Viewer clusters"));
  viewerclusters->setBackgroundColor (0.0, 0.0, 0.0);
  viewerclusters->addCoordinateSystem (1.0);
  viewerclusters->initCameraParameters ();
  viewerclusters->setCameraPosition (0.0, 0.0, 20.0, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, 0);
  
  
  boost::shared_ptr<pcl::visualization::PCLVisualizer> viewervert_elem (new pcl::visualization::PCLVisualizer ("3D Viewer vertical elements"));
  viewervert_elem->setBackgroundColor (0.0, 0.0, 0.0);
  viewervert_elem->addPointCloud<pcl::PointXYZ> (cloud, "sample cloud vert");
  viewervert_elem->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 1, "sample cloud vert");
  viewervert_elem->addCoordinateSystem (1.0);
  viewervert_elem->initCameraParameters ();
  viewervert_elem->setCameraPosition (0.0, 0.0, 20.0, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, 0);
  
  float color_r, color_g, color_b;
  int j = 0;
  int n = 0;
  
     //   std::cout << "debug1" << endl;
        
  for (std::vector<pcl::PointIndices>::const_iterator it = cluster_indices.begin (); it != cluster_indices.end (); ++it)
  {
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_cluster (new pcl::PointCloud<pcl::PointXYZ>);
    for (std::vector<int>::const_iterator pit = it->indices.begin (); pit != it->indices.end (); ++pit)
      cloud_cluster->points.push_back (cloud_NoGround->points[*pit]); //*
      
      //        std::cout << "debug1b" << endl;
    cloud_cluster->width = cloud_cluster->points.size ();
    cloud_cluster->height = 1;
    cloud_cluster->is_dense = true;

    //std::cout << "PointCloud representing the Cluster " << j << ": " << cloud_cluster->points.size () << " data points." << std::endl;
    std::stringstream ss;
    ss << "cloud_cluster_" << j << ".pcd";
    //writer.write<pcl::PointXYZ> (ss.str (), *cloud_cluster, false);
    viewerclusters->addPointCloud<pcl::PointXYZ> (cloud_cluster, ss.str ());
    color_r= (rand()%5)/10.0 + 0.6;
    color_g= (rand()%5)/10.0 + 0.6;
    color_b= (rand()%5)/10.0 + 0.6;
    
    viewerclusters->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_COLOR, color_r, color_g, color_b, ss.str ());

      
    /************************************************************************************************************************************************************************/
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // En este punto, cada clúster que se va encontrando se analiza para ver si se puede representar como elemento vertical. Si el Fitting sale positivo, guardaremos únicamente las componentes 
         
    // Create the segmentation object for cylinder segmentation and set all the parameters
    pcl::SACSegmentationFromNormals<pcl::PointXYZ, pcl::Normal> seg;
    pcl::search::KdTree<pcl::PointXYZ>::Ptr tree (new pcl::search::KdTree<pcl::PointXYZ> ());
    pcl::PointCloud<pcl::Normal>::Ptr cloud_normals_cluster (new pcl::PointCloud<pcl::Normal>);
    //pcl::ModelCoefficients::Ptr coefficients_line (new pcl::ModelCoefficients), coefficients_cylinder (new pcl::ModelCoefficients);
          //  std::cout << "debug1c" << endl;
    //coefficients_cylinder->values[0] = 0;
    //coefficients_cylinder->values[1] = 0;
          //  std::cout << "debug1d" << endl;
    ne.setSearchMethod (tree);
    ne.setInputCloud (cloud_cluster);
    ne.setKSearch (200);
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
    
    if(abs(coefficients_line->values[3])<0.1 && abs(coefficients_line->values[4])<0.1 && abs(coefficients_line->values[5])>0.85) // inclinación menor a 10º aprox
    {
      std::cout << "Line coefficients: " << *coefficients_line << std::endl;
      //std::cout << "Possible vertical element found at" << endl;
      std::cout << "x: " << coefficients_line->values[0] << " y: " << coefficients_line->values[1] << endl;
      
      float distance;
      //distance = sqrt(pow(coefficients_line->values[0],2) + pow(coefficients_line->values[1],2));
      
      //std::cout << "Distance to element: " << distance << endl;
      
      
      
      
      
      ///////////////////////////////////////////////////////////////EN PRUEBAS/////////////////////////////////////////////////////////
      //Una vez detectado como línea vertical se comprueba si tiene propiedades de cilindro de hasta cierto tamaño
      seg.setModelType (pcl::SACMODEL_CYLINDER);
      seg.setMethodType (pcl::SAC_RANSAC);
      seg.setInputCloud (cloud_cluster);
      seg.setInputNormals (cloud_normals_cluster);
      float minRadius, maxRadius;
      ros::param::get("minRadius", minRadius);
      ros::param::get("maxRadius", maxRadius);
      seg.setRadiusLimits (minRadius, maxRadius);

      // Obtain the cylinder inliers and coefficients
      
      
        //std::cout << "debug2" << endl;
        
        seg.segment (*inliers_cylinder, *coefficients_cylinder);
        if(coefficients_cylinder->values.size() == 0)
          std::cout << "Fallo" << std::endl;
        else
        {
        //std::cout << "debug3" << endl;
        
          //        std::cout << "debug4" << endl;
            //    std::cout << "debug5" << endl;
          std::cout << "***************************Cylinder coefficients: " << *coefficients_cylinder << std::endl;
          std::cout << "Possible vertical element found at" << endl;
          std::cout << "x: " << coefficients_cylinder->values[0] << " y: " << coefficients_cylinder->values[1] << endl;
             //     std::cout << "debug6" << endl;
          distance = sqrt(pow(coefficients_cylinder->values[0],2) + pow(coefficients_cylinder->values[1],2));
              //    std::cout << "debug7" << endl;
          std::cout << "Distance to element: " << distance << endl;
          ///////////////////////////////////////////////////////////////EN PRUEBAS/////////////////////////////////////////////////////////
              //    std::cout << "debug7" << endl;
          
          
          
          
          ss << "cloud_vert_elem_" << j << ".pcd";
          //writer.write<pcl::PointXYZ> (ss.str (), *cloud_cluster, false);
          viewervert_elem->addPointCloud<pcl::PointXYZ> (cloud_cluster, ss.str ());
          /*
          color_r= (rand()%5)/10.0 + 0.6;
          color_g= (rand()%5)/10.0 + 0.6;
          color_b= (rand()%5)/10.0 + 0.6;
          */
          color_r= 1.0;
          color_g= 0.0;
          color_b= 0.0;
                //  std::cout << "debug8" << endl;
          viewervert_elem->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_COLOR, color_r, color_g, color_b, ss.str ());
          viewervert_elem->setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 3, ss.str ());
          n++;
          }
             //  std::cout << "debug9" << endl;
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /************************************************************************************************************************************************************************/
    
    j++;
  }
  std::cout << j+1 << " clusters found" << std::endl;
  std::cout << n << " clusters have been identified as vertical elements" << std::endl;

  std::cout << "Calculated in " << 1000.0*((float)t)/CLOCKS_PER_SEC << " milliseconds" << std::endl;

  while (ros::ok())
  {
    chatter_pub.publish(mensaje);
    ros::spinOnce();
    viewer->spinOnce (100);
    viewer2->spinOnce (100);
    viewer3->spinOnce (100);
    viewer_NoGround->spinOnce (100);
    viewerclusters->spinOnce (100);
    viewervert_elem->spinOnce (100);
    boost::this_thread::sleep (boost::posix_time::microseconds (100000));
  }
  
  return(0);
}
