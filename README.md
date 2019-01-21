# TFM_velodyne

In this Master's Thesis there will be developed a node that implements an algorithm which can detect vertical elements in the environment. These elements are useful for self-location in autonomous vehicles, in case of the GPS signal malfunction, when they have been previously identified and positioned with respect an absolute reference frame.

The way it will perform is by receiving information from sensor_msgs::PointCloud2 from a LiDAR's topic (or more) and analysing this information, returning the coordinates of the detected elements as well as their orientation.

It will be carried out in 8 steps:

- Message reception and conversion (from ROS message to PCL format type) via topic subscription
- Cropping the center of the point cloud, which is considered as non-important given that the points around the sensor will be irrelevant (i.e., they will not be vertical elements to detect)
- Downsampling the point cloud, so that we can improve the time that it takes to process the point cloud without affecting the result
- Ground extraction, to reduce the number of points for further analysis and get some information about the environment we're in
- Clustering using the Euclidean Clustering algorithm (implemented in PCL), which is one of the key parts in the project, with accurate tuning of a set of parameters
- Line and cylinder fitting of the clusters, to decide wether or not they can be identified as vertical elements within some constraints
- Publishing the coordinates and orientation of each detected element in a geometry_msgs::PoseArray to a topic.
- (Optional) Visualization in RViz
