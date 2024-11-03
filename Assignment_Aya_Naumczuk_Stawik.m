%% ASSIGNMENT 2
clc;
clear;
close all;
% Load the data
T = readtable('Courts_data_2023.xlsx');
% Remove columns with NaN values
columnsToDelete = {'Var8', 'Var15', 'Var17', 'Var21'}; % columns with NaN values
T(:, columnsToDelete) = [];
% Separate data and prices (fixed first two columns in prices)
data1 = T(:, [2:7, 15:17]);
data = table2array(data1);
data = [data(:,1:6) ones(84,1) data(:,7:end)]; % ones for unit of assets
prices1 = T(:, 8:14); % This table contains all price columns.
prices = table2array(prices1);
prices_fixed = prices(:, 1:2); % Fixed price columns
prices_non_fixed = prices(:, 3:end); % Other price columns
[n, m] = size(data);
inputs = 7; 
outputs = 3;
%% Combined approach:
X_fix = data(:,1:inputs-5); % X for fare
X_non = data(:,outputs:inputs).*prices_non_fixed; % X for tone
X = data(:,1:inputs); % all X for observed cost
Y = data(:, inputs+1:m); 

observed_cost=sum(X.*prices,2); 

% initialize empty matrixes
cost_efficiency = nan(n, 1);

% variables-> [X lamdas]
for i=1:n
    model_Mixed.obj = [prices_fixed(i, 1:inputs - 5), ones(1, inputs - 2), zeros(1, n)];
    model_Mixed.modelsense = 'min';
    a1 = [-eye(inputs) [X_fix X_non]'];
    a2 = [zeros(outputs, inputs) Y'];
    model_Mixed.A = sparse([a1; a2]);
    model_Mixed.rhs = [zeros(inputs, 1); Y(i, :)'];
    model_Mixed.sense = [repmat('<', 1, inputs) repmat('>', 1, outputs)];
    params.outputflag = 0;
    result = gurobi(model_Mixed, params);
    cost_efficiency(i, 1) = result.objval / observed_cost(i, 1);
end




