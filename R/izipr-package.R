#' Interpretable Zero-inflated Poisson Regression
#'
#' @name compak-package
#' @aliases izipr
#' @docType package
#' @title Interpretable Zero-inflated Poisson Regression
#' @keywords package
#' @references
#' Huang, A., and Fung, T. (2021). \code{izipr}:
#' Interpretable Zero-inflated Poisson Regression. R package version 0.1
#'
#' Huang, A., and Fung, T. (2021). A consistent second-order discrete kernel smoother.
#' Under revision.
NULL

#' appleshoots data set
#'
#' This data set gives the root counts for propagated columnar apple shootrs, in which the shoots were cultured on different concentrations of the cytokinin BAP, in growth cabinets with an 8 or 16 hour photoperiod. The \code{appleshoots} data has 270 observations.
#'
#' @name appleshoots
#' @format A data frame with 270 observations on 4 variables.
#' \describe{
#' \item{roots}{number of roots per shoot}
#' \item{trtn}{number of shoots per treatment combination}
#' \item{photo}{photoperiod, 8 or 16}
#' \item{bap}{BAP concentration, numeric}
#' }
#' @docType data
#' @keywords datasets
#' @usage
#' data(appleshoots)
#' @source The \code{agridat} package
#' @references
#' Wright, K. (2021). agridat: Agricultural Datasets. R package version 1.18. https://CRAN.R-project.org/package=agridat
#'
#' Ridout, M. S., Hinde, J. P., and Demetrio, C. G. B. (1998). Models for Count Data with Many Zeros. Proceedings of the 19th International Biometric Conference, 179-192.
#'
#' SAS. Fitting Zero-Inflated Count Data Models by Using PROC GENMOD. support.sas.com/rnd/app/examples/stat/GENMODZIP/roots.pdf
#' @examples
#' ## For examples see example(glm.izip)
NULL

#' bioChemists data set
#'
#' This data set gives the number of article produced by a sample of 915 graduate students during the last 3 years of their biochemistry PhD program, along with some information on the graduates like gender, marital status (mar), the number of kids under 5 (kid5), how prestigious the PhD department is (phd) and the mentor’s publication record over the same period (ment). The \code{bioChemist} data has 915 observations.
#'
#' @name bioChemists
#' @format A data frame with 915 observations on 6 variables.
#' \describe{
#' \item{art}{count of articles produced during last 3 years of Ph.D.}
#' \item{fem}{factor indicating gender of student, with levels Men and Women}
#' \item{mar}{factor indicating marital status of student, with levels Single and Married}
#' \item{kid5}{number of children aged 5 or younger}
#' \item{phd}{prestige of Ph.D. department}
#' \item{ment}{count of articles produced by Ph.D. mentor during last 3 years}
#' }
#' @docType data
#' @keywords datasets
#' @usage
#' data(bioChemists)
#' @source The \code{pscl} package
#' @references
#' Jackman, S. (2020). pscl: Classes and Methods for R Developed in the Political Science Computational Laboratory. United States Studies Centre, University of Sydney. Sydney, New South Wales, Australia. R package version 1.5.5. URL https://github.com/atahk/pscl/
#'
#' Long, J. Scott. 1990. The origins of sex differences in science. Social Forces. 68(3):1297-1316.
#'
#' Long, J. Scott. 1997. Regression Models for Categorical and Limited Dependent Variables. Thousand Oaks, California: Sage.
#' @examples
#' ## For examples see example(glm.izip)
NULL


#' arson data set
#'
#' This data set gives the monthly counts of arson in the 13th police car beat plus in Pittsburgh PA, USA, starting from January 1990 to December 2001. We have 144 observations in which 61 of them, or 42.4%, are zeros.
#' @name arson
#' @format A vector of 144 observations.
#' @docType data
#' @keywords datasets
#' @usage
#' data(arson)
#' @source https://www.icpsr.umich.edu/icpsrweb/NACJD
#' @references
#' Zhu, F. (2012) Zero-inflated poisson and negative binomial integer-valued garch models. Journal of Statistical Planning and Inference, 142, 826–839.
#' @examples
#' ## For examples see example(tsglm.izip)
NULL

## quiets concerns of R CMD check re: the .'s that appear in pipelines
if (getRversion() >= "2.15.1") utils::globalVariables(c("."))
