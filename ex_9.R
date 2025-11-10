# *De Novo* Genome Assembly

## The Greedy Shortest Common Superstring
### Task
# * In R, implement a function `GreedySuperstring()` according to the pseudocode.
# 
# * Input:
#   * `S` A `DNAStringSet` object of strings (reads).
# 
# * Output:
#   * `S` A `DNAStringSet` object of the shortest common superstring (contig).
# 
# > **Hint:** 
#   > Create also functions:
#   > * `Overlap()` to calculate overlap between two sequences.
# > * `OverlapMatrix()` to create a matrix of overlaps among all sequences in `S`.
# 


Overlap<-function(){
  
}

OveralMatrix<-function(){
  
}


GreedySuperstring <- function(S){
   while (length of S > 1)
     overlapMat <- OverlapMatrix(S)
     if max(overlapMat) = 0
       return S
     else
         seq1, seq2 ← Two sequences from S with the longest overlap
       Merge seq1 and seq2 and add the new sequence to S
       Remove seq1 and seq2 from S
   return(S)

}

