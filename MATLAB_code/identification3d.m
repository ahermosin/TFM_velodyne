% 'P' is a nx6 (or nx3) matrix containing identified objects in logFile.txt as following:

% successn xn yn errorn inliersn ration

% successn: bool meaning that n-th object meets the criteria of a vertical element
% [xn yn]: float coordinates of the n-th object
% errorn: square root of the squared distances of every point in the
% cluster of the n-th object to the model of the fitted line
% inliersn: inliers of the fitted line model in the cluster of the n-th
% object
% ration: inliersn divided by the total number of points in the n-th object
% cluster

nivel = 3;
prueba = 3;
map = 3;
num = 0; % set to 0 for last log
draw_veMap = 1;

init_theta_gps = [
    -7.4;    % 1  : 1_1  -> map1_1
    -5.4;    % 2  : 1_2  -> map1_2
    -2.0;    % 3  : 2_1  -> map2
    -3.6782; % 4  : 2_1b -> map2
    -4.8585; % 5  : 2_2  -> map2
    -6.4044; % 6  : 2_3  -> map2
    -2.6943; % 7  : 2_4  -> map2
    -5.1944; % 8  : 3_1  -> map3
    -2.8435; % 9  : 3_2  -> map3
    -5.5275  % 10 : 3_3  -> map3
    ];

theta_gps = init_theta_gps(10);

rotation = [cosd(theta_gps) sind(theta_gps); -sind(theta_gps) cosd(theta_gps)];
veMap = load(strcat('map',num2str(map),'.csv'));

if(num == 0)
    VE = load('logVE.txt');
    Odom = load('logOdom.txt');
    EKF = load('logEKF.txt');
    GPS = load('logGPS.txt');
    GPSRaw = load('logGPSRaw.txt');
else
    VE = load(strcat('test/nivel',num2str(nivel),'prueba',num2str(prueba),'/',num2str(num),'logVE.txt'));
    Odom = load(strcat('test/nivel',num2str(nivel),'prueba',num2str(prueba),'/',num2str(num),'logOdom.txt'));    
    EKF = load(strcat('test/nivel',num2str(nivel),'prueba',num2str(prueba),'/',num2str(num),'logEKF.txt'));
    GPS = load(strcat('test/nivel',num2str(nivel),'prueba',num2str(prueba),'/',num2str(num),'logGPS.txt'));
    GPSRaw = load(strcat('test/nivel',num2str(nivel),'prueba',num2str(prueba),'/',num2str(num),'logGPSRaw.txt'));
end



OdomCoord = [Odom(:,1) Odom(:,2)]; 
GPSCoord = [GPS(:,1) GPS(:,2)];
EKFCoord = [EKF(:,1) EKF(:,2)];
VECoord = [VE(:,2) VE(:,3)];

coord_ref = [458963.38 4462551.17];
offsetGPS = coord_ref;

OdomCoord = OdomCoord*rotation;
% GPSCoord = GPSCoord*rotation;
EKFCoord = EKFCoord*rotation;
VECoord = VECoord*rotation;
veMap = veMap - ones(size(veMap,1),1)*offsetGPS;

OdomCoordGlob = OdomCoord + ones(size(OdomCoord,1),1)*offsetGPS;
EKFCoordGlob = EKFCoord + ones(size(EKFCoord,1),1)*offsetGPS;
PCoordGlob = VECoord + ones(size(VECoord,1),1)*offsetGPS;
veMapGlob = veMap + ones(size(veMap,1),1)*offsetGPS;
GPSCoordGlob = GPSRaw(:,1:2);

radius = 0.5;
theta = linspace(0,2*pi);

xlims = [-150 150];
ylims = [-100 100];

if(size(VE,2) == 6)
    figure(1); title('error');
    hold on
    for i=1:size(VE,1)
        if(VE(i,1)==0)
            plot3(VECoord(i,1),VECoord(i,2),100*VE(i,4),'+r')
        else
            plot3(VECoord(i,1),VECoord(i,2),100*VE(i,4),'g+')
        end
    end
    xlim(xlims)
    ylim(ylims)
    grid
    
    if(draw_veMap)
        % Check identifications around ground truth values of object locations
        for i=1:length(veMap)
            x = radius*cos(theta) + veMap(i,1);
            y = radius*sin(theta) + veMap(i,2);
            plot3(x,y,zeros(1,length(theta)),'b-')

            x = 5*radius*cos(theta) + veMap(i,1);
            y = 5*radius*sin(theta) + veMap(i,2);
            plot3(x,y,zeros(1,length(theta)),'k-')

            plot3(veMap(i,1)*ones(2,1), veMap(i,2)*ones(2,1), [0 100], '-b')
        end
    end
    
    plot3(OdomCoord(:,1), OdomCoord(:,2), zeros(1,length(OdomCoord)), '-m')
    plot3(EKFCoord(:,1), EKFCoord(:,2), zeros(1,length(EKFCoord)), '-r')
    plot3(GPSCoord(:,1), GPSCoord(:,2), zeros(1,length(GPSCoord)), '-g')
    axis equal
