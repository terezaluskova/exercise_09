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

library("Biostrings")

Overlap <- function(seq1, seq2) {
  seq1 <- as.character(seq1)
  seq2 <- as.character(seq2)
  over_l <- min(nchar(seq1), nchar(seq2))
  best_len <- 0
  
  for (i in 1:over_l) {
    if (substr(seq1, nchar(seq1) - i + 1, nchar(seq1)) ==
        substr(seq2, 1, i)) {
      best_len <- i
    }
  }
  return(best_len)   # vracíme délku překryvu, ne řetězec
}
OverlapMatrix<-function(S){
  n <- length(S)
  over_mat <- matrix(0, nrow = n, ncol = n)
  rownames(over_mat) <- names(S)
  colnames(over_mat) <- names(S)
  
  for (i in 1:n){
    for (j in 1:n){
      if (j != i){
        over_mat[i, j] <- Overlap(S[i], S[j])
      }
    }
  }
  return(over_mat)
}

GreedySuperstring <- function(S){
  
  while (length(S) > 1) {
    overlapMat <- OverlapMatrix(S)
    
    if (max(overlapMat) == 0) {

      return(DNAStringSet(paste(S, collapse = "")))
    }

    ind <- which(overlapMat == max(overlapMat), arr.ind = TRUE)[1, ]
    i <- ind[1]
    j <- ind[2]

    overlap_len <- overlapMat[i, j]
    merged_seq <- paste0(S[i], substr(S[j], overlap_len + 1, nchar(S[j])))

    S <- S[-c(i, j)]
    S <- c(S, merged_seq)
  }
  
  return(DNAStringSet(S))
}

S <- DNAStringSet(c("CATGC", "CTAAGT", "GCTA", "TTCA", "ATGCATC"))
GreedySuperstring(S)

