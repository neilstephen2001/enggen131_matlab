function actionImage = ActionShot(images)
% ActionShot creates an action shot image by finding the pixels from a
% stack of images that are the most distant from the median RGB values of
% the corresponding pixels.
%
% Input: images = a 1xn 1D cell array containing n images, where each
%        element is an RGB image stored as 3D arrays of uin8 values ranging
%        from 0 to 255.
% Output: actionImage = an action shot in the form of an RGB image.
%
% Author: Stephen Parinas

% The first point in the distance calculation is the pixel of each image in
% the cell array.

% Create a vector, i, that contains all the numbers between 1 and the
% number of images in the cell array, with a step size of 1.
i = 1:length(images);

% Using the cat function, concatenate each element of the cell array onto
% the 4th dimension.
pointOne = cat(4,images{i});

% The second point in the distance calculation is the median RGB values of
% all the points in the 4D array pointOne. The 4 after the name of the
% array indicates that the median is to be calculated from the values in
% the 4th dimension of the pixels array.
pointTwo = median(pointOne,4);

% Must convert from uint8 to doubles before doing the distance calculation
% as the maximum uint8 value is 255, and the distances could end up being
% much higher than this. It was much faster to convert to doubles after
% creating pointOne and pointTwo, rather than converting at the same time
% as concatenating pointOne.
pointOne = double(pointOne);
pointTwo = double(pointTwo);

% Determine the number of rows and columns of the images using the size
% function. The number of layers/colours is replaced by a ~ for efficiency,
% as it is not referred to later in the function.
[rows,cols,~] = size(images{1});

% Create an empty array for the distances using the zeros function, as the
% size is known. Preallocating reduces execution time as no memory has to
% be allocated for resizing the array, each time the distance calculation
% is done for each image.
distances = zeros(rows,cols,length(images));

% Calculate the squared distance between each image (i) and the median RGB
% values. The formula for the squared distance between the two points is:
% distance^2 = (P1-Q1)^2 + (P2-Q2)^2 + (P3-Q3)^2. 1,2,and 3 represent the
% colours red, green and blue. Dot operator is used so that element-by-
% element multiplication is carried out rather than matrix multiplication.
distances(:,:,i) = (pointOne(:,:,1,i) - pointTwo(:,:,1)).^2 + ...
    (pointOne(:,:,2,i) - pointTwo(:,:,2)).^2 + ...
    (pointOne(:,:,3,i) - pointTwo(:,:,3)).^2;

% Find the maximum distance between the median RGB value and the list of
% images for each individual pixel. The max function is used, calculating
% the maximum in the 3rd dimension (image list) of the distances array. The
% actual value of the maximum distance is not needed in this function, so
% it is replaced by a ~ so as to not have to be calculated, this increases
% efficiency. In the case of multiple images with the same distance from
% the median RGB values, the first most distant pixel is taken.
[~,index] = max(distances,[],3);

% Run each image through the for loop. Create a logical array where, for
% each pixel, the image number indicated in the index variable for the
% corresponding pixel, would fit the condition (of i == index number), and
% is set a value of 1. All other image numbers are then set to 0.
for i = 1:length(images)
    logicalArray(:,:,:,i) = (i == index);
end

% Multiply the values of logicalArray by the concatenated 4D array pointOne
% so that every position in pointOne with 0 in logicalArray is also changed
% to 0, and every position with 1 in logicalArray keeps its RGB values.
% Take the image with the maximum RGB values for each pixel. This will be
% in the positions in logicalArray that are non-zero.
actionImage = max((logicalArray .* pointOne),[],4);

% Convert the actionImage array back to unsigned 8-bit integers (uint8) so
% that it can be displayed properly as a colour images.
actionImage = uint8(actionImage);

% While I could have called the MedianPixel, PixelDistance,
% MostDistantPixel, and/or RemoveAction functions in this function, it
% would just be more efficient to copy the code onto here, and slightly
% alter it to fit this specific function, as calling the aforementioned
% functions may end in the code not working properly.

% The sources I used to write this function are the ENGGEN 131 coursebook,
% the following pages on MATLAB's documentation: vectorisation, cat
% (concatenate arrays), max (maximum),and median, as well as these pages on
% MATLAB Answers: https://au.mathworks.com/matlabcentral/answers/360852-how
% -to-get-values-from-an-array-using-another-logical-array
% https://au.mathworks.com/matlabcentral/answers/22741-how-to-create-a-4-
% dimensional-array.

end