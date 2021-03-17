x
n=4;
tic
parfor i=1:n
    pause(i*10);
    
  
    train(48);
    
end
%tic;
%spmd
%train(48);
%end
%x=toc;
x=toc;