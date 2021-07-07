
<!-- README.md is generated from README.Rmd. Please edit that file -->

# izipr: Interpretable Zero-Inflated Poisson in R

<!-- badges: start -->

[![R build
status](https://github.com/thomas-fung/izipr/workflows/R-CMD-check/badge.svg)](https://github.com/thomas-fung/izipr/actions)
[![Codecov test
coverage](https://codecov.io/gh/thomas-fung/izipr/branch/master/graph/badge.svg)](https://codecov.io/gh/thomas-fung/izipr?branch=master)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
\# izipr <img src='man/figures/logo.png' align="right" height="139" />
<!-- badges: end -->

The `izipr` package provides a collection of functions for estimation,
testing and diagnostic checking for an interpretable zero-inflated
models.

Currently `izipr` supports log-linear generalized linear models, as well
as integer-valued GARCH models with identity link.

Work is progressing to include a zero-inflated negative binomial version
of these models.

## Installation

`izipr` is not available from [CRAN](https://CRAN.R-project.org) yet but
you can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("thomas-fung/izipr")
```

## Usage

A reference manual and some examples are available at
[thomas-fung.github.io/izipr](https://thomas-fung.github.io/izipr/)

## Citation

If you use this package to analyse your data, please use the following
citation:

-   Fung, T. and Huang, A. (2020). izipr: Interpretable Zero-Inflated
    Poisson in R. R package version 0.0.0.9000.

From R you can use:

``` s
citation("izipr")
toBibtex(citation("izipr"))
```
