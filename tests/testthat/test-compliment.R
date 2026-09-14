test_that("compliment() returns a single character string", {
  result <- compliment()
  expect_type(result, "character")
  expect_length(result, 1)
})

test_that("compliment() includes name when supplied", {
  result <- compliment("Alex")
  expect_true(grepl("^Alex,", result))
})

test_that("compliment() errors on invalid name", {
  expect_error(compliment(123))
  expect_error(compliment(c("A", "B")))
})

test_that("compliment() produces varied output", {
  set.seed(42)
  results <- replicate(50, compliment())
  expect_gt(length(unique(results)), 1)
})
