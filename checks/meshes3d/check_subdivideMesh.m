%CHECK_SUBDIVIDEMESH Check the function subdivdeMesh
%
%   output = checkSubdivideMesh(input)
%
%   Example
%   checkSubdivideMesh
%
%   See also
%
%
% ------
% Author: David Legland
% e-mail: david.legland@grignon.inra.fr
% Created: 2013-08-22,    using Matlab 7.9.0.529 (R2009b)
% Copyright 2013 INRA - Cepia Software Platform.


%% Initialisations

% create mesh
vertices = [20 26;10 20;20 14;30 20];
faces = [1 2 3;1 3 4];

% draw the mesh into a new figure
figure(1); clf;
matGeom.meshes3d.drawMesh(vertices, faces, 'FaceAlpha', .3);
hold on; axis equal;
axis([5 35 10 30]);
matGeom.geom2d.drawPoint(vertices);
title('Original mesh');


%% Subdivide into 2 faces

n = 2;

% draw the mesh into a new figure
figure(2); clf;
matGeom.meshes3d.drawMesh(vertices, faces, 'FaceAlpha', .3);
hold on; axis equal;
axis([5 35 10 30]);

[v2 f2] = matGeom.meshes3d.subdivideMesh(vertices, faces, n);
matGeom.meshes3d.drawMesh(v2, f2, 'lineWidth', 1);
matGeom.geom2d.drawPoint(v2, '+');
title('Subdivide (2)');


%% Subdivide into 3 faces

n = 3;

% draw the mesh into a new figure
figure(3); clf;
matGeom.meshes3d.drawMesh(vertices, faces, 'FaceAlpha', .3);
hold on; axis equal;
axis([5 35 10 30]);

[v2 f2] = matGeom.meshes3d.subdivideMesh(vertices, faces, n);
matGeom.meshes3d.drawMesh(v2, f2, 'lineWidth', 1);
matGeom.geom2d.drawPoint(v2, '+');
title('Subdivide (3)');


%% Subdivide into 4 faces

n = 4;

% draw the mesh into a new figure
figure(4); clf;
matGeom.meshes3d.drawMesh(vertices, faces, 'FaceAlpha', .3);
hold on; axis equal;
axis([5 35 10 30]);

[v2 f2] = matGeom.meshes3d.subdivideMesh(vertices, faces, n);
matGeom.meshes3d.drawMesh(v2, f2, 'lineWidth', 1);
matGeom.geom2d.drawPoint(v2, '+');
title('Subdivide (4)');

