close all;clear;clc

%Load the Network file
load net1
 
%Load Testing Data
inputs = importInput('inputTest.xlsx'); 
inputs = inputs.data';
targets = importOutput('outputTest.xlsx'); 
targets = targets.data';

% Test the Network
outputs = net(inputs);
errors = gsubtract(targets,outputs);
performance = perform(net,targets,outputs)
 
 
% View the Network
%view(net)
 
% Plots
% Uncomment these lines to enable various plots.
figure, plotperform(tr)
figure, plottrainstate(tr)
figure, plotconfusion(targets,outputs)
figure, plotroc(targets,outputs)
figure, ploterrhist(errors)
