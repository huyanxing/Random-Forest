function [carTreeOutput] = carTest(features,RETree) 
[sampleNum,featureNum]= size(features);
nodeCutVar = RETree.nodeCutVar; 
nodeCutValue = RETree.nodeCutValue;
childNode= RETree.childnode;
nodeLabel= RETree.nodelabel;

for i = 1:sampleNum
   currentNode = 1;
   while childNode(currentNode) ~= 0
       key = nodeCutVar(currentNode);
       if features(i,key) < nodeCutValue(currentNode)
           currentNode = childNode(currentNode);
       else 
           currentNode = childNode(currentNode)+1;
       end
   end
   carTreeOutput(i) = nodeLabel(currentNode);

end 