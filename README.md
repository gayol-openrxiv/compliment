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

## Usage

A package built with Posit Assisstant during posit::conf(2026) in the
“Our Modern R Workflow” workshow with Jenny Bryan and Hadley Wickham.

Call `compliment()` with optional arguments `name` and `mood`. Providing
a name will address the compliment to that person. Providing
`mood = "stab"` will generate a backhanded compliment. If no mood is
provided, the compliment will be kind 😊.

    compliment(name = NULL, mood = c("kind", "stab"))

### Example

A kind compliment addressed to Olaya:

``` r
library(compliment)
compliment("Olaya")
```

    ## [1] "Olaya, you are truly thoughtful!"

A backhanded compliment addressed to Olaya:

``` r
compliment("Olaya", mood = "stab")
```

    ## [1] "Olaya, you bring everyone so much joy... when you leave the room."
