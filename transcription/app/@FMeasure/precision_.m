function precision_ = precision_(~, truePositives, falsePositives)
    if truePositives == 0
        precision_ = 0;
    else
        precision_ = truePositives / (truePositives + falsePositives);
    end
end