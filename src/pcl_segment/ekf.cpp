

//  Created on: Jul 29, 2013
//      Author: pdelapuente

#include "ekf/Kalman_Loc2.h"
#include <math.h>
#include <assert.h>

#include "ekf/pugixml.hpp"

//init, pred y actualiz

Kalman_Loc::Kalman_Loc(void)
{

}

void Kalman_Loc::initialization(std::string paramsFileName)
{

	debug_output.open("localization_debugging.txt",std::ios::out);
	debug_output << "Localization debugging " << endl;

	cout<<paramsFileName<<endl;
	kalman_pos.ReSize(6,1);
	kalman_pos=0.0;

	cov_kalman.ReSize(6,6);
	cov_kalman=0.0;


    	//XML document
	pugi::xml_document doc;
    std::ifstream nameFile(paramsFileName.c_str());
	pugi::xml_parse_result result = doc.load(nameFile);

   	if (!result) //FIXME, pass as argument
   	{
    		cout << "Xml file missing " << endl;
    		assert(0);
    
   	}
   
   /////////////////////////////////////////////////////////////////////////////////////
    
   // initial pose
	kalman_pos(1,1) = atof(doc.child("main").child("params").child_value("x_0"));
	kalman_pos(2,1) = atof(doc.child("main").child("params").child_value("y_0"));
	kalman_pos(3,1) = atof(doc.child("main").child("params").child_value("z_0"));
	kalman_pos(4,1) = atof(doc.child("main").child("params").child_value("yaw_0"))*DEG2RAD;
	kalman_pos(5,1) = atof(doc.child("main").child("params").child_value("pitch_0"))*DEG2RAD;
	kalman_pos(6,1) = atof(doc.child("main").child("params").child_value("roll_0"))*DEG2RAD;

	debug_output << "Initial pose from file " << endl;
	debug_output << "kalman_pos(1,1) " << kalman_pos(1,1) << endl;
	debug_output << "kalman_pos(2,1) " << kalman_pos(2,1) << endl;
	debug_output << "kalman_pos(3,1) " << kalman_pos(3,1) << endl;
	debug_output << "kalman_pos(4,1) " << kalman_pos(4,1) << endl;
	debug_output << "kalman_pos(5,1) " << kalman_pos(5,1) << endl;
	debug_output << "kalman_pos(6,1) " << kalman_pos(6,1) << endl;

	cout << "Initial pose from file " << endl;
	cout << "kalman_pos(1,1) " << kalman_pos(1,1) << endl;
	cout << "kalman_pos(2,1) " << kalman_pos(2,1) << endl;
	cout << "kalman_pos(3,1) " << kalman_pos(3,1) << endl;
	cout << "kalman_pos(4,1) " << kalman_pos(4,1) << endl;
	cout << "kalman_pos(5,1) " << kalman_pos(5,1) << endl;
	cout << "kalman_pos(6,1) " << kalman_pos(6,1) << endl;

	prev_odom_pose.ReSize(6,1);
	//prev_odom_pose=0.0;
	prev_odom_pose=kalman_pos; //gets updated from the pose estimator node!!


/////////////////////////////////////////////////////////////////////////////////////

	//covariance values

	//odom covariance
	sigma_odom_x = atof(doc.child("main").child("params").child_value("sigma_odom_x"))*DEG2RAD;
	sigma_odom_y = atof(doc.child("main").child("params").child_value("sigma_odom_y"))*DEG2RAD;
	sigma_odom_z = atof(doc.child("main").child("params").child_value("sigma_odom_z"))*DEG2RAD;
	sigma_odom_roll = atof(doc.child("main").child("params").child_value("sigma_odom_roll"))*DEG2RAD;
	sigma_odom_pitch = atof(doc.child("main").child("params").child_value("sigma_odom_pitch"))*DEG2RAD;
	sigma_odom_yaw = atof(doc.child("main").child("params").child_value("sigma_odom_yaw"))*DEG2RAD;

	//obs covariance
	R.ReSize(6,6);
	R = 0.0;
	double sigma_obs_x = atof(doc.child("main").child("params").child_value("sigma_obs_x"));
	R(1,1) = pow(sigma_obs_x,2);

	double sigma_obs_y = atof(doc.child("main").child("params").child_value("sigma_obs_y"));
	R(2,2) = pow(sigma_obs_y,2);

	double sigma_obs_z = atof(doc.child("main").child("params").child_value("sigma_obs_z"));
	R(3,3) = pow(sigma_obs_z,2);

	double sigma_obs_roll = atof(doc.child("main").child("params").child_value("sigma_obs_roll"));
	R(4,4) = pow(sigma_obs_roll*DEG2RAD,2);

	double sigma_obs_pitch = atof(doc.child("main").child("params").child_value("sigma_obs_pitch"));
	R(5,5) = pow(sigma_obs_pitch*DEG2RAD,2);

	double sigma_obs_yaw = atof(doc.child("main").child("params").child_value("sigma_obs_yaw"));
	R(6,6) = pow(sigma_obs_yaw*DEG2RAD,2);

/////////////////////////////////////////////////////////////////////////////////////


    visualMarkersListInitialization(paramsFileName);


    mapInitialization(paramsFileName);

    return;
}



