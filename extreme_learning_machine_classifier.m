classdef extreme_learning_machine_classifier
    %EXTREME_LEARNING_MACHINE_CLASSIFIER Builds a classification extreme
    %learning machine. 
    
    properties
        Win = [];
        activation = {};
        Wout = [];
        functional = 0;
    end
    
    methods
        function obj = extreme_learning_machine_classifier(X,y,varargin)
            %EXTREME_LEARNING_MACHINE_CLASSIFIER Trains an ELM for
            %classification.
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
            %   y - Binary output
            %   p - Numeric output (~probability)
            
            H = obj.activation([X, ones(size(X,1),1)] * obj.Win);
            if obj.functional; H = [H, X]; end
            p = [H, ones(size(H,1),1)] * obj.Wout;
            y = p >= 0.5;
        end
    end
end

