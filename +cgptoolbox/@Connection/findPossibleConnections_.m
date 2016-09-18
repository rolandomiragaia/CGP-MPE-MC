function connections = findPossibleConnections_(this, sizes)
    % findPossibleConnections_ Find all nodes before the current one, plus the inputs for the CGP
    %
    %   Given a specific node form the genotype, get a list of all possible node connections
    %   The list should have all the nodes before the current one, while in the range of the levels_back parameter
    %       Instantiates a vector with the levels back sizes
    %       Checks if there are any possible node connections, within the
    %       same row
    %       If the levels back is still not reached, find the possible
    %       node inputs
    %
    %   Input:
    %       this {Connection} instance of the Connection class
    %           'node_' - propertie which stores an integer, representing the current node
    %       sizes {struct} struct with sizes related constants
    %           'levels_back'    {integer} number of the previous nodes, which a node can connect to
    %           'rows'           {integer} number of rows
    %           'inputs'         {integer} number of CGP inputs
    %           'genes_per_node' {integer} number of genes per node (connection genes + function gene + parameters)
    %
    %   Examples:
    %       cgp.findPossibleConnections_(struct(
    %           'levels_back', 16,
    %           'rows', 16,
    %           'inputs', 2,
    %           'genes_per_node', 5
    %       ))
    %
    %       cgp.findPossibleConnections_(struct(
    %           'levels_back', 10,
    %           'rows', 20,
    %           'inputs', 4,
    %           'genes_per_node', 3
    %       ))

    % instantiates a vector with the levels back sizes
    connections = zeros(1, sizes.levels_back);

    % iterate through possible node connections
    i = 1;
    for j = this.node_ - sizes.rows:-sizes.rows:sizes.inputs
        if i > sizes.levels_back
            break;
        end
        connections(i) = j;
        i = i + 1;
    end

    % if there are any node connections, initialize the j propertie
    if isempty(j)
        j = this.node_ - sizes.rows;
    end

    % if the levels back value wasn't reached, fill in with the node inputs
    if j <= sizes.levels_back
        for j = sizes.inputs:-1:1
            if i > sizes.levels_back
                break;
            end
            connections(i) = j;
            i = i + 1;
        end
    end

    % sort the connections
    % remove the zeros
    % remove duplicates
    connections = sort(connections(connections > 0));
    difference  = diff([connections,NaN]);
    connections = connections(difference~=0);
end
