#include <customFunctions.h>


//************************************//
//            FUNCTIONS               //
//************************************//


/*----------------------------------------------------------------------------------------------*/

pcl_segment::positionRPY Comp(pcl_segment::positionRPY position1, pcl_segment::positionRPY position2){ // Composition of two positions: T_ac = T_ab ⊕ T_bc
  Matrix4f T_ab = createHomogMatr(position1);
  Matrix4f T_bc = createHomogMatr(position2);
  
  return(coordRPY(T_ab*T_bc)); 
}

/*----------------------------------------------------------------------------------------------*/

Matrix4f createHomogMatr(pcl_segment::positionRPY position){ // Homogeneous matrix (4x4) of a position given as x, y, z, roll, pitch, yaw 
  Matrix4f result = result.Identity();  
    
  float x = position.x;
  float y = position.y;
  float z = position.z;
  float alpha = position.roll;
  float phi   = position.pitch;
  float theta = position.yaw;
  
  Matrix4f Rx = Rx.Identity();
  Matrix4f Ry = Ry.Identity();
  Matrix4f Rz = Rz.Identity();
  
  Rx(1,1) = cos(alpha);  Rx(1,2) = -sin(alpha);
  Rx(2,1) = sin(alpha);  Rx(2,2) =  cos(alpha);
  
  Ry(0,0) =  cos(phi);   Ry(0,2) = sin(phi);
  Ry(2,0) = -sin(phi);   Ry(2,2) = cos(phi);
  
  Rz(0,0) = cos(theta);  Rz(1,0) = -sin(theta);
  Rz(0,1) = sin(theta);  Rz(1,1) =  cos(theta);

  result = Rx*Ry*Rz;
  
  result(0,3) = x;
  result(1,3) = y;
  result(2,3) = z;
  
  return result;
}

/*----------------------------------------------------------------------------------------------*/

Matrix4f createHomogMatrInv(pcl_segment::positionRPY position){ // Inverse homogeneous matrix (4x4) of a position given as x, y, z, roll, pitch, yaw
  Matrix4f result = result.Zero();  

  float r = position.roll;
  float p = position.pitch;
  float y = position.yaw;

  result(0,0) = cos(r)*cos(p);                                  result(0,1) = sin(r)*cos(p);                              result(0,2) = -sin(p);
  result(1,0) = -sin(r)*cos(y) + cos(r)*sin(p)*sin(y);          result(1,1) = cos(r)*cos(y) + sin(r)*sin(p)*sin(y);       result(1,2) = cos(p)*sin(y);
  result(2,0) = sin(r)*sin(y) + cos(r)*sin(p)*cos(y);           result(2,1) = -cos(r)*sin(y) + sin(r)*sin(p)*cos(y);      result(2,2) = cos(p)*cos(y);
  result(3,0) = 0.0;                                            result(3,1) = 0.0;                                        result(3,2) = 0.0; 
  
  result(0,3) = -position.x*cos(r)*cos(p)-position.y*sin(r)*cos(p)+position.z*sin(p);
  result(1,3) = position.x*(sin(r)*cos(y)-cos(r)*sin(p)*sin(y))-position.y*(cos(r)*cos(y)+sin(p)*sin(r)*sin(y))-position.z*cos(p)*sin(y);
  result(2,3) = -position.x*(sin(r)*sin(y)+cos(r)*sin(p)*cos(y))+position.y*(cos(r)*sin(y)-sin(p)*sin(r)*cos(y))-position.z*cos(p)*cos(y);
  result(3,3) = 1.0;

  return result;
}

/*----------------------------------------------------------------------------------------------*/

