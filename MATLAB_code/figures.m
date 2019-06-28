figure(1)
[X,Y] = meshgrid(-1:.005:1);
thetalim = 10;
Z = sqrt(X.^2 + Y.^2)/tand(thetalim);
s1 = surf(X,Y,Z,'FaceAlpha',0.4, 'EdgeColor', 'none', 'FaceColor', 'r', 'FaceLighting', 'flat');
axis equal
light('Position',[-5 0 0],'Style','infinite')
hold on
xl = xlim()
yl = ylim()
zl = zlim()
line(2*xl, [0,0], [0,0], 'LineWidth', 0.1, 'Color', 'k');
line([0,0], 2*yl, [0,0], 'LineWidth', 0.1, 'Color', 'k');
line([0,0], [0,0], 2*zl, 'LineWidth', 0.1, 'Color', 'k');
zlim([-1 2])





figure(2)
N = 200;
thetavec = linspace(0,pi,N);
phivec = linspace(0,2*pi,2*N);
[th, ph] = meshgrid(thetavec,phivec);
R = ones(size(th)); % should be your R(theta,phi) surface in general

x = R.*sin(th).*cos(ph);
y = R.*sin(th).*sin(ph);
z = R.*cos(th);
s2 = surf(x,y,z, 'FaceAlpha', 0.4, 'EdgeColor', 'none', 'FaceColor', 'b', 'FaceLighting', 'flat');
axis equal
light('Position',[-5 0 0],'Style','infinite')
hold on
xl = xlim()
yl = ylim()
zl = zlim()
line(2*xl, [0,0], [0,0], 'LineWidth', 0.1, 'Color', 'k');
line([0,0], 2*yl, [0,0], 'LineWidth', 0.1, 'Color', 'k');
line([0,0], [0,0], 2*zl, 'LineWidth', 0.1, 'Color', 'k');
zlim([-1 2])




figure(3)
[X,Y] = meshgrid(-1:.005:1);
thetalim = 10;
Z = sqrt(X.^2 + Y.^2)/tand(thetalim);

s1 = surf(X,Y,Z,'FaceAlpha',0.4, 'EdgeColor', 'none', 'FaceColor', 'r', 'FaceLighting', 'flat');
hold on

N = 200;
thetavec = linspace(0,pi,N);
phivec = linspace(0,2*pi,2*N);
[th, ph] = meshgrid(thetavec,phivec);
R = ones(size(th)); % should be your R(theta,phi) surface in general
x = R.*sin(th).*cos(ph);
y = R.*sin(th).*sin(ph);
z = R.*cos(th);

s2 = surf(x,y,z, 'FaceAlpha', 0.4, 'EdgeColor', 'none', 'FaceColor', 'b', 'FaceLighting', 'flat');
axis equal
zlim([-1 2])
light('Position',[-5 0 0],'Style','infinite')

xl = xlim()
yl = ylim()
zl = zlim()
line(2*xl, [0,0], [0,0], 'LineWidth', 0.1, 'Color', 'k');
line([0,0], 2*yl, [0,0], 'LineWidth', 0.1, 'Color', 'k');
line([0,0], [0,0], 2*zl, 'LineWidth', 0.1, 'Color', 'k');







figure(4)
N = 200;
thetavec = linspace(0,pi,N);
phivec = linspace(0,2*pi,2*N);
[th, ph] = meshgrid(thetavec,phivec);
R = ones(size(th)); % should be your R(theta,phi) surface in general
x = R.*sin(th).*cos(ph);
y = R.*sin(th).*sin(ph);
z = R.*cos(th);

s1 = surf(x,y,z, 'FaceAlpha', 0.1, 'EdgeColor', 'none', 'FaceColor', 'b', 'FaceLighting', 'flat');
hold on
N = 200;
thetavec = linspace(0,thetalim*pi/180,N);
phivec = linspace(0,2*pi,2*N);
[th, ph] = meshgrid(thetavec,phivec);
R = ones(size(th)); % should be your R(theta,phi) surface in general
x = R.*sin(th).*cos(ph);
y = R.*sin(th).*sin(ph);
z = R.*cos(th);

s2 = surf(x,y,z, 'FaceAlpha', 0.8, 'EdgeColor', 'none', 'FaceColor', 'r', 'FaceLighting', 'flat');
axis equal
zlim([-1 2])
light('Position',[0 0 2],'Style','infinite')

xl = xlim()
yl = ylim()
zl = zlim()

line(2*xl, [0,0], [0,0], 'LineWidth', 0.1, 'Color', 'k');
line([0,0], 2*yl, [0,0], 'LineWidth', 0.1, 'Color', 'k');
line([0,0], [0,0], 2*zl, 'LineWidth', 0.1, 'Color', 'k');
