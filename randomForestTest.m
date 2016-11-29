function [ Labels ] = randomForestTest(features,  modelForest)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
treeNum = length(modelForest);
for i = 1:treeNum
    bagFeatureID = modelForest{i}.bagFeatureID;
    %bagFeatureID(bagFeatureID == 0) = [];
    subFeatures = features(:,bagFeatureID);
    output(i,:) = carTest(subFeatures,modelForest{i});
end

Labels= mode(output,1);
end
