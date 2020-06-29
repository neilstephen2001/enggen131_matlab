function [redDistant, greenDistant, blueDistant] = MostDistantPixel(pixels)
% MostDistantPixel calculates the pixel from a list that is most distant
% from the median RGB values of that list (calculated in the MedianPixel
% function.) The distance metric used is the square of the distance between
% points in RGB colour space.
%
% Input: pixels = A 1xnx3 array of RGB values representing a list of pixels
% Outputs: redDistant = the red value of the most distant pixel
%          greenDdistant = the green value of the most distant pixel
%          blueDistant = the blue value of the most distant pixel
%
% Author: Stephen Parinas

% Determine number of columns of pixels array using the size function
% The variables for rows and layers are set to ~ as they are not referred
% to in the rest of the function.
[~, cols, ~] = size(pixels);

% The first point in the distance calculation is the pixel in each column.
% Must convert from uint8 to doubles before doing the distance calculation
% as the maximum uint8 value is 255, and the outputs could end up being
% much higher than this.
pixels = double(pixels);

% The median RGB values will serve as the second point in the distance
% calculation. Use the median function to calculate the median of the
% pixels in each layer. The 2 after the name of the array indicates that
% the median is to be calculated from the values in the 2nd dimension.
medianPixel = median(pixels,2);

% Create a vector, i, that contains all the numbers between 1 and the
% number of columns in the pixels array, with a step size of 1.
i = 1:cols;

% Create an empty array for the distances using the zeros function, as the
% size is known. Preallocating reduces execution time as no memory has to
% be allocated for resizing the array, each time the distance calculation
% is done for each image.
distances = zeros(1,cols);

% Calculate the squared distance between each image (i) and the median RGB
% values. The formula for the squared distance between the two points is:
% distance^2 = (P1-Q1)^2 + (P2-Q2)^2 + (P3-Q3)^2. 1,2, and 3 represent the
% colours red, green and blue.Dot operator is used so that element-by-
% element multiplication is carried out rather than matrix multiplication.
distances(:,i) = (pixels(:,i,1) - medianPixel(:,:,1)).^2 + ...
    (pixels(:,i,2) - medianPixel(:,:,2)).^2 + ...
    (pixels(:,i,3) - medianPixel(:,:,3)).^2;

% Find the index (column number) of the pixel furthest from the median RGB
% values using the max function. The actual value of the maximum distance
% is not needed in this function, so it is replaced by a ~ so as to not
% have to be calculated, this saves memory and hence increases efficiency. 
% In the case of multiple images with the same distance from the median RGB 
% values, the first most distant pixel is taken.
[~,index] = max(distances);

% Set the RGB values for the pixel in the indexed column as the output
% variables for this function.
redDistant = pixels(:,index,1);
greenDistant = pixels(:,index,2);
blueDistant = pixels(:,index,3);

% While I could have called the MedianPixel and/or PixelDistance functions
% in this function, it would just be more efficient to copy the code onto
% here, and slightly alter it to fit this specific function, as calling the
% aforementioned functions may end in the code not working properly.

% The sources I used to write this function are the ENGGEN 131 coursebook
% the following pages on MATLAB's documentation: vectorisation , median,
% and max (maximum).

end