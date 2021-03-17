function x = trainpar(class,runs)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


tic
parfor i=1:runs
    pause(i*5);      
    train(class);    
end
x=toc;
end

