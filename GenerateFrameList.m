function frameNumbers = GenerateFrameList(firstFrame, stepSize, numFrames)
% GenerateFrameList creates an array which contains a list of frame numbers
% It is particularly useful for determining which frames to extract from a
% movie file
%
% Inputs: firstFrame = a starting frame number
%         stepSize = the step size between each frame number
%         numFrames = the number of frames to be generated
% Output: frameNumbers = a 1xn array containing the desired number of
%         frames (numFrames). The starting number is the value of
%         firstFrame, and subsequent values are greater than the previous
%         one by the value of stepSize.
%
% Author: Stephen Parinas

% Calculate the last frame number by adding the first frame number to the
% step size multiplied by the number of frames - 1.
lastFrame = firstFrame + stepSize * (numFrames - 1);

% Create an array of frame numbers using the linspace function, with the
% format being the value of the first frame, then the last frame, then the
% number of frames in the array. The values in the array will be evenly
% spaced by the value of stepSize.
frameNumbers = linspace(firstFrame, lastFrame, numFrames);

end