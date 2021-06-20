% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/graphics_related.R
\name{nrPIT}
\alias{nrPIT}
\alias{PredProb.izip}
\alias{PIT.izip}
\title{Non-randomized Probability Integral Transform}
\usage{
PredProb.izip(object)

PIT.izip(object, bins = 10)
}
\arguments{
\item{object}{an object class "izip", obtained from a call to \code{glm.izip}.}

\item{bins}{numeric; the number of bins shown in the PIT histogram or the
PIT Q-Q plot.}
}
\value{
\code{compPredprob} returns a list with values:
\item{upper}{the predictive cumulative probabilities used as the upper bound for
computing the non-randomized PIT.}
\item{lower}{the predictive cumulative probabilities used as the upper bound for
computing the non-randomized PIT.}

\code{izipPIT} returns a list with values:
\item{conditionalPIT}{the conditional probability integral transformation given the
observed counts.}
\item{PIT}{the probability integral transformation.}
}
\description{
Functions to produce the non-randomized probability integral transform (PIT) to check the
adequacy of the distributional assumption of the iZIP model. The majority of the
code and descriptions are taken from Dunsmuir and Scott (2015).
}
\details{
These functions are used to obtain the predictive probabilities and the probability
integral transform for a fitted COM-Poisson model. The majority of the code and
descriptions are taken from Dunsmuir and Scott (2015).
}
\examples{
data(takeoverbids)
M.bids <- glm.cmp(numbids ~ leglrest + rearest + finrest + whtknght
    + bidprem + insthold + size + sizesq + regulatn, data=takeoverbids)
izipPredProb(M.bids)
izipPIT(M.bids)
}
\references{
Czado, C., Gneiting, T. and Held, L. (2009). Predictive model assessment
for count data. \emph{Biometrics}, \strong{65}, 1254--1261.

Dunsmuir, W.T.M. and Scott, D.J. (2015). The \code{glarma} Package for Observation-Driven
Time Series Regression of Counts. \emph{Journal of Statistical Software},
\strong{67}, 1--36.
}