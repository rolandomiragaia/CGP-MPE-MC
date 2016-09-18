function setupInputs_(this, inputs)
    % setupInputs_ Setup the input genes array
    %
    %   Input:
    %       this   {Structure} instante of the class
    %       inputs {integer} number of CGP inputs
    %
    %   Examples:
    %       structure.setupInputs_(4)
    %       structure.setupInputs_(2)

    this.inputs = 1:inputs;
end
