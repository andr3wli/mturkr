
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
# read in the data 
batch <- readr::read_csv("data/exp6/Batch_4646160_batch_results.csv")
mturk <- readr::read_csv("data/exp6/mturkcode.csv")
analysis <- readr::read_csv("data/exp6/petition.csv")
```

``` r
library(mturkr)

# See if the batch code participants gave matches the mturk code we provided  
keep <- discard_list(df1 = batch, df2 = mturk)

# check if participants passed the attention check 
# note the example data set in this package did not have an attention check 
attention_question <- "This is an attention check. Please select ‘strongly agree’ to pass this check. You will not be compensated if you fail this check."
failed <- failed_attention_check(analysis, question = attention_question)

# create the approve column 
clean_batch <- create_approve_col(batch, keep = keep, fail = failed)

# create the reject column 
clean_batch <- create_reject_col(clean_batch, keep = keep, fail = failed)
```

``` r
# finally, save the new data set to be sent back to Amazon to confirm which participants get payment 
readr::write_csv(clean_batch, file = here::here("clean_batch", "batch_data_payment_confirmation.csv"))
```
