%%please import Sample and Label into your workspace before trying with the
%%code.
numFolds=10;
Indices=crossvalind('Kfold', Label, numFolds);
for i=1: numFolds
TestingFoldSample=Sample(Indices==i, :);
TrainingFoldSample=Sample(Indices~=i, :);
TrainingFoldLabel= Label(Indices~=i, :);
svmStruct=svmtrain(TrainingFoldSample, TrainingFoldLabel, 'showplot', 0, 'kernel_function', 'rbf', 'rbf_sigma', 0.5, 'boxconstraint', 2);
OutLabel(Indices==i,1)=svmclassify(svmStruct, TestingFoldSample, 'showplot', true);

end
accFold=sum(grp2idx(OutLabel)==grp2idx(Label))/length(Label);
