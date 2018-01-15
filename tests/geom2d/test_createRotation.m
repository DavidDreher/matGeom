function test_suite = test_createRotation 
%TESTCREATEROTATION  One-line description here, please.
%   output = testCreateRotation(input)
%
%   Example
%   testCreateRotation
%
%   See also
%
%
% ------
% Author: David Legland
% e-mail: david.legland@grignon.inra.fr
% Created: 2009-04-22,    using Matlab 7.7.0.471 (R2008b)
% Copyright 2009 INRA - Cepia Software Platform.
% Licensed under the terms of the LGPL, see the file "license.txt"

test_suite = functiontests(localfunctions);

function testCreateCentered(testCase) %#ok<*DEFNU>

trans = matGeom.geom2d.createRotation(0);
testCase.assertEqual(trans, [1 0 0;0 1 0;0 0 1], 'AbsTol', .01);

trans = matGeom.geom2d.createRotation(pi/2);
testCase.assertEqual(trans, [0 -1 0; 1 0 0; 0 0 1], 'AbsTol', .01);

trans = matGeom.geom2d.createRotation(pi);
testCase.assertEqual(trans, [-1 0 0;0 -1 0;0 0 1], 'AbsTol', .01);

trans = matGeom.geom2d.createRotation(3*pi/2);
testCase.assertEqual(trans, [0 1 0; -1 0 0; 0 0 1], 'AbsTol', .01);

function testCreateShifted(testCase)

p0 = [3 5];
theta = pi/3;

trans1 = matGeom.geom2d.createRotation(p0, theta);
t1 = matGeom.geom2d.createTranslation(-p0);
rot = matGeom.geom2d.createRotation(theta);
t2 = matGeom.geom2d.createTranslation(p0);
trans2 = t2*rot*t1;

testCase.assertEqual(trans1, trans2, 'AbsTol', .01);