pcl_segment::positionRPY coordRPY(Matrix4f homogMatr){ // Position x, y, z, roll, pitch, yaw of an homogeneus matrix (4x4)
  pcl_segment::positionRPY result;

  result.x = homogMatr(0,3);
  result.y = homogMatr(1,3);
  result.z = homogMatr(2,3);
  
  float nx = homogMatr(0,0); float ox = homogMatr(0,1); float ax = homogMatr(0,2);
  float ny = homogMatr(1,0); float oy = homogMatr(1,1); float ay = homogMatr(1,2);
  float nz = homogMatr(2,0); float oz = homogMatr(2,1); float az = homogMatr(2,2);
  
  result.roll = atan2(-ay, az);
  result.pitch = atan2(ax, -ay*sin(result.roll) + az*cos(result.roll));
  result.yaw = atan2(ny*cos(result.roll) + nz*sin(result.roll), oy*cos(result.roll) + oz*sin(result.roll));
    
  return result;
}

/*----------------------------------------------------------------------------------------------*/

Matrix6f J1_n(pcl_segment::positionRPY ab, pcl_segment::positionRPY bc){ // Jacobian 
  Matrix6f result; result = result.Identity();
  Matrix4f H1 = createHomogMatr(ab);
  Matrix4f H2 = createHomogMatr(bc);
  
  pcl_segment::positionRPY ac;
  
  ac = Comp(ab, bc);
  
  result(0,3) = ab.y - ac.y;     result(0,4) = (ac.z - ab.z)*cos(ab.yaw);                                                                   result(0,5) = H1(0,2)*bc.y - H1(0,1)*bc.z;
  result(1,3) = ac.x - ab.x;     result(1,4) = (ac.z - ab.z)*sin(ab.yaw);                                                                   result(1,5) = H1(1,2)*bc.y - H1(1,1)*bc.z;
  result(2,3) = 0.0;             result(2,4) = -bc.x*cos(ab.pitch) - bc.y*sin(ab.pitch)*sin(ab.roll) - bc.z*sin(ab.pitch)*cos(ab.roll);     result(2,5) = H1(2,2)*bc.y - H1(2,1)*bc.z;
  
  result(3,3) = 1.0;             result(3,4) = sin(ac.pitch)*sin(ac.yaw-ab.yaw)/cos(ac.pitch);            result(3,5) = (H2(0,1)*sin(ac.roll)+H2(0,2)*cos(ac.roll))/cos(ac.pitch);
  result(4,3) = 0.0;             result(4,4) = cos(ac.yaw-ab.yaw);                                        result(4,5) = -cos(ab.pitch)*sin(ac.yaw-ab.yaw);
  result(5,3) = 0.0;             result(5,4) = sin(ac.yaw-ab.yaw)/cos(ac.pitch);                          result(5,5) = cos(ab.pitch)*cos(ac.yaw-ab.yaw)/cos(ac.pitch);
  
  return result;
}

/*----------------------------------------------------------------------------------------------*/

Matrix6f J2_n(pcl_segment::positionRPY ab, pcl_segment::positionRPY bc){
  Matrix6f result = result.Zero();
  Matrix4f H1 = createHomogMatr(ab);
  pcl_segment::positionRPY ac;
  
  ac = Comp(ab, bc);
  
  result(0,0) = cos(ab.yaw)*cos(ab.pitch);  result(0,1) = cos(ab.yaw)*sin(ab.pitch)*sin(ab.roll)-sin(ab.yaw)*cos(ab.pitch);   result(0,2) = cos(ab.yaw)*sin(ab.pitch)*cos(ab.roll)+sin(ab.yaw)*sin(ab.pitch);
  result(1,0) = sin(ab.yaw)*cos(ab.pitch);  result(1,1) = sin(ab.yaw)*sin(ab.pitch)*sin(ab.roll)+cos(ab.yaw)*cos(ab.roll);   result(1,2) = sin(ab.yaw)*sin(ab.pitch)*cos(ab.roll)-cos(ab.yaw)*sin(ab.roll);
  result(2,0) = -sin(ab.pitch);             result(2,1) = cos(ab.pitch)*sin(ab.roll);     result(2,2) = cos(ab.pitch)*cos(ab.roll);
  
  result(3,3) = cos(bc.pitch)*cos(ac.roll-bc.roll)/cos(ac.pitch);                  result(3,4) = sin(ac.roll-bc.roll);                                   result(3,5) = 0.0;
  result(4,3) = -cos(bc.pitch)*sin(ac.roll-bc.roll);                               result(4,4) = cos(ac.roll-bc.roll);                                   result(4,5) = 0.0;
  result(5,3) = (H1(0,2)*cos(ac.yaw) + H1(1,2)*sin(ac.yaw))/cos(ac.pitch);         result(5,4) = sin(ac.pitch)*sin(ac.roll-bc.roll)/cos(ac.pitch);       result(5,5) = 1.0;
  
  return result;
}

