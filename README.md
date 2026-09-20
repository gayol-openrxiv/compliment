Generate a random compliment
================

- [Compliment](#compliment)
  - [Installation](#installation)
  - [Usage](#usage)

<!-- README.md is generated from README.Rmd. Please edit that file -->

# Compliment

## Installation

Install the development version from GitHub:

``` r
# install.packages("pak")
pak::pak("gayol-openrxiv/compliment")
```

    ## 

    ## → Package library at '/private/var/folders/qx/095_kt8x4nz40b0msgj89p280000gp/T/RtmpQrmPqB/temp_libpath126333b06dcdc'.

    ## → Will update 1 package.

    ## → The package (0 B) is cached.

    ## + compliment 0.0.0.9000 → 0.0.0.9000 👷‍♂️🔧 (GitHub: 0141fe1)

    ## ℹ No downloads are needed, 1 pkg is cached

    ## ✔ Got compliment 0.0.0.9000 (source) (9.60 kB)

    ## ℹ Packaging compliment 0.0.0.9000

    ## ✔ Packaged compliment 0.0.0.9000 (389ms)

    ## ℹ Building compliment 0.0.0.9000

    ## ✔ Built compliment 0.0.0.9000 (621ms)

    ## ✔ Installed compliment 0.0.0.9000 (github::gayol-openrxiv/compliment@0141fe1) (17ms)

    ## ✔ 1 pkg: upd 1, dld 1 (NA B) [4.5s]

## Usage

A package built with Posit Assisstant during posit::conf(2026) in the
“Our Modern R Workflow” workshow with Jenny Bryan and Hadley Wickham.

``` r
library(compliment)
```

Call `compliment()` with optional arguments `name` and `mood`. Providing
a name will address the compliment to that person. Providing
`mood = "stab"` will generate a backhanded compliment. If no mood is
provided, the compliment will be kind 😊.

    compliment(name = NULL, mood = c("kind", "stab"))

### Example

A kind compliment addressed to Olaya:

``` r
compliment("Olaya")
```

    ## [1] "Olaya, you're one of the most fantastic people I know."

``` r
compliment
```

    ## function (name = NULL, mood = c("kind", "stab")) 
    ## {
    ##     moods <- eval(formals()$mood)
    ##     if (!is.null(name)) {
    ##         if (!is.character(name) || length(name) != 1) {
    ##             stop("`name` must be a single character string or NULL.", 
    ##                 call. = FALSE)
    ##         }
    ##         if (missing(mood) && tolower(name) %in% moods) {
    ##             mood <- tolower(name)
    ##             name <- NULL
    ##         }
    ##     }
    ##     mood <- match.arg(mood)
    ##     if (mood == "stab") {
    ##         adjective <- sample(backhanded_adjectives, 1)
    ##         templates <- c(backhanded_templates, sprintf("You are truly %s.", 
    ##             adjective), sprintf("You're one of the most %s people I know.", 
    ##             adjective))
    ##     }
    ##     else {
    ##         adjective <- sample(compliment_adjectives, 1)
    ##         trait <- sample(compliment_traits, 1)
    ##         templates <- c(sprintf("You are truly %s!", adjective), 
    ##             sprintf("Your %s is unmatched.", trait), sprintf("You're one of the most %s people I know.", 
    ##                 adjective), sprintf("I really admire your %s.", 
    ##                 trait))
    ##     }
    ##     message <- sample(templates, 1)
    ##     if (!is.null(name)) {
    ##         first_char <- substring(message, 1, 1)
    ##         first_two <- substring(message, 1, 2)
    ##         lowered <- if (first_two %in% c("I ", "I'")) {
    ##             first_char
    ##         }
    ##         else {
    ##             tolower(first_char)
    ##         }
    ##         message <- paste0(name, ", ", lowered, substring(message, 
    ##             2))
    ##     }
    ##     message
    ## }
    ## <bytecode: 0x7dbdb9ee0>
    ## <environment: namespace:compliment>

A backhanded compliment addressed to Olaya:

``` r
compliment("Olaya", mood = "stab")
```

    ## [1] "Olaya, you're at the top of the bell curve."

``` r
compliment
```

    ## function (name = NULL, mood = c("kind", "stab")) 
    ## {
    ##     moods <- eval(formals()$mood)
    ##     if (!is.null(name)) {
    ##         if (!is.character(name) || length(name) != 1) {
    ##             stop("`name` must be a single character string or NULL.", 
    ##                 call. = FALSE)
    ##         }
    ##         if (missing(mood) && tolower(name) %in% moods) {
    ##             mood <- tolower(name)
    ##             name <- NULL
    ##         }
    ##     }
    ##     mood <- match.arg(mood)
    ##     if (mood == "stab") {
    ##         adjective <- sample(backhanded_adjectives, 1)
    ##         templates <- c(backhanded_templates, sprintf("You are truly %s.", 
    ##             adjective), sprintf("You're one of the most %s people I know.", 
    ##             adjective))
    ##     }
    ##     else {
    ##         adjective <- sample(compliment_adjectives, 1)
    ##         trait <- sample(compliment_traits, 1)
    ##         templates <- c(sprintf("You are truly %s!", adjective), 
    ##             sprintf("Your %s is unmatched.", trait), sprintf("You're one of the most %s people I know.", 
    ##                 adjective), sprintf("I really admire your %s.", 
    ##                 trait))
    ##     }
    ##     message <- sample(templates, 1)
    ##     if (!is.null(name)) {
    ##         first_char <- substring(message, 1, 1)
    ##         first_two <- substring(message, 1, 2)
    ##         lowered <- if (first_two %in% c("I ", "I'")) {
    ##             first_char
    ##         }
    ##         else {
    ##             tolower(first_char)
    ##         }
    ##         message <- paste0(name, ", ", lowered, substring(message, 
    ##             2))
    ##     }
    ##     message
    ## }
    ## <bytecode: 0x7dbdb9ee0>
    ## <environment: namespace:compliment>