%     
%     figure(2); title('inliers');
%     hold on
%     for i=1:size(VE,1)
%         if(VE(i,1)==0)
%             plot3(VECoord(i,1),VECoord(i,2),VE(i,5),'+r')
%         else
%             plot3(VECoord(i,1),VECoord(i,2),VE(i,5),'+g')
%         end
%     end
%     xlim(xlims)
%     ylim(ylims)
%     grid
%     
%     if(draw_veMap)
%         % Check identifications around ground truth values of object locations
%         for i=1:length(veMap)
%             x = radius*cos(theta) + veMap(i,1);
%             y = radius*sin(theta) + veMap(i,2);
%             plot3(x,y,zeros(1,length(theta)),'b-')
% 
%             x = 5*radius*cos(theta) + veMap(i,1);
%             y = 5*radius*sin(theta) + veMap(i,2);
%             plot3(x,y,zeros(1,length(theta)),'k-')
% 
%             plot3(veMap(i,1)*ones(2,1), veMap(i,2)*ones(2,1), [0 100], '-b')
%         end
%     end
%     
%     plot3(OdomCoord(:,1), OdomCoord(:,2), zeros(1,length(OdomCoord)), '-m')
%     plot3(EKFCoord(:,1), EKFCoord(:,2), zeros(1,length(EKFCoord)), '-r')
%     plot3(GPSCoord(:,1), GPSCoord(:,2), zeros(1,length(GPSCoord)), '-g')
%     axis equal
%     
%     figure(3); title('ratio');
%     hold on
%     for i=1:size(VE,1)
%         if(VE(i,1)==0)
%             plot3(VECoord(i,1),VECoord(i,2),100*VE(i,6),'+r')
%         else
%             plot3(VECoord(i,1),VECoord(i,2),100*VE(i,6),'+g')
%         end
%     end
%     xlim(xlims)
%     ylim(ylims)
%     grid
%     
%     if(draw_veMap)
%         % Check identifications around ground truth values of object locations
%         for i=1:length(veMap)
%             x = radius*cos(theta) + veMap(i,1);
%             y = radius*sin(theta) + veMap(i,2);
%             plot3(x,y,zeros(1,length(theta)),'b-')
% 
%             x = 5*radius*cos(theta) + veMap(i,1);
%             y = 5*radius*sin(theta) + veMap(i,2);
%             plot3(x,y,zeros(1,length(theta)),'k-')
% 
%             plot3(veMap(i,1)*ones(2,1), veMap(i,2)*ones(2,1), [0 100], '-b')
%         end
%     end
%     
%     plot3(OdomCoord(:,1), OdomCoord(:,2), zeros(1,length(OdomCoord)), '-m')
%     plot3(EKFCoord(:,1), EKFCoord(:,2), zeros(1,length(EKFCoord)), '-r')
%     plot3(GPSCoord(:,1), GPSCoord(:,2), zeros(1,length(GPSCoord)), '-g')
% 
%     axis equal
    
    
elseif(size(VE,2) == 3)
    figure(1); title('identifications');
    hold on
    for i=1:size(VE,1)
        if(VE(i,1)==0)
            plot(VE(i,2),VE(i,3),'+r')
        else
            plot(VE(i,2),VE(i,3),'+g')
        end
    end
    xlim(xlims)
    ylim(ylims)
    grid
    
    % Check identifications around ground truth values of object locations
    
    for i=1:length(veMap)
        x = radius*cos(theta) + veMap(i,1);
        y = radius*sin(theta) + veMap(i,2);
        plot(x,y,'b')
        
        x = 5*radius*cos(theta) + veMap(i,1);
        y = 5*radius*sin(theta) + veMap(i,2);
        plot(x,y,'k')
    end
    
    plot(OdomCoord(:,1), OdomCoord(:,2), '-m')
    plot(EKFCoord(:,1), EKFCoord(:,2), '-r')
    plot(GPSCoord(:,1), GPSCoord(:,2), '-g')
    axis equal
    hold off
end

hold off






count = zeros(length(veMap),4);
% First column: positive identifications
% Second column: false negatives
% Third column: total number of identifications
% Fourth column: difference between positives and false negatives (better
% when closer to column 1)

for i=1:size(VE,1)
    for j=1:length(veMap)
        if((VECoord(i,1)-veMap(j,1))^2 + (VECoord(i,2)-veMap(j,2))^2 < radius^2)
            if (VE(i,1) == 1)
                count(j,1) = count(j,1) + 1;
            else
                count(j,2) = count(j,2) - 1;
            end
        end
        count(j,3) = count(j,1) - count(j,2);
        count(j,4) = count(j,1) + count(j,2);
    end
end

if(draw_veMap)
    count
end

% Commited error approach
[GPS_xpart, GPS_ypart] = fractionate(GPSCoord(:,1), GPSCoord(:,2),...
    GPSCoord(1,1), GPSCoord(length(GPSCoord),1), 3400);
[EKF_xpart, EKF_ypart] = fractionate(EKFCoord(:,1), EKFCoord(:,2),...
    EKFCoord(1,1), EKFCoord(length(EKFCoord),1), 3400);
abs_error = abs(GPS_ypart-EKF_ypart);
figure(4)
plot(GPS_xpart, abs_error)
hold on
grid

