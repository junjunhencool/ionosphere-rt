%% Textured 3D Earth example
%
% Ryan Gray
% 8 Sep 2004
% Revised 9 March 2006, 31 Jan 2006

%% Options

space_color = 'k';
npanels = 72;   % Number of globe panels around the equator deg/panel = 360/npanels
alpha   = 1; % globe transparency level, 1 = opaque, through 0 = invisible

% Earth texture image
% Anything imread() will handle), but needs to be a 2:1 unprojected globe
% image.

image_file = 'earth.jpg';

% Mean spherical earth

% erad    = 6378137; % equatorial radius (meters)
% prad    = 6356752.3; % polar radius (meters)
erad    = 6371000; % equatorial radius (meters)
prad    = 6371000; % polar radius (meters)
erot    = 7.2921158553e-5; % earth rotation rate (radians/sec)

%% Create figure

%figure('Color', space_color);

%hold on;

% Turn off the normal axes

set(gca, 'NextPlot','add', 'Visible','off');

axis equal;
%axis auto;

% Set initial view

axis vis3d;
        

%% Create wireframe globe

% Create a 3D meshgrid of the sphere points using the ellipsoid function

[x, y, z] = ellipsoid(0, 0, 0, erad, erad, prad, npanels);

globe = surf(x, y, -z, 'FaceColor', 'none', 'EdgeColor', 0.5*[1 1 1]);

%% Texturemap the globe

% Load Earth image for texture map

cdata = imread(image_file);

% Set image as color data (cdata) property, and set face color to indicate
% a texturemap, which Matlab expects to be in cdata. Turn off the mesh edges.

set(globe, 'FaceColor', 'texturemap', 'CData', cdata, 'FaceAlpha', alpha, 'EdgeColor', 'none');

