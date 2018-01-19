%% ROS Initialization
%

% Location of the ROS Master
URI='http://192.168.1.11:11311'
% Local IP Address
nodehost='192.168.131.174'
% Specify node name
nodename='matlab_kingfisher'

% Initialize
rosinit(URI,'NodeHost',nodehost,'NodeName',nodename)