# VideoApproximateMatching

Approximate Matching of Videos (original and sightly modified) using Suffix Array, Longest Common Prefix and Burrow Wheeler Transform

Using Matlab

In this project we worked on finding the similarities between videos of different lengths using illumination and texture information of the frames.

Inspired by the work of Ping-Hao Wu et al: A SUFFIX ARRAY APPROACH TO VIDEO COPY DETECTION IN VIDEO SHARING SOCIAL NETWORKS Ping-Hao Wu, Tanaphol Thaipanich and C.-C. Jay Kuo Ming Hsieh Department of Electrical Engineering and Signal and Image Processing Institute University of Southern California, Los Angeles, CA 90089-2564

Steps of algorithm:

 - Extract Features of Videos (original and slightly modified version) --> main.m / main-texture.m
 - Find Anchor Frames
 - Get Videos Signatures and Concatenate them
 - Calculate Suffix Array --> getSuffixArray.m / suffixArray.m / radixPass.m / leq1.m / leq2.m
 - Calculate Longest Common Prefix --> lcp.m
 - Calculate Burrow Wheeler Transform --> BWTint.m
 - Find Match Sequences (based on different threshold) --> findmatchSequences.m / findmatchSequences2.m

