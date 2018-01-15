function checkClipRay(varargin)
%CHECKCLIPRAY  One-line description here, please.
%   output = checkClipRay(input)
%
%   Example
%   checkClipRay
%
%   See also
%
%
% ------
% Author: David Legland
% e-mail: david.legland@grignon.inra.fr
% Created: 2010-05-13,    using Matlab 7.9.0.529 (R2009b)
% Copyright 2010 INRA - Cepia Software Platform.

% generate 2D rays in -50->150 in each direction
N = 50;
origins = rand(N, 2)*200 - 50;
theta = rand(N, 1)*2*pi;
directions = [cos(theta) sin(theta)];
rays = [origins directions];

% create new figure
figure(1); clf;
axis([-50 150 -50 150]);
hold on;

% draw all rays
matGeom.geom2d.drawRay(rays);

% clip rays
box = [0 100 0 100];
clipped = matGeom.geom2d.clipRay(rays, box);

% draw clipped edges
matGeom.geom2d.drawBox(box);
matGeom.geom2d.drawEdge(clipped, 'linewidth', 2);
matGeom.geom2d.drawPoint(origins, 'bo');
