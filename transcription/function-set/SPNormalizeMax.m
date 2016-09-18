function result = SPNormalizeMax(x, y, parameters)
    max_ = max(x);
    
    if max_ ~= 0 
        result = x/max_;
    else
        result = x;
    end
end