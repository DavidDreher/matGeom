%DEMOCONCATENATE Demonstration script for function concatenateMeshes
%
%   output = demoConatenateMeshes(input)
%
%   Example
%   demoConatenateMeshes
%
%   See also
%
% ------
% Author: oqilipo
% Created: 2017-09-17,    using Matlab 9.1.0.441655 (R2016b)
% Copyright 2017

%% Quad mesh
figure; view(3); axis equal
[v1, f1] = matGeom.meshes3d.boxToMesh([-1 0 -1 0 -1 0]);
vfHandle(1) = matGeom.meshes3d.drawMesh(v1, f1,'FaceColor','r','FaceAlpha',.5);
[v2, f2] = matGeom.meshes3d.boxToMesh([1 0 1 0 -1 0]);
vfHandle(2) = matGeom.meshes3d.drawMesh(v2, f2,'FaceColor','b','FaceAlpha',.5); pause(1)
mesh = matGeom.meshes3d.concatenateMeshes(v1, f1, v2, f2);
matGeom.meshes3d.drawMesh(mesh,'FaceColor','g','FaceAlpha', 1); pause(1)
delete(vfHandle); pause(1)

%% Triangle mesh
mesh(1).faces = matGeom.meshes3d.triangulateFaces(mesh(1).faces);
[mesh(2).vertices, f] = matGeom.meshes3d.createSoccerBall; mesh(2).faces = matGeom.meshes3d.triangulateFaces(f);
meshHandle = matGeom.meshes3d.drawMesh(mesh(2),'FaceColor','m','FaceAlpha',.5); pause(1)
mesh = matGeom.meshes3d.concatenateMeshes(mesh);
matGeom.meshes3d.drawMesh(mesh,'FaceColor','c','FaceAlpha', 1); pause(1)
delete(meshHandle)
