
## Real example test
siblings = outer(c("m", "f"), c("eB", "eZ", "yB", "yZ"), paste0)
siblings = c(siblings[1,], siblings[2,])
kin_types = siblings

sibling_vectors = get_structural_vectors(kin_types = siblings, duplicates = "any", languages = "v_standardenglishstan1293")

testthat::test_that("Making structural vectors...", {
  expect_equal(sibling_vectors, structure(
    c(
      FALSE,
      TRUE,
      FALSE,
      TRUE,
      FALSE,
      TRUE,
      FALSE,
      FALSE,
      TRUE,
      FALSE,
      TRUE,
      FALSE,
      TRUE,
      FALSE,
      TRUE,
      FALSE,
      TRUE,
      FALSE,
      FALSE,
      TRUE,
      FALSE,
      TRUE,
      FALSE,
      TRUE,
      FALSE,
      FALSE,
      TRUE,
      FALSE
    ),
    dim = c(1L, 28L)
  ))
})
