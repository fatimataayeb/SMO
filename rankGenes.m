function  rankGenes(n)

%Labels (0 = no tumor , 1 = tumor ) 
load('labels.mat');
labels = cancerlabels;
%Genes (2000 features -normalized) 
load('genes.mat');

[gene,expression] = relieff(genes,labels,5);

top_n_features = gene(1,1:n);
topGenes = genes(:,top_n_features);

save ('topGenes.mat' , 'topGenes');
end


