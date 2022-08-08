
# `cacc`: Conjunctive Analysis of Case Configurations

An R Package to compute Conjunctive Analysis of Case Configurations
(CACC), Situational Clustering Tests, and Main Effects

## Description

This package contains a set of functions to conduct Conjunctive Analysis
of Case Configurations (CACC) (Miethe, Hart & Regoeczi, 2008), to
identify and quantify situational clustering in dominant case
configurations (Hart, 2019), and to determine the main effects of
specific variable values on the probabilities of outcome (Hart, Rennison
& Miethe, 2017). Initially conceived as an exploratory technique for
multivariate analysis of categorical data, CACC has developed to include
formal statistical tests that can be applied in a wide variety of
contexts. This technique allows examining composite profiles of
different units of analysis in an alternative way to variable-oriented
methods.

## Installation

You can install the development version of cacc from
[GitHub](https://github.com/) with:

``` r
# Check if the`devtools` package needs to be installed
if (!require("devtools")) install.package("devtools")

# Install the `cacc` package from GitHub
devtools::install_github("amoneva/cacc")
```

## References

-   Hart, T. C. (2019). Identifying Situational Clustering and
    Quantifying Its Magnitude in Dominant Case Configurations: New
    Methods for Conjunctive Analysis. *Crime & Delinquency, 66*(1),
    143-159.
-   Hart, T. C., Rennison, C. M., & Miethe, T. D. (2017). Identifying
    Patterns of Situational Clustering and Contextual Variability in
    Criminological Data: An Overview of Conjunctive Analysis of Case
    Configurations. *Journal of Contemporary Criminal Justice, 33*(2),
    112–120. <https://doi.org/10.1177/1043986216689746>
-   Miethe, T. D., Hart, T. C., & Regoeczi, W. C. (2008). The
    Conjunctive Analysis of Case Configurations: An Exploratory Method
    for Discrete Multivariate Analyses of Crime Data. *Journal of
    Quantitative Criminology, 24*, 227–241.
    <https://doi.org/10.1007/s10940-008-9044-8>
