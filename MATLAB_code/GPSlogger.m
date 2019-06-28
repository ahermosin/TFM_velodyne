prueba = 0;

if (prueba == 1)
    GPS = load('test/logGPS1.txt');
    Odom = load('test/logOdom1.txt');
    EKF = load('test/logEKF1.txt');
elseif (prueba == 2)
    GPS = load('test/logGPS2.txt');
    Odom = load('test/logOdom2.txt');
    EKF = load('test/logEKF2.txt');
elseif (prueba == 0)
    Odom = load('logOdom.txt');
    GPS = load('logGPS.txt');
    EKF = load('logEKF.txt');    
end

theta_gps = atand((GPS(70,2)-GPS(1,2))/(GPS(70,1)-GPS(1,1))); % GPS(70,1) test1
% theta_gps = atand((GPS(165,2)-GPS(1,2))/(GPS(165,1)-GPS(1,1))); % GPS(165,1) test2
theta = theta_gps;

rotation = [cosd(theta) sind(theta); -sind(theta) cosd(theta)];

OdomCoord = [Odom(:,1) Odom(:,2)]; 
GPSCoord = [GPS(:,1) GPS(:,2)];
EKFCoord = [EKF(:,1) EKF(:,2)];

OdomCoord = OdomCoord*rotation;
% GPSCoord = GPSCoord*rotation;
EKFCoord = EKFCoord*rotation;

figure(1) % (x,y) GPS coordinates
hold on
% plot(GPS(:,1), GPS(:,2), 'g-')
plot(GPSCoord(:,1), GPSCoord(:,2), 'g-')
plot(EKFCoord(:,1), EKFCoord(:,2), 'r-')
plot(OdomCoord(:,1), OdomCoord(:,2), 'm-')
% grid
xlim([-30 150])
ylim([-20 50])
% axis equal

% figure(2) % 
% plot(GPS(:,3))
% grid
% 
% figure(3)
% plot(GPS(:,4))
% grid