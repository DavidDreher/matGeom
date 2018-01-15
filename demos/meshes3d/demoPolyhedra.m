function demoPolyhedra(varargin)
%DEMOPOLYHEDRA Draw main polyhedra defined in the matGeom toolbox
%
%   output = demoPolyhedra(input)
%
%   Example
%   demoPolyhedra
%
%   See also
%
%
% ------
% Author: David Legland
% e-mail: david.legland@grignon.inra.fr
% Created: 2010-12-07,    using Matlab 7.9.0.529 (R2009b)
% Copyright 2010 INRA - Cepia Software Platform.

%% Cube
figure(1); clf; 
[v f] = matGeom.meshes3d.createCube;
matGeom.meshes3d.drawMesh(v, f);
view(3); axis('vis3d'); axis off;
title('Cube');

%% Octahedron
figure(1); clf; 
[v f] = matGeom.meshes3d.createOctahedron;
matGeom.meshes3d.drawMesh(v, f);
view(3); axis('vis3d'); axis off;
title('Octahedron');

%% Cube-Octahedron
figure(1); clf; 
[v f] = matGeom.meshes3d.createCubeOctahedron;
matGeom.meshes3d.drawMesh(v, f);
view(3); axis('vis3d'); axis off;
title('Cube-Octahedron');

%% Icosahedron
figure(1); clf; 
[v f] = matGeom.meshes3d.createIcosahedron;
matGeom.meshes3d.drawMesh(v, f);
view(3); axis('vis3d'); axis off;
title('Icosahedron');

%% Dodecahedron
figure(1); clf; 
[v f] = matGeom.meshes3d.createDodecahedron;
matGeom.meshes3d.drawMesh(v, f);
view(3); axis('vis3d'); axis off;
title('Dodecahedron');

%% Soccer Ball, buckyall, C60...
figure(1); clf; 
[v f] = matGeom.meshes3d.createSoccerBall;
matGeom.meshes3d.drawMesh(v, f);
view(3); axis('vis3d'); axis off;
title('Soccer Ball');


%% Tetrahedron
figure(1); clf; 
[v f] = matGeom.meshes3d.createTetrahedron;
matGeom.meshes3d.drawMesh(v, f);
view(3); axis('vis3d'); axis off;
title('Tetrahedron');


%% Tetrakaidecahedron
figure(1); clf; 
[v f] = matGeom.meshes3d.createTetrakaidecahedron;
matGeom.meshes3d.drawMesh(v, f);
view(3); axis('vis3d'); axis off;
title('Tetrakaidecahedron');


%% Menger Sponge
figure(1); clf; 
[v e f] = matGeom.meshes3d.createMengerSponge;
matGeom.meshes3d.drawMesh(v, f);
view(3); axis('vis3d'); axis off;
title('Menger Sponge');




