function result = SPNormalizeSum(x, y, parameters)
    sum_ = sum(x);
    
    if sum_ ~= 0 
        result = x/sum_;
    else
        result = x;
    end
end