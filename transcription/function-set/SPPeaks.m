function result = SPPeaks(x, y, parameters)
    if isreal(y) && isreal(x)
        [pks,locs] = findpeaks(x);
        result = zeros(size(x));
        result(locs) = pks;
    else
        result = x;
    end
end
