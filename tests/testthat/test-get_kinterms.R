
## Real example test
## This test will show that, for English:
### 1. The structural vector is correctly built
### 2. The names have been applied correctly.
siblings = c("meB", "myB", "meZ")
kin_types = siblings

sibling_vectors = get_structural_vectors(kin_types = siblings, duplicates = "any", languages = "v_standardenglishstan1293")

testthat::test_that("Making structural vectors...", {
  expect_equal(sibling_vectors, structure(c(FALSE, TRUE, FALSE), dim = c(1L, 3L),
                                          dimnames = list(NULL, c("meZmeB", "myBmeB", "myBmeZ")))
  )
})
