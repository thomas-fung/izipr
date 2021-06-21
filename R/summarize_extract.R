#' Extract the (Maximized) Log-Likelihood from an izip Model Fit
#'
#' An accessor function used to extract the (maximized) log-likelihood from a 'izip' object.
#' @param object an object of class 'izip' object, obtained from a call to \code{glm.izip}
#' @param ... other arguments passed to or from other methods  (currently unused).
#' @param x an object of class 'logLik.izip', obtained from a call to \code{logLik.izip}.
#' @export
#' @seealso
#' \link{coef.izip}, \link{fitted.izip}, \link{glm.izip}
#'
#' @name logLik.izip
logLik.izip <- function(object,...)
{ out <- object$logLik
  attr(out, "df") <- length(object$coefficients)+1
  class(out) <- "logLik.izip"
  return(out)}

#' @rdname logLik.izip
print.logLik.izip <- function(x,...){
  cat("'log Lik. ' ", x, " (df=", attr(x,"df"),")",sep="")
}

#' Extract the Number of Observation from an izip Model Fit
#'
#' An accessor function used to extract the number of observation from a 'izip' object.
#'
#' @param object an object class 'izip' object, obtained from a call to \code{glm.izip}
#' @param ... other arguments passed to or from other methods  (currently unused).
#' @return
#' The number of observations extracted from the object \code{object}.
#' @seealso
#' \code{\link{coef.izip}}, \code{\link{fitted.izip}}, \code{\link{glm.izip}}
#' @export
nobs.izip <- function(object, ...)
{ return(object$nobs)}

#' Akaike's Information Criterion
#'
#' A function calculating Akaike's Information Criterion (AIC) based on the log-likelihood
#' value extracted from \code{\link{logLik.izip}}, according to the formula
#' \emph{-2*log-likelihood + k*npar}, where \emph{npar} represents the number of parameters
#' in the fitted model, and \emph{k=2} for the usual AIC or \emph{k=log(n)} (\emph{n} being
#' the number of observations) for the so-called BIC (Bayesian Information Criterion).
#'
#' @param object an object class 'izip' object, obtained from a call to \code{glm.izip}
#' @param ... other arguments passed to or from other methods  (currently unused).
#' @param k numeric: the \emph{penalty} per parameter to be used; the default
#' k = 2 is the classical AIC.
#' @details
#' When comparing models fitted by maximum likelihood to the same data, the smaller the AIC or
#' BIC, the better the fit.
#' @return
#' A numeric value with the corresponding AIC (or BIC, or ..., depends on k).
#' @seealso
#' \link{logLik.izip}, \link{nobs.izip}, \link{glm.izip}
#' @export
AIC.izip <- function(object, ..., k = 2){
  temp <- logLik.izip(object)
  aic <- -2*as.numeric(temp)+k*attr(temp,"df")
  return(aic)
}

#' Extract Fitted Values from an izip Model Fit
#'
#' An accessor function used to extract the fitted values from a 'izip' object.
#' \code{fitted.values} is an alias for \code{fitted}.
#'
#' @param object an object class 'izip' object, obtained from a call to \code{glm.izip}
#' @param ... other arguments passed to or from other methods  (currently unused).
#' @return
#' Fitted values \code{mu} extracted from the object \code{object}.
#' @seealso
#' \link{coef.izip}, \link{residuals.izip}, \link{glm.izip}.
#' @export
fitted.izip <- function(object, ...){
  return(object$fitted_values)
}

#' Extract the Model Frame from an izip Model Fit
#'
#' An accessor function used to extract the model frame from a 'izip' object.
#'
#' @param formula an object class 'izip' object, obtained from a call to \code{glm.izip}
#' @param ... other arguments passed to or from other methods  (currently unused).
#' @return
#' The method will return the saved \code{\link{data.frame}} used when fitting the izip model.
#' @seealso
#' \link{coef.izip}, \link{residuals.izip}, \link{glm.izip}.
#' @export
model.frame.izip <- function(formula, ...){
  return(formula$model)
}

#' Extract Model Coefficients from an izip Model Fit
#'
#' An function used to extract model coefficients from a 'izip' object.
#' \code{coefficients} is an alias for \code{coef}.
#'
#' @param object an object class 'izip' object, obtained from a call to \code{glm.izip}
#' @param ... other arguments passed to or from other methods  (currently unused).
#'
#' @return
#' Coefficients extracted from the object \code{object}.
#' @seealso
#' \link{fitted.izip}, \link{residuals.izip}, \link{glm.izip}.
#' @export
coef.izip <- function(object, ...){
  return(object$coefficients)
}

