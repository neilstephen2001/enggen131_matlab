function images = ReadImages(directory,imageNames)
% ReadImages takes a specified list of images (filenames are given) from a
% directory and reads them. The images are converted to 3D uint8 arrays
% known as RGB images.
%
% Inputs: directory = a string containing the name of the directory that
%         the images are contained in
%         imageNames = a 1xn cell array containing n strings where each
%         element is a filename of an image to be read. It is generated
%         from the GenerateImageList function.
% Output: images = a 1xn cell array containing n images, where each element
%         is an RGB image. The order of the images correspond to the order
%         of the list of filenames.
%
% Author: Stephen Parinas

% Create an empty cell array that the RGB images are to be stored in.
% The cell function generates a cell array with the given size.
images = cell(1,length(imageNames));

% Run through the list of filenames using a for loop
for i = 1:length(imageNames)
    
    % The location of the image is entered into an array, with the
    % directory of the folder that the image is in, then a /, then the
    % filename. The imread function will then search this location for the
    % image, converting it from a graphics file into a 3D array known as an
    % RGB image.
    images{i} = imread([directory, '/', imageNames{i}]);
end

% The sources I used to write this function are the ENGGEN 131 coursebook
% and the following pages on MATLAB's documentation: cell (cell arrays) and
% imread (reading images from a graphics file).

end