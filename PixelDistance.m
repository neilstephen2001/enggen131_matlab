function [distanceSquared] = PixelDistance(pointOne,pointTwo)
% PixelDistance calculates the square of the distance between two points in
% 3D colour space.
%
% Inputs: pointOne = an array containing three elements representing a 
%         point in 3D colour space
%         pointTwo = an array containing three elements representing a
%         second point in 3D colour space
% Output: distanceSquared = the square of the distance between the two
%         points in 3D colour space
%
% Author: Stephen Parinas

% The input points can be in the form of uint8 values, which have to be
% converted to doubles as uint8 can't handle values larger than 255, and
% the outputs of this function could be much larger than 255.
pointOne = double(pointOne);
pointTwo = double(pointTwo);

% The formula for the squared distance between the two points is:
% distance^2 = (P1-Q1)^2 + (P2-Q2)^2 + (P3-Q3)^2. 1,2, and 3 represent the 
% colours red, green and blue respectively. Dot operator is used so that 
% element-by-element multiplication is carried out rather than matrix 
% multiplication. 
distanceSquared = (pointOne(1) - pointTwo(1)).^2 + ...
    (pointOne(2) - pointTwo(2)).^2 + (pointOne(3) - pointTwo(3)).^2;

end