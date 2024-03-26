kin_types = c("meB", "myB", "meZ")

sibling_vectors = get_structural_vectors(kin_types = kin_types, duplicates = "any", languages = "v_standardenglishstan1293")

testthat::test_that("Reverting structural vectors...", {
  expect_equal(revert_vector(sibling_vectors, nmes = kin_types),
               c(meB = 1, myB = 1, meZ = 2))


  expect_equal(revert_vector(c(myBmeB = FALSE, meZmeB = TRUE, myZmeB = FALSE, meZmyB = FALSE,
                               myZmyB = TRUE, myZmeZ = FALSE), nmes = c("meB", "myB", "meZ", "myZ")),
               c(meB = 1, myB = 2, meZ = 1, myZ = 2))

}
)

