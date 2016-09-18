function nodesResult = initializeNodesResult_(~, nodesResult, index, inputs)
    %nodesResult(1,:) = inputs.real(index,:);
    %nodesResult(2,:) = inputs.imaginary(index,:);
    fields_ = fieldnames(inputs);
    for i=1:size(fieldnames(inputs), 1)
        input_ = inputs.(fields_{i});
        nodesResult(i, :) = input_(index,:);
    end
%     nodesResult(1,:) = inputs.cceps(index,:);
%     nodesResult(2,:) = inputs.rceps(index,:);
%     nodesResult(3,:) = inputs.absolute(index,:);
%     nodesResult(4,:) = inputs.phase(index,:);
end