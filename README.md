
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mturkr

<!-- badges: start -->

![](https://img.shields.io/badge/AndrewLi-mturkr-green) [![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![License:
MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://cran.r-project.org/web/licenses/MIT)
<!-- badges: end -->

The goal of `mturkr` is to easily and quickly create the the batch data
set needed to send back to Amazon Mechanical Turk. This package will
create a new data set with the required reject and approve columns to
for participants payment.

I use MTurk a lot for my data collection so I think it is worthwhile to
create a package of the functions so that my analysis is cleaner. I
mainly intend to use this myself but if you use MTurk for data
collection as well, you might find this package useful

## Installation

You can install the development version of `mturkr` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("andr3wli/mturkr")
```

## Example

This is how you would use the functions in the :

``` r
library(mturkr)
```
