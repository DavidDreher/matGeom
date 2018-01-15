%CREATETREFOILKNOT Create a 3D mesh around a trefoild curve
%
%   [X, Y, Z] = createTrefoilKnot;
%   [X, Y, Z] = createTrefoilKnot(NPTS);
%
%   Example
%   createTrefoilKnot
%
%   See also
%
 
% ------
% Author: David Legland
% e-mail: david.legland@grignon.inra.fr
% Created: 2015-01-07,    using Matlab 8.4.0.150421 (R2014b)
% Copyright 2015 INRA - Cepia Software Platform.

%% Constants

% number of vertices of trefoil curve
nPoints = 200;

% thickness of the 3D mesh
thickness = .5;

% number of corners around each curve vertex
nCorners = 16;


%% Create trefoil curve

% parameterisation variable
t = linspace(0, 2*pi, nPoints + 1);
t(end) = [];

% trefoil curve coordinates
x = sin(t) + 2 * sin(2 * t);
y = cos(t) - 2 * cos(2 * t);
z = -sin(3 * t);

% display curve
figure; 
plot3(x, y, z, 'linewidth', 2, 'color', 'b');
axis equal; view(3);
axis([-4 4 -4 4 -2 2]);


%% Create surrounding mesh

% compute mesh
[v2, f2] = matGeom.meshes3d.curveToMesh(curve, thickness, nCorners);

% diusplay mesh
figure;
matGeom.meshes3d.drawMesh(v2, f2);

% keep same display options
axis equal; view(3);
axis([-4 4 -4 4 -2 2]);
