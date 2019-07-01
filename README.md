# TFM_velodyne

In this Master's Thesis there will be developed a set of nodes that implement an algorithm which can segment and detect vertical elements in the environment from point clouds. These elements are useful for self-location in autonomous vehicles, in case of the GPS signal malfunction, when they have been previously positioned (geo-located) with respect an absolute reference frame. The position of the vertical elements with respect to the car will be used to update its position with Extended Kalman Filter.

The way it will perform is by receiving information from sensor_msgs::PointCloud2 from a LiDAR's topic (two in this case) and analysing this information, returning the coordinates of the detected elements as well as their orientation.

The algorithm is divided in two main stages: Point clouds analysis and EKF implementation.

## Stage 1: Point clouds analysis
It will be carried out in 9 steps:
- Play a rosbag
- Message reception and conversion (from ROS message to PCL format type) via topic subscription
- Merging of point clouds
- Cropping the center of the point cloud, which is considered as non-important given that the points around the sensor will be irrelevant (i.e., they will be part of the structure of the car)
- Downsampling the point cloud, so that we can improve the time that it takes to process the point cloud without affecting the result
- Ground extraction, to reduce the number of points for further analysis and get some information about the environment we're in, as well as separating clusters for further clustering (in the next step)
- Clustering using the Euclidean Clustering algorithm (implemented in PCL), which is one of the key parts in the project, with accurate tuning of a set of parameters
- Line fitting of the clusters, to decide wether or not they can be identified as vertical elements within some constraints (tilt, width, height...)
- Publishing the coordinates and orientation of each detected element in a geometry_msgs::PoseArray to a topic

## Stage 2: EKF implementation
It will be carried out in 4 steps:
- Initialize: read the map of vertical elements and set EKF matrices
- Read geometry_msgs::PoseArray with the information of vertical elements found
- Calculate odometry as prediction technique
- Try data association via Mahalanobis distance and Chi square test
- (If succeeded) Uptade prediction

## Visualization
- (Optional) Visualization in RViz

## Ground truth
- There is a GPS node which shows a ground truth location in RViz
