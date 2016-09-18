function report_ = report_(~, configuration, default)

    callbacks = struct();

    if isfield(configuration, 'callbacks')
        fields = strsplit(configuration.callbacks, ',');
        
        for i=1:size(fields, 2)
            callbacks.(char(fields(i))) = true;
        end
    else
        fields = strsplit(default.callbacks, ',');
        
        for i=1:size(fields, 2)
            callbacks.(char(fields(i))) = true;
        end
    end
    
    if isfield(configuration, 'generation_frequency')
        generation_frequency = str2double(configuration.generation_frequency);
    else
        generation_frequency = str2double(default.generation_frequency);
    end

    report_ = struct( ...        
        'callbacks', callbacks, ...
        'generation_frequency', generation_frequency ...
    );
end