#' Summarizing a izip Model Fit
#'
#' \code{summary} method for class \code{izip}.
#'
#' @param object an object class 'izip', obtained from a call to \code{glm.izip}.
#' @param x a result of the \emph{default} method of \code{summary()}.
#' @param digits numeric; minimum number of significant digits to be used for most numbers.
#' @param signif.stars logical. If TRUE, ‘significance stars’ are printed for each coefficient.
#' @param ... other arguments passed to or from other methods  (currently unused).
#' @details
#' \code{print.summary.izip} tries to be smart about formatting the coefficients, standard errors
#' and gives 'significance stars'. The \code{coefficients} component of the result gives the
#' estimated coefficients and their estimated standard errors, together with their ratio. This
#' third column is labelled as \code{Z value} as the dispersion is fixed for this family. A
#' forth column gives the two-tailed p-value corresponding to \code{Z value} based on
#' the asymptotic Normal reference distribution.
#'
#' @return
#' \code{summary.izip} returns an object of class "summary.izip", a list containing at least the following components:
#' \item{call}{the component from object.}
#' \item{family}{the component from object.}
#' \item{deviance; residual_deviance}{the component from object.}
#' \item{df_residual}{the component from object.}
#' \item{df_null}{the component from object.}
#' \item{null_deviance}{the component from object.}
#' \item{deviance_resid}{the deviance residuals: see residuals.izip.}
#' \item{coefficients}{the matrix of coefficients, standard errors, z-values and p-values.}
#' \item{df}{a 3-vector of the rank of the model and the number of residual degrees of freedom, plus number of coefficients.}
#'
#' @seealso
#' \link{coef.izip}, \link{fitted.izip}, \link{glm.izip}.
#' @examples
#' ## For examples see example(glm.izip)
#' @name summary.izip
NULL

#' @rdname summary.izip
#' @export
summary.izip <- function(object, ...){
    estimate <- object$coefficients
    std.error <- object$stderr
    statistic <- estimate/std.error
    p.value <- 2*pnorm(-abs(statistic))
    coef.table <- cbind(estimate, std.error, statistic, p.value)
    dimnames(coef.table) <- list(names(estimate),
                                 c("Estimate", "Std.Err", "Z value", "Pr(>|z|)"))
  keep <- match(c("call", "terms", "nu", "ref.lambda",
                  "family", "residual_deviance", "deviance",
                 "contrasts", "df_residuals", "null_deviance",
                 "df_null", "iter", "na.action"), names(object),
                0L)
  ans <- c(object[keep],
           list(deviance_resid =
                  residuals(object, type = "deviance"),
           coefficients = coef.table,
           df = c(object$rank, object$df_residuals,
                  length(object$coefficients)),
           aic = AIC.izip(object),
           bic = AIC.izip(object, k = log(nobs.izip(object))),
           coef.table = coef.table))
  class(ans) <- "summary.izip"
  return(ans)
}


#' @rdname summary.izip
#' @export
print.summary.izip <- function(x, digits = max(3, getOption("digits") - 3),
                              signif.stars = getOption("show.signif.stars"), ...) {
  cat("\nCall: ", paste(deparse(x$call), sep = "\n", collapse = "\n"),
      "\n", sep = "")
  cat("\nDeviance Residuals:" , "\n")
  if (x$df_residuals > 5) {
    residuals_dev = setNames(quantile(x$deviance_resid, na.rm = TRUE),
                             c("Min", "1Q", "Median", "3Q", "Max"))
  }
  xx <- zapsmall(residuals_dev, digits + 1L)
  print.default(xx, digits = digits, na.print = "", print.gap = 2L)
    cat("\nLinear Model Coefficients:\n")
    printCoefmat(x$coefficients, digits = digits,
                 signif.stars = signif.stars,
                 na.print = "NA", ...)
    cat("\n(Baseline zero-inflation odds for iZIP estimated to be ",
        signif(x$nu, digits), ")\n", sep = "")
    cat("\n(The baseline Poisson rate for iZIP is set at ",
        signif(x$ref.lambda, digits), ")\n\n", sep = "")
  cat("\n", apply(cbind(paste(format(c("Null", "Residual"), justify = "right"), "deviance:"),
                        format(unlist(x[c("null_deviance","residual_deviance")]),
                               digits = max(5L, digits + 1L)), " on",
                        format(unlist(x[c("df_null", "df_residuals")])),
                        "degrees of freedom\n"),
                  1L, paste, collapse = " "), sep = "")
  cat("\nAIC:", format(x$aic), "\n\n")
}

#'
#' Print Values of izip Model
#'
#' \code{print} method for class \code{izip}.
#'
#' @param x an object class 'izip', obtained from a call to \code{glm.izip}.
#' @param ... other arguments passed to or from other methods  (currently unused).
#' @export
#' @details
#' \code{print.izip} can be used to print a short summary of object class 'izip'.
#'
#' @seealso
#' \link{summary.izip}, \link{coef.izip}, \link{fitted.izip}, \link{glm.izip}.
#' @examples
#' ## For examples see example(glm.izip)

print.izip <- function(x,...)
{
  cat("\nCall: ", paste(deparse(x$call), sep = "\n", collapse = "\n"),
      "\n", sep = "")
  cat("\nLinear Model Coefficients:\n")
  print.default(format(signif(x$coefficients,5)), print.gap = 2,quote = FALSE)
  cat("\nBaseline Zero-inflation odds (nu):", signif(x$nu, 3))
  cat("\nDegrees of Freedom:", x$df_null, "Total (i.e. Null); ",
      x$df_residuals, "Residual")
  cat("\nNull Deviance:", x$null_deviance, "\nResidual Deviance:",
      x$residuals_deviance, "\nAIC:", format(AIC(x)), "\n\n")
}