Kalman_Loc::~Kalman_Loc(void)
{
}

void Kalman_Loc::mapInitialization(string paramsFileName)
{
    //XML document
    pugi::xml_document doc;
    std::ifstream nameFile(paramsFileName.c_str());
    pugi::xml_parse_result result = doc.load(nameFile);

   if (!result) //FIXME, pass as argument
   {
    cout << "Xml file missing " << endl;
    assert(0);
    
   }
   
   /////////////////////////////////////////////////////////////////////////////////////
    
   // known Arucos

   pugi::xml_node Arucos = doc.child("main").child("params").child("Arucos");
   for (pugi::xml_node aruco = Arucos.child("Aruco"); aruco; aruco = aruco.next_sibling("Aruco"))
   {
	int id = atoi(aruco.attribute("id").value());
	double x = atof(aruco.attribute("x").value());
	double y = atof(aruco.attribute("y").value());
	double z = atof(aruco.attribute("z").value());
	double roll = atof(aruco.attribute("yaw").value())*DEG2RAD;
	double pitch = atof(aruco.attribute("pitch").value())*DEG2RAD;
	double yaw = atof(aruco.attribute("roll").value())*DEG2RAD;

	debug_output << " known aruco from file " << id << " " << x << " " << y << " " << z << " " << roll << " " << pitch << " " << yaw << endl;

	Landmark3D known_pole(id,x,y,z,roll,pitch,yaw);
	known_pole.is_known = true;
	map.push_back( known_pole);
   }   



}


void Kalman_Loc::visualMarkersListInitialization(std::string paramsFileName)
{
    visualMarkersList.resize(0);


    //XML document
    pugi::xml_document doc;
    std::ifstream nameFile(paramsFileName.c_str());
    pugi::xml_parse_result result = doc.load(nameFile);

    if (!result) //FIXME, pass as argument
    {
        cout << "Xml file missing " << endl;
        assert(0);
    }


    // VisualMarkerList
    pugi::xml_node VisualMarkerList = doc.child("main").child("params").child("VisualMarkerList");

    // VisualMarkersRange
    for (pugi::xml_node VisualMarkersRange = VisualMarkerList.child("VisualMarkersRange"); VisualMarkersRange; VisualMarkersRange = VisualMarkersRange.next_sibling("VisualMarkersRange"))
    {
        int fromId = atoi(VisualMarkersRange.attribute("fromId").value());
        int toId = atoi(VisualMarkersRange.attribute("toId").value());

        for(int id=fromId; id<=toId; id++)
        {
            if(!isVisualMarkerInList(id))
            {
                visualMarkersList.push_back(id);
                //std::cout<<"Added Visual Marker with id="<<id<<std::endl;
            }
        }
    }


    // VisualMarker
    for (pugi::xml_node VisualMarker = VisualMarkerList.child("VisualMarker"); VisualMarker; VisualMarker = VisualMarker.next_sibling("VisualMarker"))
    {
        int id = atoi(VisualMarker.attribute("id").value());

        if(!isVisualMarkerInList(id))
        {
            visualMarkersList.push_back(id);
            //std::cout<<"Added Visual Marker with id="<<id<<std::endl;
        }

    }


    return;
}


