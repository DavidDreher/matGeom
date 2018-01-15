function demoInertiaEllipsoid(varargin)
%DEMOINERTIAELLIPSOID Demo program for the use of ellipsoids
%
%   Usage:
%   demoInertiaEllipsoid;
%
%   Example
%   demoInertiaEllipsoid
%
%   See also
%     demoRevolutionSurface, demoDrawTubularMesh

% ------
% Author: David Legland
% e-mail: david.legland@inra.fr
% Created: 2011-06-21,    using Matlab 7.9.0.529 (R2009b)
% Copyright 2011 INRA - Cepia Software Platform.


%% Data generation

% Generate gaussian 3D data
nPoints = 1000;
points = randn(nPoints, 3);

% point clouds parameters
center = [20 30 40];
sizes  = [70 40 10];
orient = [50 30 30];

% transform points to make a gaussian cloud
transfo = matGeom.geom3d.composeTransforms3d(...
    matGeom.geom3d.createScaling3d(sizes), ...
    matGeom.geom3d.eulerAnglesToRotation3d(orient), ...
    matGeom.geom3d.createTranslation3d(center));
points = matGeom.geom3d.transformPoint3d(points, transfo);

% display data
figure;
matGeom.geom3d.drawPoint3d(points, '.');
hold on;
axis equal;
view([80 -10]);


%% Inertia ellipsoid computation and display

% Fit a 3D inertia ellipsoid to data
elli = matGeom.geom3d.inertiaEllipsoid(points);

% draw the ellipsoid with transparency
matGeom.geom3d.drawEllipsoid(elli, 'FaceColor', 'g', 'FaceAlpha', .5);


%% Add ellipses and main axes

matGeom.geom3d.drawEllipsoid(elli, 'FaceColor', 'g', 'FaceAlpha', .5, ...
          'drawEllipses', true, 'EllipseColor', 'b', 'EllipseWidth', 2, ...
          'drawAxes', true);
      
