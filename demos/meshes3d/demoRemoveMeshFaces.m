%DEMOREMOVEMESHFACES Demonstration script for function removeMeshFaces
%
%   output = demoRemoveMeshFaces(input)
%
%   Example
%   demoRemoveMeshFaces
%
%   See also
%
 
% ------
% Author: David Legland
% e-mail: david.legland@inra.fr
% Created: 2017-07-11,    using Matlab 9.1.0.441655 (R2016b)
% Copyright 2017 INRA - Cepia Software Platform.

%% Initialisations

[vertices, faces] = matGeom.meshes3d.createSoccerBall;
m.vertices=vertices;
faces = matGeom.meshes3d.triangulateFaces(faces);
m.faces=faces;
fLI = false(length(faces),1);
rmFI=round(linspace(1,length(faces),10));
fLI(rmFI)=true;

faceCents = matGeom.meshes3d.faceCentroids(vertices, faces);

%% 
[vertices2, faces2] = matGeom.meshes3d.removeMeshFaces(vertices, faces, fLI);
assert(isequal(matGeom.meshes3d.faceCentroids(vertices, faces(~fLI,:)),matGeom.meshes3d.faceCentroids(vertices2, faces2)))

figure('color','w')
matGeom.meshes3d.drawMesh(vertices, faces, 'faceColor', 'none', 'faceAlpha', .2);
matGeom.meshes3d.drawMesh(vertices2, faces2, 'faceAlpha', .7);
text(faceCents(fLI,1),faceCents(fLI,2),faceCents(fLI,3),num2str(rmFI'))
view(3)
axis equal

%% 
[m2] = matGeom.meshes3d.removeMeshFaces(vertices, faces, fLI);
assert(isequal(matGeom.meshes3d.faceCentroids(vertices, faces(~fLI,:)),matGeom.meshes3d.faceCentroids(m2.vertices, m2.faces)))

figure('color','w')
matGeom.meshes3d.drawMesh(vertices, faces, 'faceColor', 'none', 'faceAlpha', .2);
matGeom.meshes3d.drawMesh(m2.vertices, m2.faces, 'faceAlpha', .7);
text(faceCents(fLI,1),faceCents(fLI,2),faceCents(fLI,3),num2str(rmFI'))
view(3)
axis equal

%%
[m2] = matGeom.meshes3d.removeMeshFaces(m, fLI);
assert(isequal(matGeom.meshes3d.faceCentroids(m.vertices, m.faces(~fLI,:)),matGeom.meshes3d.faceCentroids(m2.vertices, m2.faces)))

figure('color','w')
matGeom.meshes3d.drawMesh(vertices, faces, 'faceColor', 'none', 'faceAlpha', .2);
matGeom.meshes3d.drawMesh(m2.vertices, m2.faces, 'faceAlpha', .7);
text(faceCents(fLI,1),faceCents(fLI,2),faceCents(fLI,3),num2str(rmFI'))
view(3)
axis equal
