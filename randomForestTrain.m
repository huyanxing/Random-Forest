function [ modelForest ] = randomForestTrain(features,labels,treeNumber,bagRate)
%RANDOMFOREST Summary of this function goes here
%   Detailed explanation goes here
[sampleNum,featureNum] = size(features);


for i = 1:treeNumber 
    bagSampleID = sort(randsample(sampleNum,floor(bagRate*sampleNum)));
    bagSampleOutID = setdiff([1:sampleNum],bagSampleID);
    bagFeatureID = sort(randsample(featureNum,floor(sqrt(featureNum))));
    bagFeatures = features(bagSampleID,bagFeatureID);
    bagLabels = labels(bagSampleID);
    tempRETree = cartree(bagFeatures,bagLabels,'g');
    featureInTempRETree = tempRETree.nodeCutVar;
        for j=1:length(featureInTempRETree)
                if  featureInTempRETree(j) ~= 0
                    inBagFeatureID = featureInTempRETree(j);
                    realFeatureIDinTree (j)= bagFeatureID(inBagFeatureID);
            else
                realFeatureIDinTree (j)= 0;
            end
        end
    tempRETree.realFeatureID = realFeatureIDinTree;
    clear realFeatureIDinTree  inBagFeatureID featureInTempRETree;
    modelForest{i}= tempRETree;
    clear tempRETree
end

