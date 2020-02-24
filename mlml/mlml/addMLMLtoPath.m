function addMLMLtoPath

% Get the current course folder
rootDir = fileparts(mfilename('fullpath'));

% Populate list of folders to add to path
path2add = {};
path2add{end+1} = rootDir;
path2add{end+1} = fullfile(rootDir,'ch2');
path2add{end+1} = fullfile(rootDir,'ch3');
path2add{end+1} = fullfile(rootDir,'ch4');
path2add{end+1} = fullfile(rootDir,'ch5');
path2add{end+1} = fullfile(rootDir,'ch6');
path2add{end+1} = fullfile(rootDir,'ch7');
path2add{end+1} = fullfile(rootDir,'exercises');

% Add folders to the path
addpath(path2add{:},'-end');
