%[text] # Two-photon microscopy data analysis
%[text] This notebook is designed to analyze data obtained from two-photon microscopy, specifically for the Cold Spring Harbor Laboratory (CSHL) Drosophila Neurobiology course.
%[text] The analysis will focus on various aspects of the collected data, including visualizing the volumes, registering the volumes, image processing, quantification of neuronal activity, and visualization of results.
%[text] The goal is to provide a short introduction to analyzing datasets obtained from two-photon microscopy. 
%[text:tableOfContents]{"heading":"**Table of Contents**"}
%[text] ## Setup libraries and folder locations
%[text] Here I load the required libraries, setup the data folders, etc. 
% Set folder names
curr_folder = pwd;
repo_folder = fullfile(curr_folder, '..');
data_folder = fullfile(repo_folder, 'data');

% Dataset name
dataset_name = '20240706a_00004_00001.tif' %[output:67b3bd5e]

% Load external libraries (that in in toolbox)
addpath(genpath(fullfile(pwd, 'toolbox/')));
%[text] 
%[text] ## Loading and visualization datasets
%[text] In this section, we will load the dataset and visualize the volume as well as the linked metadata acquired during imaging. We will be using the scanimage library to load the tiff.
%[text] The below guide assumes that the two-photon microscope you are using saves the data as TIFF files (generally true as this is the default format).
%[text] ### Load dataset
% Import Tiff Reader
import ScanImageTiffReader.ScanImageTiffReader;

% Setup reader to load dataset
reader = ScanImageTiffReader(fullfile(data_folder, dataset_name));

% Load dataset
volumes = reader.data(); % Load the volumes from the TIFF dataset
metadata = reader.metadata(); % Load metadata

%[text] 
%[text] 

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[output:67b3bd5e]
%   data: {"dataType":"textualVariable","outputData":{"name":"dataset_name","value":"'20240706a_00004_00001.tif'"}}
%---
