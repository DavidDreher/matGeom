function test_suite = test_intersectEdgePlane
%TESTINTERSECTEDGEPLANE  One-line description here, please.
%
%   output = testIntersectEdgePlane(input)
%
%   Example
%   testIntersectEdgePlane
%
%   See also
%
%
% ------
% Author: David Legland
% e-mail: david.legland@grignon.inra.fr
% Created: 2011-06-17,    using Matlab 7.9.0.529 (R2009b)
% Copyright 2011 INRA - Cepia Software Platform.

test_suite = functiontests(localfunctions); 

function testOx(testCase) %#ok<*DEFNU>
% edge in direction (1,0,0), plane orthogonal

edge = [10 10 10 10+20 10 10];
plane = matGeom.geom3d.createPlane([20 0 0], [20 50 20], [20 0 40]);

exp = [20 10 10];
inter = matGeom.geom3d.intersectEdgePlane(edge, plane);

testCase.assertEqual(exp, inter);


function testOxParallel(testCase)
% edge in direction (1,0,0), plane orthogonal

edge = [10 10 10 10+50 10 10];
plane = matGeom.geom3d.createPlane([0 0 0], [0 20 0], [0 0 20]);

exp = [NaN NaN NaN];
inter = matGeom.geom3d.intersectEdgePlane(edge, plane);

testCase.assertEqual(exp, inter);


function testOxPass(testCase)
% edge in direction (1,0,0), plane orthogonal

edge = [10+20 10 10 10+50 10 10];
plane = matGeom.geom3d.createPlane([20 0 0], [20 50 20], [20 0 40]);

exp = [NaN NaN NaN];
inter = matGeom.geom3d.intersectEdgePlane(edge, plane);

testCase.assertEqual(exp, inter);


function testOy(testCase)
% edge in direction (0,1,0), plane orthogonal

edge = [10 10 10 10 10+20 10];
plane = matGeom.geom3d.createPlane([0 20 0], [50 20 20], [0 20 40]);

exp = [10 20 10];
inter = matGeom.geom3d.intersectEdgePlane(edge, plane);

testCase.assertEqual(exp, inter);


function testOz(testCase)
% edge in direction (0,0,1), plane orthogonal

edge = [10 10 10 10 10 10+20];
plane = matGeom.geom3d.createPlane([0 0 20], [50 20 20], [0 40 20]);

exp = [10 10 20];
inter = matGeom.geom3d.intersectEdgePlane(edge, plane);

testCase.assertEqual(exp, inter);


function testSingleArray(testCase)

edge = [10 10 10 10+20 10 10];
plane = matGeom.geom3d.createPlane([20 0 0], [20 50 20], [20 0 40]);

exp = repmat([20 10 10], 3, 1);
inter = matGeom.geom3d.intersectEdgePlane(edge, repmat(plane, 3, 1));

testCase.assertEqual(exp, inter);


function testArraySingle(testCase)

edge = [10 10 10 10+20 10 10];
plane = matGeom.geom3d.createPlane([20 0 0], [20 50 20], [20 0 40]);

exp = repmat([20 10 10], 3, 1);
inter = matGeom.geom3d.intersectEdgePlane(repmat(edge, 3, 1), plane);

testCase.assertEqual(exp, inter);


function testArrayArray(testCase)

edge = [10 10 10 10+20 10 10];
plane = matGeom.geom3d.createPlane([20 0 0], [20 50 20], [20 0 40]);

exp = repmat([20 10 10], 3, 1);
inter = matGeom.geom3d.intersectEdgePlane(repmat(edge, 3, 1), repmat(plane, 3, 1));

testCase.assertEqual(exp, inter);
