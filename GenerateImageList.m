function [imageNames] = GenerateImageList(directory,fileType)
% GenerateImageList returns a list of the names all the images with a
% particular file extension, contained in a specified folder/directory.
%
% Inputs: directory = a string containing the name of the directory that
%         the images are contained in.
%         fileType = a string containing the file extension of the images
%         to fetch.
% Output: imageNames = a 1xn cell array containing n strings where each
%         element is the filename of an image from the specified directory
%         that has a particular file extension.
%
% Author: Stephen Parinas

% The dir function lists all the files in a specified folder/directory.
files = dir(directory);

% A structured array is generated, where values are placed in sub-arrays
% called fields.  The individual fields can be referred to with the command
% structure_name.field_name. If accessing data from an individual index use
% structure_name(i).field_name

% Create an empty cell array for storing all the images with the given file 
% extension.
imageNames = {};

% Run through the list of files using a for loop. The length of the
% structured array determines the number of times the loop is run.
for i = 1:length(files)
    
    % To search for the file extension (substring) within the file name
    % (string), use the strfind function. If the file name contains the
    % extension, the condition is met and the name is added to the
    % imageNames cell array.
    
    % Create an array of strings for the conditional if statement, so that
    % it only picks up files with .fileType in its name, rather than just
    % fileType (which could also be a part of the filename and not just the
    % extension).
    if strfind(files(i).name,['.',fileType])
        imageNames = [imageNames, files(i).name];
    end
end

% The sources I used to write this function are the ENGGEN 131 coursebook
% and the following pages on MATLAB's documentation: cell (cell arrays),
% struct (structured arrays), dir (list folder contents), and how to access
% data in a structured array.

end