function lcp = lcp(S, SA)

    %add one to consider indexing at 1
    S = S + 1;
    SA = SA + 1;
    
    n = size(SA,2);
 
    lcp = zeros(1, n);
 
    invSA = zeros(1, n);
 
    for i=1:n
        invSA(1,SA(1,i)) = i;
    end
  
    k = 0;
 
    for i=1:n
        if (invSA(1,i) == n)
            k = 0;
            continue;
        end
        
        j = SA(1,invSA(1,i)+1);

        while (i+k<=n && j+k<=n && S(1,i+k)==S(1,j+k))
            k =  k+1;
        end
 
        lcp(1,invSA(1,i)) = k;
 
        if (k>0)
            k =  k-1;
        end
    end
end