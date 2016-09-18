function train(varargin)
    if nargin > 0
        for i = 1:nargin
            Classifier(num2str(varargin{i}));
        end
    else
        Classifier('60');
    end
end