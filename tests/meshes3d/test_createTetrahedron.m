function test_suite = test_createTetrahedron
%TESTCREATETetrahedron  One-line description here, please.
%
%   output = testCreateTetrahedron(input)
%
%   Example
%   testCreateTetrahedron
%
%   See also
%
%
% ------
% Author: David Legland
% e-mail: david.legland@grignon.inra.fr
% Created: 2010-12-07,    using Matlab 7.9.0.529 (R2009b)
% Copyright 2010 INRA - Cepia Software Platform.

test_suite = functiontests(localfunctions);

function testCreation(testCase) %#ok<*DEFNU>

matGeom.meshes3d.createTetrahedron();


function testVEFCreation(testCase)

[v, e, f] = matGeom.meshes3d.createTetrahedron();
testCase.assertTrue(~isempty(v));
testCase.assertTrue(~isempty(e));
testCase.assertTrue(~isempty(f));

[nv, ne, nf] = getMeshElementsNumber;
testCase.assertEqual([nv 3], size(v));
testCase.assertEqual([ne 2], size(e));
testCase.assertEqual(nf, length(f));


function testVFCreation(testCase)

[v, f] = matGeom.meshes3d.createTetrahedron();
testCase.assertTrue(~isempty(v));
testCase.assertTrue(~isempty(f));

[nv, ne, nf] = getMeshElementsNumber; %#ok<ASGLU>
testCase.assertEqual([nv 3], size(v));
testCase.assertEqual(nf, length(f));


function testMeshCreation(testCase)

mesh = matGeom.meshes3d.createTetrahedron();
testCase.assertTrue(isstruct(mesh));
testCase.assertTrue(isfield(mesh, 'vertices'));
testCase.assertTrue(isfield(mesh, 'edges'));
testCase.assertTrue(isfield(mesh, 'faces'));

[nv, ne, nf] = getMeshElementsNumber;
testCase.assertEqual([nv 3], size(mesh.vertices));
testCase.assertEqual([ne 2], size(mesh.edges));
testCase.assertEqual(nf, length(mesh.faces));


function testFacesOutwards(testCase)

[v, e, f] = matGeom.meshes3d.createTetrahedron(); %#ok<ASGLU>

centro = matGeom.geom2d.centroid(v);
fc  = matGeom.meshes3d.meshFaceCentroids(v, f);
fc2 = matGeom.geom2d.createVector(centro, fc);
n   = matGeom.meshes3d.meshFaceNormals(v, f);

testCase.assertEqual(size(n), size(fc2));

dp = dot(fc2, n, 2);

testCase.assertTrue(sum(dp <= 0) == 0);


function [nv, ne, nf] = getMeshElementsNumber

nv = 4;
ne = 6;
nf = 4;
