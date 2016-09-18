function configuration_ = getCustomConfiguration_(~, varargin)
    if size(varargin, 2) >= 1
        fileName = [varargin{1}, '.record.ini'];
        if exist(fileName, 'file') == 2
            configuration_ = ini2struct(fileName);
            configuration_.signal.pitch = varargin{1};
        else
            configuration_ = ini2struct('default.ini');
            configuration_.signal.pitch = varargin{1};
        end
    else
        configuration_ = ini2struct('default.ini');
    end
end
