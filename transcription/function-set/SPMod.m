function result = Mod(x, y, parameters)
    try
        result = mod(x, y);
    catch
        result = x;
    end
end