bool Kalman_Loc::isVisualMarkerInList(int id)
{
    std::list<int>::iterator findIter = std::find(visualMarkersList.begin(), visualMarkersList.end(), id);

    if(findIter==visualMarkersList.end())
        return false;
    else
        return true;
}


Matrix Kalman_Loc::KalmanPredict(float odom_pose_x, float odom_pose_y, float odom_pose_z, float odom_pose_roll, float odom_pose_pitch, float odom_pose_yaw)//Next kalman position
{
	ColumnVector current_odom_pose(6);
	current_odom_pose << odom_pose_x << odom_pose_y << odom_pose_z << odom_pose_roll << odom_pose_pitch << odom_pose_yaw;

	    debug_output << "prev_odom_pose " << prev_odom_pose(1) << " " <<prev_odom_pose(2) << " " <<prev_odom_pose(3) << " " <<prev_odom_pose(4)*RAD2DEG << " " << prev_odom_pose(5)*RAD2DEG << " " <<prev_odom_pose(6)*RAD2DEG << endl;
	    debug_output << "current_odom_pose " << current_odom_pose(1) << " " << current_odom_pose(2) << " " <<current_odom_pose(3) << " " <<current_odom_pose(4)*RAD2DEG << " " << current_odom_pose(5)*RAD2DEG << " " <<current_odom_pose(6)*RAD2DEG << endl;

	ColumnVector inc_odom(6);
	inc_odom = Comp(Inv(prev_odom_pose), current_odom_pose);

	    debug_output << "odom inc " << inc_odom(1) << " " << inc_odom(2) << " " <<inc_odom(3) << " " <<inc_odom(4)*RAD2DEG << " " << inc_odom(5)*RAD2DEG << " " <<inc_odom(6)*RAD2DEG << endl;

	kalman_pos << Comp(kalman_pos, inc_odom);	//the prediction

	    debug_output << "prediction " << kalman_pos(1,1) << " " << kalman_pos(2,1) << " " <<kalman_pos(3,1) << " " <<kalman_pos(4,1)*RAD2DEG << " " << kalman_pos(5,1)*RAD2DEG << " " << kalman_pos(6,1)*RAD2DEG << endl;

	// odom pose
	//odom_pos << Comp(odom_pos, inc_odom);
	//odom_path.push_back(odom_pos);

	    prev_odom_pose = current_odom_pose;

	Matrix Q(6,6);
	IdentityMatrix eye(6);
	Q << eye;
	Q(1,1)=pow(sigma_odom_x,2);
	Q(2,2)=pow(sigma_odom_y,2);
	Q(3,3)=pow(sigma_odom_z,2);
	Q(4,4)=pow(sigma_odom_roll,2);
	Q(5,5)=pow(sigma_odom_pitch,2);
	Q(6,6)=pow(sigma_odom_yaw,2);

	Matrix Fx(6,6);
	Matrix Fu(6,6);

	Fx << J1_n(kalman_pos,inc_odom);
	Fu << J2_n(kalman_pos,inc_odom);

	cov_kalman=Fx*cov_kalman*Fx.t()+Fu*Q*Fu.t();

	x = kalman_pos(1,1);
	y = kalman_pos(2,1);
	z = kalman_pos(3,1);
	roll = kalman_pos(4,1);
	pitch = kalman_pos(5,1);
	yaw = kalman_pos(6,1);

	return kalman_pos;
}

