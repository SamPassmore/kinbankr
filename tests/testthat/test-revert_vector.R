kin_types = c("meB", "myB", "meZ")

sibling_vectors = get_structural_vectors(kin_types = kin_types, duplicates = "any", languages = "v_standardenglishstan1293")

testthat::test_that("Reverting structural vectors...", {
  expect_equal(revert_vector(sibling_vectors, nmes = kin_types),
               c(meB = 1, myB = 1, meZ = 2))
}
)

