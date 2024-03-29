% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summarize_extract.R
\name{model.matrix.izip}
\alias{model.matrix.izip}
\alias{model.matrix.tsizip}
\title{Extract the Design Matrix from a iZIP Model Fit}
\usage{
\method{model.matrix}{izip}(object, ...)

\method{model.matrix}{tsizip}(object, ...)
}
\arguments{
\item{object}{an object class 'izip' or 'tsizip' object, obtained from a call to \code{glm.izip} or \code{tsglm.izip}.}

\item{...}{other arguments passed to or from other methods  (currently unused).}
}
\value{
The method will return the saved \code{\link{model.matrix}} used when fitting the iZIP model.
}
\description{
Extract the Design Matrix from a iZIP Model Fit
}
\examples{
data(bioChemists)
M_bioChem <- glm.izip(art ~ ., data = bioChemists)
model.matrix(M_bioChem)
}
