%DEMOSPLITMESH Demonstration script for function splitMesh
%
%   output = demoSplitMesh(input)
%
%   Example
%   demoSplitMesh
%
%   See also
%
% ------
% Author: oqilipo
% Created: 2017-09-20,    using Matlab 9.1.0.441655 (R2016b)
% Copyright 2017

%% Quad mesh
[v1, f1] = matGeom.meshes3d.boxToMesh([1 0 -1 0 -1 0]); 
[v2, f2] = matGeom.meshes3d.boxToMesh([-1 0 1 0 -1 0]);
[vertices, faces] = matGeom.meshes3d.concatenateMeshes(v1, f1, v2, f2);
meshes = matGeom.meshes3d.splitMesh(vertices, faces, 'all');
figure('color','w'); view(3); axis equal
cmap=hsv(length(meshes));
for m=1:length(meshes)
    matGeom.meshes3d.drawMesh(meshes(m), cmap(m,:))
end

%% Triangle mesh
[v1, f1] = matGeom.meshes3d.boxToMesh([1 0 -1 0 -1 0]); 
[v2, f2] = matGeom.meshes3d.boxToMesh([-1 0 1 0 -1 0]);
[v3, f3] = matGeom.meshes3d.createSoccerBall;
f1 = matGeom.meshes3d.triangulateFaces(f1);
f2 = matGeom.meshes3d.triangulateFaces(f2);
f3 = matGeom.meshes3d.triangulateFaces(f3);
[mesh.vertices, mesh.faces] = matGeom.meshes3d.concatenateMeshes(v1, f1, v3, f3, v2, f2);
meshes = matGeom.meshes3d.splitMesh(mesh);
figure('color','w'); view(3); axis equal
cmap=hsv(length(meshes));
for m=1:length(meshes)
    matGeom.meshes3d.drawMesh(meshes(m), cmap(m,:))
end

%% Triangle mesh - component with most vertices
[v1, f1] = matGeom.meshes3d.boxToMesh([1 0 -1 0 -1 0]); 
[v2, f2] = matGeom.meshes3d.boxToMesh([-1 0 1 0 -1 0]);
[v3, f3] = matGeom.meshes3d.createSoccerBall;
f1 = matGeom.meshes3d.triangulateFaces(f1);
f2 = matGeom.meshes3d.triangulateFaces(f2);
f3 = matGeom.meshes3d.triangulateFaces(f3);
[mesh.vertices, mesh.faces] = matGeom.meshes3d.concatenateMeshes(v1, f1, v3, f3, v2, f2);
% Only return the component with the most vertices
meshes = matGeom.meshes3d.splitMesh(mesh, 'mostVertices');
figure('color','w'); view(3); axis equal
cmap=hsv(length(meshes));
for m=1:length(meshes)
    matGeom.meshes3d.drawMesh(meshes(m), cmap(m,:))
end
