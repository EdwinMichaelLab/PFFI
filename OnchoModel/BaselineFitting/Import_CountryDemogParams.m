%% Import data from subSaharanCountries_demoA_demoB.csv
% Script for importing data from the following text file:
%
%    CountryDemogParams.csv
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

%% Initialize variables.
filename = 'CountryDemogParams.csv';
delimiter = ',';
startRow = 2;

%% Format string for each line of text:
%   column1: text (%s)
%	column2: double (%f)
%   column3: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'HeaderLines' ,startRow-1, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Allocate imported array to column variable names
Country_demo = dataArray{:, 1};
demoA = dataArray{:, 2};
demoB = dataArray{:, 3};

%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans;