Matrix Kalman_Loc::KalmanUpdate(const std::vector<Observation3D>& v)//
{	

	int obs_size = v.size();
	int tam_max=6*(v.size());

	//debug_output << "tam max " << tam_max << endl;

	Matrix h(tam_max,1);
	Matrix Hx(tam_max,6);
	//Matrix Hz(tam_max,6);

	std::vector<Matrix> Hz_v;

	std::vector<int> new_landmarks;//

	Matrix hi(6,1);
	int tam=0;

	for(int i=0;i<v.size();i+=1) //the observations
	{
		Observation3D obs = v[i];
		int obs_id = obs.id;
		       // cout << "obs id " << obs_id << endl;

		bool recognized_landmark = false;
		int j=0;
		for (j=0; j<map.size();j++) // the map landmarks
		{
			int landmark_id = map[j].id;
			if (obs_id == landmark_id)
			{
				recognized_landmark = true;
				//cout << "recognized id " << landmark_id << endl;
				break;


			}
		}

		if (recognized_landmark) //
		{	
			Landmark3D map_landmark = map[j];

			debug_output << "recognized landmark " << map_landmark.id << " " << map_landmark.x << " " << map_landmark.y << " " << map_landmark.z << " " << map_landmark.roll*RAD2DEG << " " << map_landmark.pitch*RAD2DEG << " " << map_landmark.yaw*RAD2DEG << endl;
			debug_output << "observation " << obs.id << " " << obs.x << " " << obs.y << " " << obs.z << " " << obs.roll*RAD2DEG << " " << obs.pitch*RAD2DEG << " " << obs.yaw*RAD2DEG << endl;

			hi = computeInnovation2(obs,map_landmark);
			// update innovation h
			h.SubMatrix(tam+1,tam+6,1,1) << hi;
			debug_output << "innovation " << hi(1,1) << " " << hi(2,1) << " " << hi(3,1) << " " << hi(4,1)*RAD2DEG << " " << hi(5,1)*RAD2DEG << " " << hi(6,1)*RAD2DEG << endl;
			// compute jacobians
			Matrix Hxi(6,6);
			Hxi << computeHx2(obs);
			Hx.SubMatrix(tam+1,tam+6,1,6) << Hxi;
			Matrix Hzi(6,6);
			Hzi << computeHz2(obs);
			//Hz.SubMatrix(tam+1,tam+6,tam+1,tam+6) << Hzi;
			Hz_v.push_back(Hzi);

			tam+=6;	

		}
		else
		{
			new_landmarks.push_back(i);
		}

	}

	if(tam>0)//Kalman correction step
	{	
		cout << "tam " << tam << endl;
		Matrix PHt(6,tam);
		Matrix Hx_resized(tam,6);
		Hx_resized << Hx.submatrix(1,tam,1,6);

		PHt << cov_kalman * Hx_resized.t();
		Matrix S(tam,tam);
		S << Hx_resized*PHt;

		for(int i=0;i<Hz_v.size();i++)
		{
			Matrix Hzi(6,6);
			Hzi << Hz_v[i];
			Matrix aux1(6,6);
			aux1 << Hzi*R*Hzi.t();
			Matrix aux2 = S.SubMatrix(i*6+1,i*6+6,i*6+1,i*6+6);
			S.SubMatrix(i*6+1,i*6+6,i*6+1,i*6+6) << aux1 + aux2;
		}

		Matrix K(6,tam);
		K << PHt*S.i();

		Matrix h_resized(tam,1);
		h_resized << h.submatrix(1,tam,1,1);

		kalman_pos << kalman_pos-K*h_resized; //PUBLICAR
		IdentityMatrix eye(6);
		cov_kalman << (eye-K*Hx_resized)*cov_kalman;

	}

	//add new landmarks to the map
	for(int k=0;k<new_landmarks.size();k++)
	{
		int ind=new_landmarks[k];
		Observation3D new_obs = v[ind];
		debug_output << "new landmark " << new_obs.id << endl;

        	//cout << "new landmark " << new_obs.id << endl;

        	Matrix obs(6,1);obs(1,1)=new_obs.x;obs(2,1)=new_obs.y;obs(3,1)=new_obs.z;
        	obs(4,1)=new_obs.roll; obs(5,1)=new_obs.pitch; obs(6,1)=new_obs.yaw;

        	debug_output << "obs " << new_obs.id << " " << new_obs.x << " " <<new_obs.y << " " << new_obs.z << " " << new_obs.roll*RAD2DEG << " " << new_obs.pitch*RAD2DEG << " " << new_obs.yaw*RAD2DEG << endl;

		if (fabs(new_obs.pitch) > 10*DEG2RAD) cout << "Pitch of new landmark greater than 10º" << endl;
		if (fabs(new_obs.yaw) > 10*DEG2RAD) cout << "Yaw of new landmark greater than 10º" << endl;

		//obs(3,0)=new_obs.roll; obs(4,0)=new_obs.pitch; obs(5,0)=new_obs.yaw;

		//Correct the pose and add the new landmark to the map
		Matrix pos_abs(6,1);
		pos_abs=Comp(kalman_pos,obs);
        	Landmark3D lp(new_obs.id, pos_abs(1,1), pos_abs(2,1), pos_abs(3,1), pos_abs(4,1), pos_abs(5,1), pos_abs(6,1));
        	//cout << "lp " << lp.id << " " << lp.x << " " <<lp.y << " " << lp.z << " " << lp.roll*RAD2DEG << " " << lp.pitch*RAD2DEG << " " << lp.yaw*RAD2DEG << endl;
        	debug_output << "lp " << lp.id << " " << lp.x << " " <<lp.y << " " << lp.z << " " << lp.roll*RAD2DEG << " " << lp.pitch*RAD2DEG << " " << lp.yaw*RAD2DEG << endl;
        	map.push_back(lp);

         	//cout << "landmark added " << endl;

	}

	debug_output << "correction " << kalman_pos(1,1) << " " << kalman_pos(2,1) << " " <<kalman_pos(3,1) << " " <<kalman_pos(4,1) << " " << kalman_pos(5,1) << " " << kalman_pos(6,1) << endl;

	x = kalman_pos(1,1);
	y = kalman_pos(2,1);
	z = kalman_pos(3,1);
	roll = kalman_pos(4,1);
	pitch = kalman_pos(5,1);
	yaw = kalman_pos(6,1);

	return kalman_pos;


}

