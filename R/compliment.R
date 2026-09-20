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

#' Backhanded adjectives used to build grumpy compliments
#'
#' @keywords internal
#' @noRd
backhanded_adjectives <- c(
  "confident, given everything",
  "brave for trying",
  "surprisingly tolerable",
  "almost impressive",
  "not the worst"
)

#' Backhanded templates used to build grumpy compliments
#'
#' @keywords internal
#' @noRd
backhanded_templates <- c(
  "You look great today -- I almost didn't recognize you.",
  "You're proof that anyone can improve, eventually.",
  "You have the kind of face that really grows on people.",
  "You always say exactly what's on your mind, and that's a choice.",
  "You're at the top of the bell curve.",
  "I didn't expect much, and you delivered.",
  "You bring everyone so much joy... when you leave the room.",
  "You're surprisingly articulate for you."
)

#' Generate a random compliment
#'
#' Produces a randomized compliment, optionally addressed to a specific name.
#' With `mood = "grumpy"`, produces a backhanded compliment instead.
#'
#' @param name Optional character string giving the name of the person to
#'   compliment. If `NULL` (the default), a generic compliment is returned.
#'   For convenience, if `name` matches one of the available moods (e.g.
#'   `"grumpy"`) it is treated as the `mood` instead.
#' @param mood The tone of the compliment: `"kind"` (the default) for a
#'   sincere compliment, or `"grumpy"` for a backhanded one.
#'
#' @return A single character string containing a compliment.
#' @export
#'
#' @examples
#' compliment()
#' compliment("Alex")
#' compliment("grumpy")
#' compliment("Alex", mood = "grumpy")
compliment <- function(name = NULL, mood = c("kind", "grumpy")) {
  moods <- eval(formals()$mood)
  if (!is.null(name)) {
    if (!is.character(name) || length(name) != 1) {
      stop("`name` must be a single character string or NULL.", call. = FALSE)
    }
    # Treat a name matching a known mood as the mood argument
    if (missing(mood) && tolower(name) %in% moods) {
      mood <- tolower(name)
      name <- NULL
    }
  }
  mood <- match.arg(mood)

  if (mood == "grumpy") {
    adjective <- sample(backhanded_adjectives, 1)
    templates <- c(
      backhanded_templates,
      sprintf("You are truly %s.", adjective),
      sprintf("You're one of the most %s people I know.", adjective)
    )
  } else {
    adjective <- sample(compliment_adjectives, 1)
    trait <- sample(compliment_traits, 1)
    templates <- c(
      sprintf("You are truly %s!", adjective),
      sprintf("Your %s is unmatched.", trait),
      sprintf("You're one of the most %s people I know.", adjective),
      sprintf("I really admire your %s.", trait)
    )
  }

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
