%%  Extreme Learning Machine - Regression Demo
%
%	A simple ELM regression example.
%
%--------------------------------------------------------------------------
%
%   Version 1.X - Copyright 2020
%
%       For new releases and bug fixing of this Tool Set please send e-mail
%       to the authors.
%
%--------------------------------------------------------------------------
%
%   Institution:
%       Optimization, Modeling and Control Systems Research Group
%
%       Graduate Program in Industrial and Systems Engineering - PPGEPS
%
%       Pontifical Catholic University of Paran� - Brazil.
%           <http://en.pucpr.br/>
%
%--------------------------------------------------------------------------
%
%	Authors:
%       Victor Henrique Alves Ribeiro
%           <victor.henrique@pucpr.edu.br>
%

%% Data preparation

% Load data
load examgrades.mat
X = grades(:, 1:4);
Y = grades(:, 5);

% Split train and test data
[train, test] = dividerand(length(Y), 0.7, 0.3);
X_train = X(train, :);
Y_train = Y(train);
X_test = X(test, :);
Y_test = Y(test);

% Scale data
mean_x = mean(X_train);
std_x = std(X_train);

mean_y = mean(Y_train);
std_y = std(Y_train);

X_train = (X_train - mean_x) ./ std_x;
X_test = (X_test - mean_x) ./ std_x;

Y_train = (Y_train - mean_y) ./ std_y;
Y_test = (Y_test - mean_y) ./ std_y;

%% Train model and predict output

mdl = extreme_learning_machine_regressor(X_train, Y_train); % Train ELM
y = mdl.predict(X_test); % Predict

% Rescale target
y_test = Y_test * std_y + mean_y;
y = y * std_y + mean_y;

% Print R Squared
fprintf("---------------\n");
fprintf("Model R�: %.3f\n", ...
    1 - sum((y_test - y) .^ 2) / sum((y_test - mean(y_test)) .^ 2));
fprintf("---------------\n");