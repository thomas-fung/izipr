% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summarize_extract.R
\name{glance.izip}
\alias{glance.izip}
\alias{glance.tsizip}
\title{Glance at a(n) iZIP model object}
\usage{
\method{glance}{izip}(x, ...)

\method{glance}{tsizip}(x, ...)
}
\arguments{
\item{x}{an object class 'izip' object, obtained from a call to \code{glm.izip}}

\item{...}{other arguments passed to or from other methods  (currently unused).}
}
\value{
For an 'izip' object, a \code{tibble::tibble()} with exactly one row and columns:
\item{AIC}{Akaike's Information Criterion for the model.}
\item{BIC}{Bayesian Information Criterion for the model.}
\item{deviance}{(Residual) Deviance of the model.}
\item{df.null}{Degrees of freedom used by the null model.}
\item{df.residual}{Residual degrees of freedom.}
\item{logLik}{The log-likelihood of the model.}
\item{nobs}{Number of observations used.}
\item{null.deviance}{Deviance of the null model.}

For an 'tsizip' object, a \code{tibble::tibble()} with exactly one row and columns:
\item{AIC}{Akaike's Information Criterion for the model.}
\item{BIC}{Bayesian Information Criterion for the model.}
\item{logLik}{The log-likelihood of the model.}
\item{nobs}{Number of observations used.}
}
\description{
Glance accepts a model object and returns a \code{tibble::tibble()} with exactly one row of model summaries. The summaries are typically goodness of fit measures, p-values for hypothesis tests on residuals, or model convergence information.
}
\details{
Glance never returns information from the original call to the modeling function. This includes the name of the modeling function or any arguments passed to the modeling function.

Glance does not calculate summary measures. Rather, it farms out these computations to appropriate methods and gathers the results together. Sometimes a goodness of fit measure will be undefined. In these cases the measure will be reported as NA.

Glance returns the same number of columns regardless of whether the model matrix is rank-deficient or not. If so, entries in columns that no longer have a well-defined value are filled in with an NA of the appropriate type.
}
\examples{
data(bioChemists)
M_bioChem <- glm.izip(art ~ ., data = bioChemists)
glance(M_bioChem)

data(arson)
M_arson <- tsglm.izip(arson ~ 1, past_mean_lags = 1, past_obs_lags = c(1, 2))
glance(M_arson)
}
