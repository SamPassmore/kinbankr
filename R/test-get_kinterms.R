
## Real example test

siblings = outer(c("m", "f"), c("eB", "eZ", "yB", "yZ"), paste0)
siblings = c(siblings[1,], siblings[2,])
kin_types = siblings

sibling_vectors = get_structural_vectors(kin_types = siblings, duplicates = "any")
