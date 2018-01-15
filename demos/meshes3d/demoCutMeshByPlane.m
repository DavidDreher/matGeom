%DEMOCUTMESHBYPLANE cut a soccerball by a plane
%
%   output = demoCutMeshByPlane(input)
%
%   Example
%   demoCutMeshByPlane
%
%   See also
%
 
% ------
% Author: David Legland
% e-mail: david.legland@inra.fr
% Created: 2017-07-11,    using Matlab 9.1.0.441655 (R2016b)
% Copyright 2017 INRA - Cepia Software Platform.


%% Initialisations

[v, f] = matGeom.meshes3d.createSoccerBall;
f = matGeom.meshes3d.triangulateFaces(f);
mesh.vertices=v; mesh.faces=f;
planeOrigin = [-0.2 0 0];
planeNormal = [-1 0 -1];
plane = matGeom.geom3d.createPlane(planeOrigin, planeNormal);


%%
[above, inside, below] = matGeom.meshes3d.cutMeshByPlane(mesh, plane);

figure('color','w'); axis equal; hold on; view(3)
matGeom.meshes3d.drawMesh(above, 'FaceColor', 'r');
matGeom.meshes3d.drawMesh(inside, 'FaceColor', 'g');
matGeom.meshes3d.drawMesh(below, 'FaceColor', 'b');

matGeom.geom3d.drawPlane3d(plane, 'FaceAlpha',.7)
matGeom.geom3d.drawVector3d(planeOrigin, planeNormal)

%%
[aV, aF, iV, iF, bV, bF] = matGeom.meshes3d.cutMeshByPlane(mesh.vertices, mesh.faces, plane);

figure('color','w'); axis equal; hold on; view(3)
matGeom.meshes3d.drawMesh(aV, aF, 'FaceColor', 'r');
matGeom.meshes3d.drawMesh(iV, iF, 'FaceColor', 'g');
matGeom.meshes3d.drawMesh(bV, bF, 'FaceColor', 'b');

matGeom.geom3d.drawPlane3d(plane, 'FaceAlpha',.7)
matGeom.geom3d.drawVector3d(planeOrigin, planeNormal)

%%
[aV, aF] = matGeom.meshes3d.cutMeshByPlane(mesh.vertices, mesh.faces, plane);

figure('color','w'); axis equal; hold on; view(3)
matGeom.meshes3d.drawMesh(aV, aF, 'FaceColor', 'r');
% drawMesh(iV, iF, 'FaceColor', 'g');
% drawMesh(bV, bF, 'FaceColor', 'b');

matGeom.geom3d.drawPlane3d(plane, 'FaceAlpha',.7)
matGeom.geom3d.drawVector3d(planeOrigin, planeNormal)

%%
[iV, iF] = matGeom.meshes3d.cutMeshByPlane(mesh.vertices, mesh.faces, plane,'part','in');

figure('color','w'); axis equal; hold on; view(3)
% drawMesh(aV, aF, 'FaceColor', 'r');
matGeom.meshes3d.drawMesh(iV, iF, 'FaceColor', 'g');
% drawMesh(bV, bF, 'FaceColor', 'b');

matGeom.geom3d.drawPlane3d(plane, 'FaceAlpha',.7)
matGeom.geom3d.drawVector3d(planeOrigin, planeNormal)

%%
[bV, bF] = matGeom.meshes3d.cutMeshByPlane(mesh.vertices, mesh.faces, plane,'part','below');

figure('color','w'); axis equal; hold on; view(3)
% drawMesh(aV, aF, 'FaceColor', 'r');
% drawMesh(iV, iF, 'FaceColor', 'g');
matGeom.meshes3d.drawMesh(bV, bF, 'FaceColor', 'b');

matGeom.geom3d.drawPlane3d(plane, 'FaceAlpha',.7)
matGeom.geom3d.drawVector3d(planeOrigin, planeNormal)

%%
above = matGeom.meshes3d.cutMeshByPlane(mesh, plane);

figure('color','w'); axis equal; hold on; view(3)
matGeom.meshes3d.drawMesh(above, 'FaceColor', 'r');
% drawMesh(iV, iF, 'FaceColor', 'g');
% drawMesh(bV, bF, 'FaceColor', 'b');

matGeom.geom3d.drawPlane3d(plane, 'FaceAlpha',.7)
matGeom.geom3d.drawVector3d(planeOrigin, planeNormal)

%%
inside = matGeom.meshes3d.cutMeshByPlane(mesh, plane,'part','in');

figure('color','w'); axis equal; hold on; view(3)
% drawMesh(aV, aF, 'FaceColor', 'r');
matGeom.meshes3d.drawMesh(inside, 'FaceColor', 'g');
% drawMesh(bV, bF, 'FaceColor', 'b');

matGeom.geom3d.drawPlane3d(plane, 'FaceAlpha',.7)
matGeom.geom3d.drawVector3d(planeOrigin, planeNormal)

%%
below = matGeom.meshes3d.cutMeshByPlane(mesh, plane,'part','below');

figure('color','w'); axis equal; hold on; view(3)
% drawMesh(aV, aF, 'FaceColor', 'r');
% drawMesh(iV, iF, 'FaceColor', 'g');
matGeom.meshes3d.drawMesh(below, 'FaceColor', 'b');

matGeom.geom3d.drawPlane3d(plane, 'FaceAlpha',.7)
matGeom.geom3d.drawVector3d(planeOrigin, planeNormal)
