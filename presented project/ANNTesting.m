close all;clear;clc
 
%Load the Network file
load net
 
%Load Testing Data
inputs = importInput('inputTest.xlsx'); 
inputs = inputs.data';
targets = importOutput('outputTest.xlsx'); 
targets = targets.data';
 
% Test the Network
outputs = net(inputs);
errors = gsubtract(targets,outputs);
performance = perform(net,targets,outputs);
 
% % Recalculate Training, Validation and Test Performance
% trainTargets = targets .* tr.trainMask{1};
% valTargets = targets  .* tr.valMask{1};
% testTargets = targets  .* tr.testMask{1};
% trainPerformance = perform(net,trainTargets,outputs)
% valPerformance = perform(net,valTargets,outputs)
% testPerformance = perform(net,testTargets,outputs)
 
% Plots
% Uncomment these lines to enable various plots.
figure, plottrainstate(tr)
figure, plotperform(tr)
figure, plotconfusion(targets,outputs)
figure, ploterrhist(errors)
