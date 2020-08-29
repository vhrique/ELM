%%  Extreme Learning Machine - Classification Demo
%
%	A simple classification ELM example.
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
%   Institutions:
%       Optimization, Modeling and Control Systems Research Group
%       Industrial and Systems Engineering Graduate Program - PPGEPS
%       Pontifical Catholic University of Paraná - Brazil.
%
%       Computer Science Graduate Program
%       Electrical Engineering Graduate Program
%       Federal University of Technology - Paraná - Brazil.
%
%--------------------------------------------------------------------------
%
%	Authors:
%       Victor Henrique Alves Ribeiro, M.Sc.
%           <victor.henrique@pucpr.edu.br>
%       Gilberto Reynoso-Meza, Ph.D.
%       Hugo Siqueira Valadares, Ph.D.
%

%% Data preparation

% Load and adjust data
load fisheriris.mat
X = meas; % Features
Y = categorical(species) == 'virginica'; % Outputs - converted to binary

% Split train and test data
[tr, ts] = dividerand(length(Y), 0.7, 0.3);
X_train = X(tr, :);
Y_train = Y(tr);
X_test = X(ts, :);
Y_test = Y(ts);

% Adjust data
X_test = (X_test - mean(X_train)) ./ std(X_train);
X_train = (X_train - mean(X_train)) ./ std(X_train);

%% Train model and predict output

mdl = extreme_learning_machine_classifier(X_train, Y_train); % Train ELM
y = mdl.predict(X_test); % Predict

% Print result
fprintf("-------------------\n");
fprintf("Model Acc.: %.2f%%\n", ...
    100 * sum(y == Y_test) / length(Y_test));
fprintf("-------------------\n");
