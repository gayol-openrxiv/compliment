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

test_that("compliment(mood = 'grumpy') produces a backhanded compliment", {
  set.seed(6183)
  results <- replicate(100, compliment(mood = "grumpy"))
  adjective_hits <- grepl(
    paste(backhanded_adjectives, collapse = "|"),
    results,
    fixed = FALSE
  )
  template_hits <- results %in% backhanded_templates
  expect_true(all(adjective_hits | template_hits))
})

test_that("compliment(mood = 'grumpy') with a name addresses the name", {
  result <- compliment("Alex", mood = "grumpy")
  expect_true(grepl("^Alex,", result))
})

test_that("compliment('grumpy') detects mood from the name argument", {
  set.seed(2917)
  results <- replicate(100, compliment("grumpy"))
  # Should be backhanded, not addressed to someone named "grumpy"
  expect_false(any(grepl("^grumpy,", results, ignore.case = TRUE)))
  adjective_hits <- grepl(paste(backhanded_adjectives, collapse = "|"), results)
  template_hits <- results %in% backhanded_templates
  expect_true(all(adjective_hits | template_hits))
})

test_that("mood detection is case-insensitive", {
  result <- compliment("GRUMPY")
  expect_false(grepl("^GRUMPY,", result))
})

test_that("names that are not moods are still treated as names", {
  result <- compliment("Alex", mood = "kind")
  expect_true(grepl("^Alex,", result))
})

test_that("compliment() errors on invalid mood", {
  expect_error(compliment(mood = "sarcastic"))
})

test_that("explicit mood wins over name matching a mood", {
  result <- compliment("grumpy", mood = "kind")
  expect_true(grepl("^grumpy,", result))
})

test_that("compliment() produces varied output", {
  set.seed(42)
  results <- replicate(50, compliment())
  expect_gt(length(unique(results)), 1)
})
