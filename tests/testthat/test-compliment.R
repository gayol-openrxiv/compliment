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

test_that("compliment() preserves capital I when name is supplied", {
  set.seed(8391)
  results <- replicate(200, compliment("Alex"))
  i_results <- results[grepl("I really admire", results)]
  expect_true(
    length(i_results) > 0,
    label = "No 'I really admire' templates appeared; increase replications"
  )
  expect_true(all(grepl("^Alex, I really admire", i_results)))
})

test_that("compliment() produces varied output", {
  set.seed(42)
  results <- replicate(50, compliment())
  expect_gt(length(unique(results)), 1)
})
