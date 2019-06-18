#include <Eigen/Eigen>
#include <Eigen/Dense>
#include <pcl_segment/positionRPY.h>
#include <pcl_segment/observationRPY.h>

using namespace Eigen;
typedef Eigen::Matrix<float, 5, 5> Matrix5f;
typedef Eigen::Matrix<float, 6, 6> Matrix6f;
typedef Eigen::Matrix<float, 5, 1> Vector5f;
typedef Eigen::Matrix<float, 6, 1> Vector6f;


//************************************************//
//            FUNCTION DECLARATIONS               //
//************************************************//

Matrix4f createHomogMatr(pcl_segment::positionRPY pos);
pcl_segment::positionRPY coordRPY(Matrix4f pos);
pcl_segment::positionRPY Comp(pcl_segment::positionRPY pos1, pcl_segment::positionRPY pos2);
pcl_segment::positionRPY Inv(pcl_segment::positionRPY pos);
Matrix4f createHomogMatrInv(pcl_segment::positionRPY pos);
Matrix6f J1_n(pcl_segment::positionRPY pos1, pcl_segment::positionRPY pos2);
Matrix6f J2_n(pcl_segment::positionRPY pos1, pcl_segment::positionRPY pos2);
Matrix6f computeHx2(pcl_segment::observationRPY obs, pcl_segment::positionRPY pos);
Vector6f computeInnovation(pcl_segment::positionRPY pos, pcl_segment::observationRPY obs, pcl_segment::observationRPY map);
Matrix6f computeHz2(pcl_segment::observationRPY obs, pcl_segment::positionRPY pos);
float mahalanobisDistance(pcl_segment::observationRPY obs, pcl_segment::observationRPY map, Matrix6f S);
float AngRango(float ang);
pcl_segment::positionRPY vec2RPY(Vector6f pos);
Vector6f RPY2Vec(pcl_segment::positionRPY pos);
