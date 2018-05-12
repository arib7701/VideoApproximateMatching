function finalSubsequences2 = findmatchSequences(S,SA,LCP,BWT,k)

    %find k largest maxima ---- maxk/mink function requires MatLab R2017b
    [maxV,maxI] = maxk(LCP,k);
    [minIndexinLCP, minPos] = mink(maxI,k);
    
    finalSubsequences2 = [];
    
    mapping = zeros(1,size(S,2));
    
    for i=1:k
            
           lastCharactBWT1 = BWT(maxI(i)+1,size(S,2));
           lastCharactBWT2 = BWT(maxI(i),size(S,2));

           if( lastCharactBWT1 ~= lastCharactBWT2)
                
                indexMatch = SA(maxI(i))+1;
                indexMatch2 = SA(maxI(i)+1)+1;
                
                if (mapping(indexMatch:indexMatch+maxV(i)-1) == 1)
                    % disp('already part of a match');
                else
                    mapping(indexMatch:indexMatch+maxV(i)-1) = 1;
                    mapping(indexMatch2:indexMatch2+maxV(i)-1) = 1;
                    finalSubsequences2 = [finalSubsequences2, BWT(maxI(i)+1,1:maxV(i))];
                end
           else
                % disp('a better match can be found');
           end

    end

end