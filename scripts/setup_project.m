%% Setup Project Script
clear; clc;

% Get project root
root = fileparts(fileparts(mfilename('fullpath')));

% Add all folders to path
addpath(genpath(root));

% Load vehicle parameters
run(fullfile(root, "data", "params", "vehicle_params.m"));

disp("Project paths added.");
disp("Vehicle parameters loaded.");
disp("Ready to build top_model.slx");