function finalSubsequences = findmatchSequences(S,SA,LCP,BWT,k)

    % use minV as threshold - only want more than 10 consecutives frames
%     k=1;
%     maxV = 0;
%     while(maxV > 10)
%         maxV = maxk(LCP,k);
%         k = k+1;
%     end
    
    %find k largest maxima ---- maxk/mink function requires MatLab R2017b
    [maxV,maxI] = maxk(LCP,k)
    [minIndexinLCP, minPos] = mink(maxI,k);
    
    for i=1:k
        map(i,:) = [SA(minIndexinLCP(i))+1, minIndexinLCP(i), minPos(i)];
    end
    
    sortedFinalOrder = sortrows(map,1);
    
    finalSubsequences = [];
    
    for i=1:k
       
       if( maxV(sortedFinalOrder(i,3))>10 )
        
           lastCharactBWT1 = BWT(sortedFinalOrder(i,2)+1,size(S,2));
           lastCharactBWT2 = BWT(sortedFinalOrder(i,2),size(S,2));

           if( lastCharactBWT1 ~= lastCharactBWT2)
                finalSubsequences = [finalSubsequences, BWT(sortedFinalOrder(i,2)+1,1:maxV(sortedFinalOrder(i,3)))];
           else
                % disp('a better match can be found');
           end
       end

    end

end