# This script reverts structural vectors into alphabetized kinterm structures

#' Revert Structural vectors
#'
#' @param v the binarised structural vector from get_structural_vector()
#' @param nmes the names of parameters used in get_structural_vector()
#'
#' @return a character vector representing the original kin terminology set, with letters in place of kinterms
#' @export
#'
#' @examples
revert_vector = function(v, nmes = "none"){
  require(igraph)

  n = length(v)
  dims = 0.5 * (sqrt((8 * n) + 1) + 1)
  mat = matrix(NA, ncol = dims, nrow = dims)
  mat[lower.tri(mat)] = v
  mat[upper.tri(mat)] <- t(mat)[upper.tri(mat)]
  diag(mat) = 1

  dd = graph_from_adjacency_matrix(mat, mode = "undirected") %>%
    clusters() %>% {.$membership}

  if(nmes[1] != "none"){
    names(dd) = nmes
  }
  dd
}
