function staticImage = RemoveAction(images)
% RemoveAction creates an image that has the action removed by applying a
% median filter, where each pixel in the image is obtained by taking the
% median RGB values of the stack of corresponding pixels taken from the
% source image.
%
% Input: images = a 1xn 1D cell array containing n images, where each
%        element is an RGB image stored as 3D arrays of uint8 values
%        ranging from 0 to 255.
% Output: staticImage = an RGB image that was obtained by taking the median
%         RGB values of the stack of corresponding pixels from the source
%         images.
%
% Author: Stephen Parinas

% Create a vector, i, that contains all the numbers between 1 and the
% number of images in the cell array, with a step size of 1.
i = 1:length(images);

% Using the cat function, concatenate each element of the cell array onto
% the 4th dimension. A new variable, imagesArray, is created for this.
imagesArray = cat(4,images{i});

% Find the median values of the pixels from the images in the cell array.
% The 4 after the name of the array indicates that the median is to be
% calculated from the values in the 4th dimension of imagesArray.
staticImage = median(imagesArray,4);

% While I could have called the MedianPixel function in this function, it
% would have just been much more efficient to directly call the median
% function, and the MedianPixel might not work properly with 4D arrays.

% The sources I used to write this function are the following pages on
% MATLAB's documentation: vectorisation, cat (concatenate arrays), and
% median, and this page on MATLAB Answers: https://au.mathworks.com/matlab
% central/answers/22741-how-to-create-a-4-dimensional-array.

end