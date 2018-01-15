%DEMOPARABOLACURVATURE  One-line description here, please.
%   output = demoParabolaCurvature(input)
%
%   Example
%   demoParabolaCurvature
%
%   See also
%

% ------
% Author: David Legland
% e-mail: david.legland@nantes.inra.fr
% Created: 2007-02-26
% Copyright 2007 INRA - BIA PV Nantes - MIAJ Jouy-en-Josas.


%% Parabola definition

% parameters of polynomial curve (here, a parabola)
c1 = [0 1];
c2 = [0 0 .5];

% parametrization for a parabola arc
t = linspace(-1, 3, 100)';

% approximation of the curve
curve = matGeom.polynomialCurves2d.polynomialCurvePoint(t, c1, c2);

% prepare plot
figure(1); clf;
hold on;

% draw curve
matGeom.polygons2d.drawPolyline(curve, 'linewidth', 2);

% format axis
axis equal;
axis([-2 3 0 5]);


%% Compute curvature for a specific position

% the position
pos = .5;

% point, derivative and  curvature at chosen point
point = matGeom.polynomialCurves2d.polynomialCurvePoint(pos, c1, c2);
deriv = matGeom.polynomialCurves2d.polynomialCurveDerivative(pos, c1, c2);
kappa = matGeom.polynomialCurves2d.polynomialCurveCurvature(pos, c1, c2);

% radius is the inverse of the curvature
radius = 1./kappa;

% tangent and normal lines
tangent = [point deriv];
normal = matGeom.geom2d.orthogonalLine(tangent, point);

% osculating circle
center = matGeom.geom2d.pointOnLine(normal, radius);
circle = [center radius];

% display tangent line, normal, and osculating circle
matGeom.geom2d.drawPoint(point, 'color', 'k');
matGeom.geom2d.drawLine(tangent, 'color', 'k');
matGeom.geom2d.drawLine(normal, 'color', 'k');
matGeom.geom2d.drawCircle(circle, 'color', 'k');
