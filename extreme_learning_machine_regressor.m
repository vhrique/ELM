classdef extreme_learning_machine_regressor
    %EXTREME_LEARNING_MACHINE_REGRESSOR Builds a regression extreme
    %learning machine. 
    
    properties
        Win = [];
        activation = {};
        Wout = [];
        functional = 0;
    end
    
    methods
        function obj = extreme_learning_machine_regressor(X,y,varargin)
            %EXTREME_LEARNING_MACHINE_REGRESSOR Trains an ELM for
            %regression.
            % Inputs:
            %   X - Input data
            %   y - output data
            %   hidden - the number of hidden units (default: 2*size(X,2))
            %   activation - activation function (default: 'sigmoid')
            %                other values: 'tanh', 'relu', 'rbf', 'linear'
            %   functional - functional link between input and output
            %                (default: 0 [false]) other values: 1 [true]
            % Output:
            %   obj - Trained ELM object
            
            p = inputParser;
            
            addRequired(p, 'X', @ismatrix);
            addRequired(p, 'y', @ismatrix);
            addParameter(p, 'hidden', 2*size(X,2), @isnumeric);
            addParameter(p, 'activation', 'sigmoid', @(x)any(validatestring(x,{'sigmoid','tanh','rbf','relu'})));
            addParameter(p, 'functional', 0, @isnumeric);
            
            parse(p,1,1,varargin{:});

            obj.functional = p.Results.functional;
            
            switch p.Results.activation
                case 'sigmoid'
                    obj.activation = @(x)(1 ./ (1 + exp(-x)));
                case 'tanh'
                    obj.activation = @(x)(tanh(x));
                case 'relu'
                    obj.activation = @(x)(max(0,x));
                case 'rbf'
                    obj.activation = @(x)(radbas(x));
                case 'linear'
                    obj.activation = @(x)(x);
            end
            
            hidden = p.Results.hidden;

            obj.Win = rand(size(X,2)+1, hidden) * 2 - 1;
            H = obj.activation([X, ones(size(X,1),1)] * obj.Win);
            if obj.functional; H = [H,X]; end
            obj.Wout = pinv([H, ones(size(H,1),1)]) * y;
        end
        
        function [y, p] = predict(obj, X)
            %PREDICT Predicts the output of the trained model for new input
            %data
            % Inputs:
            %   obj - trained ELM
            %   X - Input data
            
            % Output:
            %   y - output output
            
            H = obj.activation([X, ones(size(X,1),1)] * obj.Win);
            if obj.functional; H = [H, X]; end
            y = [H, ones(size(H,1),1)] * obj.Wout;
        end
    end
end

