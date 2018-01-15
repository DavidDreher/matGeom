%DEMOREMOVEMESHVERTICES Demonstration script for function removeMeshVertices
%
%   output = demoRemoveMeshVertices(input)
%
%   Example
%   demoRemoveMeshVertices
%
%   See also
%
% ------
% Author: oqilipo
% Created: 2017-09-17,    using Matlab 9.1.0.441655 (R2016b)
% Copyright 2017


%% in & out: faces / vertices 
figure('color','w'); view(3);
[v, f] = matGeom.meshes3d.createSoccerBall; 
plane = matGeom.geom3d.createPlane([.6 0 0], [1 0 -1]);
indAbove = find(~matGeom.geom3d.isBelowPlane(v, plane));
[v2, f2] = matGeom.meshes3d.removeMeshVertices(v, f, indAbove);
matGeom.meshes3d.drawMesh(v2, f2); matGeom.geom3d.drawPlane3d(plane); axis equal;

%% in: faces / vertices | out: vertices-faces-struct
figure('color','w'); view(3); 
[v, f] = matGeom.meshes3d.createSoccerBall; 
plane = matGeom.geom3d.createPlane([.6 0 0], [1 0 0]);
indAbove = find(~matGeom.geom3d.isBelowPlane(v, plane));
mesh2 = matGeom.meshes3d.removeMeshVertices(v, f, indAbove);
matGeom.meshes3d.drawMesh(mesh2); matGeom.geom3d.drawPlane3d(plane); axis equal;

%% in & out: vertices-faces-struct
figure('color','w'); view(3);
mesh = matGeom.meshes3d.createSoccerBall; 
plane = matGeom.geom3d.createPlane([-.6 0 0], [1 1 0]);
indAbove = find(~matGeom.geom3d.isBelowPlane(v, plane));
mesh2 = matGeom.meshes3d.removeMeshVertices(mesh, indAbove);
matGeom.meshes3d.drawMesh(mesh2); matGeom.geom3d.drawPlane3d(plane); axis equal;
