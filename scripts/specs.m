listOfHigherSpecs = dir([pwd, '/sp-toolbox/tests/']);
listOfHigherSpecs = listOfHigherSpecs(~ismember({listOfHigherSpecs.name},{'.','..'}));

for i = 1:length(listOfHigherSpecs)
   listOfLowerSpecs = dir([pwd, '/sp-toolbox/tests/', listOfHigherSpecs(i).name]);
   listOfLowerSpecs = listOfLowerSpecs(~ismember({listOfLowerSpecs.name},{'.','..'}));
   runtests(listOfLowerSpecs(1).name(1:end-2))
end