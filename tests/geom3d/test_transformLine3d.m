function test_suite = test_transformLine3d
%Check transformation of 3Dlines
%   output = testTransformLine3d(input)
%
%   Example
%   testTransformLine3d
%
%   See also
%
%
% ------
% Author: David Legland
% e-mail: david.legland@grignon.inra.fr
% Created: 2009-06-19,    using Matlab 7.7.0.471 (R2008b)
% Copyright 2009 INRA - Cepia Software Platform.

test_suite = functiontests(localfunctions); 

function testTranslation(testCase) %#ok<*DEFNU>
p0 = [1 2 3];
v0 = [4 5 6];
line = [p0 v0];

shift   = [7 8 9];
trans   = matGeom.geom3d.createTranslation3d(shift);

linet   = matGeom.geom3d.transformLine3d(line, trans);
ctrl    = [p0+shift v0];
testCase.assertEqual(ctrl, linet, 'AbsTol', .01);


function testRotationOx(testCase)
p1 = [1 2 3];
p2 = [4 5 6];
line = matGeom.geom3d.createLine3d(p1, p2);

trans   = matGeom.geom3d.createRotationOx([2 3 1], pi/3);

linet   = matGeom.geom3d.transformLine3d(line, trans);

p1t     = matGeom.geom3d.transformPoint3d(p1, trans);
p2t     = matGeom.geom3d.transformPoint3d(p2, trans);
ctrl    = matGeom.geom3d.createLine3d(p1t, p2t);

testCase.assertEqual(ctrl, linet, 'AbsTol', .01);

