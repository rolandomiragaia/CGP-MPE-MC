function nodesResult_ = decodeNodes_(this, sizes, structure, genes, active, nodesResult_, functions, inputs, index, params)
  nodesResult_ = this.initializeNodesResult_(nodesResult_, index, inputs);

  if ~isfield(sizes, 'inputs')
      sizes.inputs = sizes.INPUTS;
      sizes.parameters = sizes.PARAMETERS;
  end

  for j = 1:size(active, 2)
    if active(j) <= sizes.inputs
        continue;
    end
    % TODO: pass this parameters to genotype configuration
    % start at number of inputs * number of nodes with
    % inputs; plus the number of genes to get to the first
    % parameter;
    paramGenes = (active(j) - sizes.inputs) * (3 + sizes.parameters) - sizes.parameters + 1:(active(j) - sizes.inputs) * (3 + sizes.parameters);
    for i = 1:size(paramGenes, 2)
      params(i) = genes(paramGenes(i));
    end

    geneFn = genes(structure.functionGenes(active(j) - sizes.inputs));
    firstInput = nodesResult_(genes(structure.connectionGenes{1}(active(j) - sizes.inputs)),:);
    secondInput = nodesResult_(genes(structure.connectionGenes{2}(active(j) - sizes.inputs)),:);

    result = functions{geneFn}(firstInput, secondInput, params);

    if any(isnan(result)) | any(~isreal(result)) | any(isinf(result))
        result(isnan(result)) = 0;
        result = real(result);
        result(isinf(result)) = 0;
    end

    nodesResult_(active(j),:) = result;
  end

end
