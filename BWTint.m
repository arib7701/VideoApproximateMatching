function [BWM, BWM_1stColumn, BWM_lastColumn] = BWTint (intarray)
% perform Burrows-Wheeler Matrix (BWM) Transform

lengthOfGene = length (intarray);

stringMatrix = [];	% [][]

for i=1:lengthOfGene
	% numberOfRightRotation = i;
	stringMatrix{i} = circshift(intarray, [1 i]);    
end
stringMatrix=cell2mat(stringMatrix);
stringMatrix=reshape(stringMatrix,[lengthOfGene,lengthOfGene])';
BWM = sortrows(stringMatrix);

BWM_1stColumn = BWM(:,1)';
BWM_lastColumn = BWM(:,end)';
