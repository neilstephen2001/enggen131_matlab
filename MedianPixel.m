function [redMedian, greenMedian, blueMedian] = MedianPixel(pixels)
% MedianPixel calculates the median RGB values from a list of pixels
%
% Input: pixels = A 1xnx3 array of RGB values representing a list of pixels
% Outputs: redMedian = the median red value
%          greenMedian = the median green value
%          blueMedian = the median blue value
%
% Author: Stephen Parinas

% Use the median function to calculate the median of the pixels in each
% layer. The 2 after the name of the array indicates that the median is to
% be calculated from the values in the 2nd dimension (columns). The numbers
% 1,2,and 3 in the third dimension of pixels represent the colours red,
% green, and blue, respsectively.
redMedian = median(pixels(:,:,1), 2);
greenMedian = median(pixels(:,:,2), 2);
blueMedian = median(pixels(:,:,3), 2);

% The source I used to write this function is the median page on MATLAB's
% documentation.

end