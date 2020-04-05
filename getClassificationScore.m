function score = getClassificationScore(chosenGenes)

%Labels (0 = no tumor , 1 = tumor ) 
load('labels.mat');
labels = cancerlabels;
%Genes (2000 features -normalized) 
%load('genes.mat');
%---For Filter use this
load('topGenes.mat');
genes = topGenes;
%Split data 60/40 for train and test 
cv = cvpartition(size(genes,1),'HoldOut',0.65);

%Set Training Data ( Input = features , Output = labels) 
training_input = genes(cv.training,logical(chosenGenes));
training_output = labels(cv.training,:);

%Set Testing Data
testing_input = genes(cv.test,logical(chosenGenes));
testing_output = labels(cv.test,:);

%Fit Training Data into SVM model with Linear Kernel
model = fitcsvm(training_input, training_output, 'KernelFunction', 'linear', 'BoxConstraint', 1);

prediction = predict(model, testing_input);

score = mean(prediction == testing_output);

end

