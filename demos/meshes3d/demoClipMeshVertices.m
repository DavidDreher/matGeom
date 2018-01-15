%DEMOCLIPMESHVERTICES clip a soccerball by different shapes 
%
%   Example
%   demoClipMeshVertices
%
%   See also
%
% ------
% Author: oqilipo
% Created: 2017-08-28, using R2016b
% Copyright 2017


%% clip by a box and return the inside
[mesh.vertices, mesh.faces] = matGeom.meshes3d.createSoccerBall;
box = [0 2 -1 2 -.5 2];
[v2, f2] = matGeom.meshes3d.clipMeshVertices(mesh, box);
figure('color','w'); view(3); axis equal
matGeom.meshes3d.drawMesh(mesh, 'faceColor', 'none', 'faceAlpha', .2);
matGeom.geom3d.drawBox3d(box)
matGeom.meshes3d.drawMesh(v2, f2, 'faceAlpha', .7);

%% clip by a box and return the outside
[v, f] = matGeom.meshes3d.createSoccerBall;
f = matGeom.meshes3d.triangulateFaces(f);
box = [0 2 -1 2 -.5 2];
[v2, f2] = matGeom.meshes3d.clipMeshVertices(v, f, box, 'inside', false);
figure('color','w'); view(3); axis equal
matGeom.meshes3d.drawMesh(v, f, 'faceColor', 'none', 'faceAlpha', .2);
matGeom.geom3d.drawBox3d(box)
matGeom.meshes3d.drawMesh(v2, f2, 'faceAlpha', .7);

%% clip by a sphere and return the inside 
[v, f] = matGeom.meshes3d.createSoccerBall;
f = matGeom.meshes3d.triangulateFaces(f);
sphere = [0.9 -0.7 0 1.1];
mesh2 = matGeom.meshes3d.clipMeshVertices(v, f, sphere, 'shape', 'sphere');
figure('color','w'); view(3); axis equal
matGeom.meshes3d.drawMesh(v, f, 'faceColor', 'none', 'faceAlpha', .2);
matGeom.geom3d.drawSphere(sphere,'faceColor', 'none','linestyle','-','edgecolor','b')
matGeom.meshes3d.drawMesh(mesh2, 'faceAlpha', .7);

%% clip by a sphere and return the outside
[mesh.vertices, mesh.faces] = matGeom.meshes3d.createSoccerBall;
sphere = [0.9 -0.7 0 1.1];
[v2, f2] = matGeom.meshes3d.clipMeshVertices(mesh, sphere, 'shape', 'sphere', 'inside', false);
figure('color','w'); view(3); axis equal
matGeom.meshes3d.drawMesh(mesh, 'faceColor', 'none', 'faceAlpha', .2);
matGeom.geom3d.drawSphere(sphere,'faceColor', 'none','linestyle','-','edgecolor','b')
matGeom.meshes3d.drawMesh(v2, f2, 'faceAlpha', .7);