/*----------------------------------------------------------------------------------------------*/

Matrix6f computeHx2(pcl_segment::observationRPY obs, pcl_segment::positionRPY kalman_pos){
	Matrix6f Hx = Hx.Zero();
	
	Hx = J1_n(kalman_pos, obs.position);

	return Hx;
}

/*----------------------------------------------------------------------------------------------*/

Matrix6f computeHz2(pcl_segment::observationRPY obs, pcl_segment::positionRPY kalman_pos){
	Matrix6f Hz = Hz.Zero();

	Hz = J2_n(kalman_pos, obs.position);

	return Hz;
}

/*----------------------------------------------------------------------------------------------*/

float mahalanobisDistance(const MatrixXf& h, const MatrixXf& S){ 
  
//  Vector6f diff;
//  float result;
  MatrixXf hTSih(1, 1); hTSih = hTSih.Zero(1, 1);
//  std::cout << "h:" << std::endl << h << std::endl;
//  std::cout << "S:" << std::endl << S << std::endl;
//  diff = RPY2Vec(map.position) - RPY2Vec(candidate.position);
  hTSih = h.transpose()*S.inverse()*h;
//  hTSih = hTSih.sqrt();
//  std::cout<< "fun mahalan: " << (h.transpose()*S.inverse()*h) << std::endl;
  
  return hTSih(0, 0);
}

/*----------------------------------------------------------------------------------------------*/

Vector6f computeInnovation(pcl_segment::positionRPY kalman_pos, pcl_segment::observationRPY obs, pcl_segment::observationRPY map_landmark){ // Innovation step of EKF
  Vector6f result;
  pcl_segment::positionRPY Xhz = Comp(kalman_pos, obs.position); // FIXME obs_v FRAME?
  
  result = RPY2Vec(Xhz) - RPY2Vec(map_landmark.position);
  result(3) = AngRango(result(3));
  result(4) = AngRango(result(4));
  result(5) = AngRango(result(5));
  
  return(result);
}

/*----------------------------------------------------------------------------------------------*/

pcl_segment::positionRPY Inv(pcl_segment::positionRPY position){ // Same of createHomogMatrInv?
  Matrix4f H = createHomogMatr(position);
  
  return(coordRPY(H.inverse()));
}

/*----------------------------------------------------------------------------------------------*/

float AngRango (float ang)
{
  float PI = 3.141596;
	if (ang > PI)
	{
		ang=ang-2*PI;
		AngRango(ang);
	}
	if (ang < -PI)
	{
		ang=2*PI+ang;
		AngRango(ang);
	}

	return ang;
}

/*----------------------------------------------------------------------------------------------*/

pcl_segment::positionRPY vec2RPY(Vector6f position){ // Conversion Vector6f -> pcl_segment::positionRPY
  pcl_segment::positionRPY result;
  
  result.x = position(0);
  result.y = position(1);
  result.z = position(2);
  result.roll = position(3);
  result.pitch = position(4);
  result.yaw = position(5);
  
  return(result);
}

/*----------------------------------------------------------------------------------------------*/

Vector6f RPY2Vec(pcl_segment::positionRPY position){ // Conversion pcl_segment::positionRPY -> Vector6f
  Vector6f result;
  
  result << position.x, position.y, position.z, position.roll, position.pitch, position.yaw;
  
  return(result);
}
