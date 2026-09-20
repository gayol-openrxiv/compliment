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

test_that("compliment(mood = 'stab') produces a backhanded compliment", {
  set.seed(6183)
  results <- replicate(100, compliment(mood = "stab"))
  adjective_hits <- grepl(
    paste(backhanded_adjectives, collapse = "|"),
    results,
    fixed = FALSE
  )
  template_hits <- results %in% backhanded_templates
  expect_true(all(adjective_hits | template_hits))
})

test_that("compliment(mood = 'stab') with a name addresses the name", {
  result <- compliment("Alex", mood = "stab")
  expect_true(grepl("^Alex,", result))
})

test_that("compliment('stab') detects mood from the name argument", {
  set.seed(2917)
  results <- replicate(100, compliment("stab"))
  # Should be backhanded, not addressed to someone named "stab"
  expect_false(any(grepl("^stab,", results, ignore.case = TRUE)))
  adjective_hits <- grepl(paste(backhanded_adjectives, collapse = "|"), results)
  template_hits <- results %in% backhanded_templates
  expect_true(all(adjective_hits | template_hits))
})

test_that("mood detection is case-insensitive", {
  result <- compliment("stab")
  expect_false(grepl("^stab,", result))
})

test_that("names that are not moods are still treated as names", {
  result <- compliment("Alex", mood = "kind")
  expect_true(grepl("^Alex,", result))
})

test_that("compliment() errors on invalid mood", {
  expect_error(compliment(mood = "sarcastic"))
})

test_that("explicit mood wins over name matching a mood", {
  result <- compliment("stab", mood = "kind")
  expect_true(grepl("^stab,", result))
})

test_that("compliment() produces varied output", {
  set.seed(42)
  results <- replicate(50, compliment())
  expect_gt(length(unique(results)), 1)
})