Matrix Kalman_Loc::computeInnovation2(Observation3D obs, Landmark3D map_landmark)
{
	Matrix hi(6,1);

	Matrix obs_v(6,1);
	obs_v(1,1) = obs.x; obs_v(2,1) = obs.y; obs_v(3,1) = obs.z;
	obs_v(4,1) = obs.roll; obs_v(5,1) = obs.pitch; obs_v(6,1) = obs.yaw;

	Matrix Xhz = Comp(kalman_pos,obs_v);

	debug_output << "Xhz " << Xhz(1,1) << " " << Xhz(2,1) << " " <<Xhz(3,1) << " " <<Xhz(4,1)*RAD2DEG << " " << Xhz(5,1)*RAD2DEG << " " << Xhz(6,1)*RAD2DEG << endl;

	Matrix Xb(6,1);
	Xb(1,1) = map_landmark.x; Xb(2,1) = map_landmark.y; Xb(3,1) = map_landmark.z;
	Xb(4,1) = map_landmark.roll; Xb(5,1) = map_landmark.pitch; Xb(6,1) = map_landmark.yaw;

	hi=Xhz-Xb;

	hi(4,1) = AngRango(hi(4,1));
	hi(5,1) = AngRango(hi(5,1));
	hi(6,1) = AngRango(hi(6,1));

	return hi;
}


/***************************************************************************************/


Matrix Kalman_Loc::computeHx2(Observation3D obs)
{
	Matrix Hx(6,6);
	Hx = 0.0;

	Matrix obs_v(6,1);
	obs_v(1,1) = obs.x; obs_v(2,1) = obs.y; obs_v(3,1) = obs.z;
	obs_v(4,1) = obs.roll; obs_v(5,1) = obs.pitch; obs_v(6,1) = obs.yaw;

	Hx = J1_n(kalman_pos, obs_v);

	return Hx;

}



/***************************************************************************************/

Matrix Kalman_Loc::computeHz2(Observation3D obs)
{

	Matrix Hz(6,6);
	Hz = 0.0;

	Matrix obs_v(6,1);
	obs_v(1,1) = obs.x; obs_v(2,1) = obs.y; obs_v(3,1) = obs.z;
	obs_v(4,1) = obs.roll; obs_v(5,1) = obs.pitch; obs_v(6,1) = obs.yaw;

	Hz = J2_n(kalman_pos, obs_v);

	return Hz;
}



