% 'P' is a nx3 matrix containing identified objects in logFile.txt as following:
% successn xn yn
% successn: bool meaning that n-th object meets the criteria of a vertical element
% [xn yn]: float coordinates of the n-th object

%P = load('test/prueba1/6logFile.txt');
P = load("logFile.txt");
veMap = load("veMap2.yaml");
radius = 0.5;
theta = linspace(0,2*pi);

figure(1); title('error');
hold on
for i=1:length(P)
    if(P(i,1)==0)
        plot3(P(i,2),P(i,3),100*P(i,4),'+r')
    else
        plot3(P(i,2),P(i,3),100*P(i,4),'+g')
    end
end
xlim([-30 150])
ylim([-20 50])
grid

% Check identifications around ground truth values of object locations
for i=1:length(veMap)
    x = radius*cos(theta) + veMap(i,1);
    y = radius*sin(theta) + veMap(i,2);
    plot3(x,y,zeros(1,length(theta)),'.b')
    
    x = 5*radius*cos(theta) + veMap(i,1);
    y = 5*radius*sin(theta) + veMap(i,2);
    plot3(x,y,zeros(1,length(theta)),'.k')
    
    plot3(veMap(i,1)*ones(2,1), veMap(i,2)*ones(2,1), [0 100], '-b')
end
axis equal

figure(2); title('inliers');
hold on
for i=1:length(P)
    if(P(i,1)==0)
        plot3(P(i,2),P(i,3),P(i,5),'+r')
    else
        plot3(P(i,2),P(i,3),P(i,5),'+g')
    end
end
xlim([-30 150])
ylim([-20 50])
grid

for i=1:length(veMap)
    x = radius*cos(theta) + veMap(i,1);
    y = radius*sin(theta) + veMap(i,2);
    plot3(x,y,zeros(1,length(theta)),'.b')
    
    x = 5*radius*cos(theta) + veMap(i,1);
    y = 5*radius*sin(theta) + veMap(i,2);
    plot3(x,y,zeros(1,length(theta)),'.k')
    
    plot3(veMap(i,1)*ones(2,1), veMap(i,2)*ones(2,1), [0 100], '-b')
end

axis equal
figure(3); title('ratio');
hold on
for i=1:length(P)
    if(P(i,1)==0)
        plot3(P(i,2),P(i,3),100*P(i,6),'+r')
    else
        plot3(P(i,2),P(i,3),100*P(i,6),'+g')
    end
end
xlim([-30 150])
ylim([-20 50])
grid

% Check identifications around ground truth values of object locations
radius = 0.5;

theta = linspace(0,2*pi);

for i=1:length(veMap)
    x = radius*cos(theta) + veMap(i,1);
    y = radius*sin(theta) + veMap(i,2);
    plot3(x,y,zeros(1,length(theta)),'.b')
    
    x = 5*radius*cos(theta) + veMap(i,1);
    y = 5*radius*sin(theta) + veMap(i,2);
    plot3(x,y,zeros(1,length(theta)),'.k')
    
    plot3(veMap(i,1)*ones(2,1), veMap(i,2)*ones(2,1), [0 100], '-b')
end

axis equal
hold off

count = zeros(length(veMap),4);
% First column: positive identifications
% Second column: false negatives
% Third column: total number of identifications
% Fourth column: difference between positives and false negatives (better
% when closer to column 1)

for i=1:length(P)
    for j=1:length(veMap)
        if((P(i,2)-veMap(j,1))^2 + (P(i,3)-veMap(j,2))^2 < radius^2)
            if (P(i,1) == 1)
                count(j,1) = count(j,1) + 1;
            else
                count(j,2) = count(j,2) - 1;
            end
        end
    count(j,3) = count(j,1) - count(j,2);
    count(j,4) = count(j,1) + count(j,2);
    end
end

count