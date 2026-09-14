#' Adjectives used to build compliments
#'
#' @keywords internal
#' @noRd
compliment_adjectives <- c(
  "amazing",
  "brilliant",
  "creative",
  "delightful",
  "fantastic",
  "generous",
  "hilarious",
  "inspiring",
  "kind",
  "outstanding",
  "radiant",
  "remarkable",
  "thoughtful",
  "witty",
  "wonderful"
)

#' Traits used to build compliments
#'
#' @keywords internal
#' @noRd
compliment_traits <- c(
  "sense of humor",
  "way with words",
  "attention to detail",
  "positive energy",
  "problem-solving skills",
  "creativity",
  "kindness",
  "work ethic",
  "taste in music",
  "ability to make others smile"
)

#' Generate a random compliment
#'
#' Produces a randomized, uplifting compliment, optionally addressed to a
#' specific name.
#'
#' @param name Optional character string giving the name of the person to
#'   compliment. If `NULL` (the default), a generic compliment is returned.
#'
#' @return A single character string containing a compliment.
#' @export
#'
#' @examples
#' compliment()
#' compliment("Alex")
compliment <- function(name = NULL) {
  if (!is.null(name)) {
    if (!is.character(name) || length(name) != 1) {
      stop("`name` must be a single character string or NULL.", call. = FALSE)
    }
  }

  adjective <- sample(compliment_adjectives, 1)
  trait <- sample(compliment_traits, 1)

  templates <- c(
    sprintf("You are truly %s!", adjective),
    sprintf("Your %s is unmatched.", trait),
    sprintf("You're one of the most %s people I know.", adjective),
    sprintf("I really admire your %s.", trait)
  )

  message <- sample(templates, 1)

  if (!is.null(name)) {
    first_char <- substring(message, 1, 1)
    first_two <- substring(message, 1, 2)
    lowered <- if (first_two %in% c("I ", "I'")) {
      first_char
    } else {
      tolower(first_char)
    }
    message <- paste0(name, ", ", lowered, substring(message, 2))
  }

  message
}
