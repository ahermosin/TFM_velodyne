#include <ros/ros.h>
#include <time.h>
#include <math.h>
#include <tf/tf.h>
#include <tf/transform_broadcaster.h>
#include <tf/LinearMath/Quaternion.h>
#include "nav_msgs/Path.h"
#include "geometry_msgs/PoseStamped.h"
#include "geometry_msgs/Pose.h"


void poseCallback(const geometry_msgs::PoseStamped msg){
  static tf::TransformBroadcaster br;
  tf::Transform transform;
  tf::Quaternion q;

  transform.setOrigin(tf::Vector3(msg.pose.position.x, msg.pose.position.y, 0.0) );
  tf::quaternionMsgToTF(msg.pose.orientation, q);
  transform.setRotation(q);
  
  br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "map", "base_link"));
}


int 
main (int argc, char** argv)
{
  ros::init(argc, argv, "tf_stuff");
  ros::NodeHandle nh; 
  ros::Subscriber sub_pose = nh.subscribe("/myposes", 10, poseCallback);
  ros::Rate loop_rate(100);
  //clock_t t1, t2;
  
  while (ros::ok())
  {
    //t1 = clock();
    ros::spinOnce();
    //t2 = clock();
    //std::cout << "Calculated in " << 1000.0*((float)(t2-t1))/CLOCKS_PER_SEC << " ms" << std::endl;
    loop_rate.sleep();
  }
  return(0);
}
