function recall_ = recall_(~, truePositives, falseNegatives)
    if truePositives == 0
        recall_ = 0;
    else
        recall_ = truePositives / (truePositives + falseNegatives);
    end
end