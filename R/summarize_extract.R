#' Extract iZIP Model Residuals
#'
#' \code{residuals} is a generic function which extracts model residuals from objects
#' returned by the modelling function \code{glm.izip}. \code{resid} is an alias for
#' \code{residuals} .
#'
#' @param object an object class 'izip', obtained from a call to \code{glm.izip}.
#' @param type the \code{type} of residuals which should be returned. The alternatives are:
#' 'deviance' (default), 'pearson' and 'response'. Can be abbreviated.
#' @param ... other arguments passed to or from other methods  (currently unused).
#' @export
#' @return
#' Residuals extracted from the object \code{object}.
#' @seealso
#' \code{\link{coef.izip}}, \code{\link{fitted.izip}}, \code{\link{glm.izip}}
residuals.izip <- function(object, type = c("deviance", "pearson", "response"), ...) {
  type <- match.arg(type)
  y <- object$y
  mu <- object$fitted_values
  nu <- object$nu
  p <- object$fitted_zero
  res <- switch(type,
                deviance = object$d_res,
                pearson = (y - mu) / sqrt(mu + mu^2 * p / (1-p)),
                response = y - mu
  )
  return(res)
}

#' Extract the (Maximized) Log-Likelihood from an iZIP Model Fit
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

#' Extract the Number of Observation from an iZIP Model Fit
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

#' Extract Fitted Values from an iZIP Model Fit
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

#' Extract the Model Frame from an iZIP Model Fit
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

#' Extract Model Coefficients from an iZIP Model Fit
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

#' Summarizing a iZIP Model Fit
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
#' Print Values of iZIP Model
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


#' iZIP Regression Diagnostic
#'
#' This suite of functions provides the basic quantities which are used in forming a wide variety of diagnostics for checking the quality of regression fits.
#'
#' @param model an object class 'izip', obtained from a call to \code{\link{glm.izip}}.
#' @param infl influence structure as returned by \code{\link{influence}}, only for  \code{\link{rstudent}} and \code{\link{cooks.distance}}.
#' @param type type of residuals for \code{\link{rstandard}}. The alternatives are: 'deviance' (default), and 'pearson'.
#' @param res residuals, with proper default.
#' @param hat hat values \eqn{H[i,i]}, see default.
#' @param ... other arguments passed to or from other methods  (currently unused).
#'
#' @examples
#' data(bioChemists)
#' M_bioChem <- glm.izip(art~ ., data=bioChemists)
#' influence(M_bioChem)
#' hatvalues(M_bioChem)
#' rstandard(M_bioChem, type = "pearson")
#' cooks.distance(M_bioChem)
#' @name regression.diagnostic.izip
NULL


#' @rdname regression.diagnostic.izip
#' @export
influence.izip <- function(model, ...) {
  out <- list()
  out$hat <- model$leverage
  out$dev_res <- residuals.izip(model, type = "deviance")
  out$pear_res <- residuals.izip(model, type = "pearson")
  return(out)
}


#' @rdname regression.diagnostic.izip
#' @export
hatvalues.izip <- function(model, ...) {
  model$leverage
}

#' @rdname regression.diagnostic.izip
#' @export
rstandard.izip <- function(model, infl = influence.izip(model),
                          type = c("deviance", "pearson"), ...) {
  type <- match.arg(type)
  res <- switch(type,
                pearson = infl$pear_res,
                infl$dev_res
  )
  res <- res / sqrt(1 - infl$hat)
  res[is.infinite(res)] <- NaN
  res
}

#' @rdname regression.diagnostic.izip
#' @export
cooks.distance.izip <- function(model, infl = influence(model),
                               res = infl$pear_res,
                               hat = infl$hat, ...) {
  rk <- model$rank
  h <- model$leverage
  std.pear <- res / sqrt(1 - h)
  cook <- (h * std.pear^2) / ((1 - h) * rk)
  cook[is.infinite(cook)] <- NaN
  return(cook)
}




#' Model Predictions for a \code{iZIP} Object
#'
#' This is a function for obtaining predictions and optionally estimates standard
#' errors of those prediction from a fitted iZIP regression object.
#'
#' @param object an object class 'izip', obtained from a call to \code{glm.izip}.
#' @param newdata optionally, a data frame in which to look for variables with which to
#' predict. If omitted, the fitted linear predictors are used.
#' @param se.fit logical; indicating if standard errors are required.
#' @param type the type of prediction required. The default is 'link' which is the scale
#' of the linear predictor i.e., a log scale; the alternative 'response' is on the scale
#' of the response variable. The value of this argument can be abbreviated.
#' @param ... other arguments passed to or from other methods  (currently unused).
#' @import stats
#' @export
#' @details
#' If newdata is omitted the predictions are based on the data used for the fit.
#' @return
#' If \code{se.fit = FALSE}, a vector of predictions.
#'
#' If \code{se.fit = TRUE}, a list with components
#' \item{fit}{Predictions, as for se.fit = FALSE.}
#' \item{se.fit}{Estimated standard errors.}
#' @examples
#' data(bioChemists)
#' M_bioChem <- glm.izip(art~ ., data=bioChemists)
#'
#' predict(M_bioChem)
#' predict(M_bioChem, type = "response")
#' predict(M_bioChem, se.fit = TRUE, type = "response")
#'
#' newdataframe <- data.frame(
#'    fem= "Women", mar = "Married", kid5 = 2,
#'    phd = 3, ment = 8
#' )
#' predict(M_bioChem, se.fit = TRUE, newdata = newdataframe, type = "response")
predict.izip <- function(object, newdata = NULL, se.fit = FALSE, type = c("link", "response"),
                        ...) {
  type <- match.arg(type)
  if (is.null(newdata)) {
    pred <- switch(type,
                   link = object$linear_predictors,
                   response = object$fitted_values
    )
    if (se.fit) {
      se <- switch(type,
                   link = sqrt(diag(object$X %*% object$vcov %*% t(object$X))),
                   response = sqrt(diag(object$X %*% object$vcov %*% t(object$X))) *
                     object$fitted_values
      )
      pred <- list(fit = pred, se.fit = se)
    }
  } else {
    mf <- model.frame(delete.response(object$terms),
                      data = newdata, xlev = object$xlevels)
    X <- model.matrix(delete.response(object$terms), mf,
                      contrasts.arg = object$contrasts)
    pred <- switch(type,
                   link = X %*% object$coefficients,
                   response = exp(X %*% object$coefficients)
    )
    if (se.fit) {
      se <- switch(type,
                   link =
                     sqrt(diag(X %*% object$vcov %*% t(X))),
                   response = sqrt(diag(X %*% object$vcov %*% t(X))) * pred
      )
      pred <- list(fit = t(pred)[1, ], se.fit = se)
    }
  }
  return(pred)
}


#' Extract the Design Matrix from a iZIP Model Fit
#'
#' @param object an object class 'izip' object, obtained from a call to \code{glm.izip}
#' @param ... other arguments passed to or from other methods  (currently unused).
#'
#' @return
#' The method will return the saved \code{\link{model.matrix}} used when fitting the iZIP model.
#' @export
#'
#' @examples
#' data(bioChemists)
#' M_bioChem <- glm.izip(art~ ., data=bioChemists)
#' model.matrix(M_bioChem)
model.matrix.izip <- function(object, ...) {
    return(object$X)
}

#' @importFrom generics glance
#' @export
generics::glance

#' @importFrom generics tidy
#' @export
generics::tidy

#' @importFrom generics augment
#' @export
generics::augment

#' Tidy a(n) iZIP model object
#'
#' Tidy summarizes information about the components of a model. A model component might be a single term in a regression, a single hypothesis, a cluster, or a class. Exactly what tidy considers to be a model component varies across models but is usually self-evident. If a model has several distinct types of components, you will need to specify which components to return.
#' @param x an object class 'izip' object, obtained from a call to \code{glm.izip}
#' @param conf.int Logical indicating whether or not to include a confidence interval in the tidied output. Defaults to FALSE.
#' @param conf.level The confidence level to use for the confidence interval if conf.int = TRUE. Must be strictly greater than 0 and less than 1. Defaults to 0.95, which corresponds to a 95 percent confidence interval.
#' @param exponentiate Logical indicating whether or not to exponentiate the the coefficient estimates.
#' @param ... other arguments passed to or from other methods  (currently unused).
#' @return
#' A \code{tibble::tibble()} with columns:
#' \item{term}{The name of the regression term.}
#' \item{estimate}{The estimated value of the regression term.}
#' \item{std.error}{The standard error of the regression term.}
#' \item{statistic}{The value of a test statistic to use in a hypothesis that the regression term is non-zero.}
#' \item{p.value}{The two-sided p-value associated with the observed statistic based on asymptotic normality.}
#' \item{parameter}{Only for varying dispersion models. Type of coefficient being estimated: 'mu', 'nu'}
#' \item{conf.low}{Lower bound on the confidence interval for the estimate.}
#' \item{conf.high}{Upper bound on the confidence interval for the estimate.}
#'
#' @export
#' @examples
#' data(bioChemists)
#' M_bioChem <- glm.izip(art~ ., data=bioChemists)
#' tidy(M_bioChem)
tidy.izip <- function(x, conf.int = FALSE, conf.level = 0.95,
                     exponentiate = FALSE, ...) {
  ret <- tibble::as_tibble(summary.izip(x)$coefficients,
                           rownames = "term"
  )
  colnames(ret) <- c(
      "term", "estimate", "std.error", "statistic",
      "p.value"
  )
  if (conf.int) {
    ci <- confint.izip(x, level = conf.level)
    ci <- tibble::as_tibble(ci, rownames = "term")
    colnames(ci) <- c("term", "conf.low", "conf.high")
    ret <- dplyr::left_join(ret, ci, by = "term")
      }
  if (exponentiate) {
    ret <- exponentiate(ret)
  }
  ret
}


#' Extracting the Variance-Covariance Matrix from a iZIP
#' Model Fit
#'
#' @param object an object class 'izip' object, obtained from a call to \code{glm.izip}
#' @param ... other arguments passed to or from other methods  (currently unused).
#'
#' @return
#' The method will return the estimated covariances between the parameter estimates of the fitted iZIP model.
#' @export
#'
#' @examples
#' data(bioChemists)
#' M_bioChem <- glm.izip(art~ ., data=bioChemists)
#' vcov(M_bioChem)
vcov.izip <- function(object, ...) {
    out <- object$vcov
  return(out)
}



#' Glance at a(n) iZIP model object
#'
#' Glance accepts a model object and returns a \code{tibble::tibble()} with exactly one row of model summaries. The summaries are typically goodness of fit measures, p-values for hypothesis tests on residuals, or model convergence information.
#'
#' Glance never returns information from the original call to the modeling function. This includes the name of the modeling function or any arguments passed to the modeling function.
#'
#' Glance does not calculate summary measures. Rather, it farms out these computations to appropriate methods and gathers the results together. Sometimes a goodness of fit measure will be undefined. In these cases the measure will be reported as NA.
#'
#' Glance returns the same number of columns regardless of whether the model matrix is rank-deficient or not. If so, entries in columns that no longer have a well-defined value are filled in with an NA of the appropriate type.
#' @param x an object class 'izip' object, obtained from a call to \code{glm.izip}
#' @param ... other arguments passed to or from other methods  (currently unused).
#'
#' @return
#'
#' A \code{tibble::tibble()} with exactly one row and columns:
#' \item{AIC}{Akaike's Information Criterion for the model.}
#' \item{BIC}{Bayesian Information Criterion for the model.}
#' \item{deviance}{(Residual) Deviance of the model.}
#' \item{df.null}{Degrees of freedom used by the null model.}
#' \item{df.residual}{Residual degrees of freedom.}
#' \item{logLik}{The log-likelihood of the model.}
#' \item{nobs}{Number of observations used.}
#' \item{null.deviance}{Deviance of the null model.}
#' @export
#'
#' @examples
#' data(bioChemists)
#' M_bioChem <- glm.izip(art~ ., data=bioChemists)
#' glance(M_bioChem)
glance.izip <- function(x, ...) {
  as_glance_tibble(
    null.deviance = x$null_deviance, df.null = x$df_null,
    logLik = as.numeric(logLik.izip(x)), AIC = AIC.izip(x),
    BIC = AIC.izip(x, k = log(x$nobs)),
    deviance = x$deviance,
    df.residual = x$df_residuals,
    nobs = x$nobs, na_types = "rirrrrii"
  )
}


#' Augment data with information from a(n) iZIP model object
#'
#' Augment accepts a model object and a dataset and adds information about each observation in the dataset. Most commonly, this includes predicted values in the .fitted column, residuals in the .resid column, and standard errors for the fitted values in a .se.fit column. New columns always begin with a . prefix to avoid overwriting columns in the original dataset.
#'
#' Users may pass data to augment via either the data argument or the newdata argument. If the user passes data to the data argument, it must be exactly the data that was used to fit the model object. Pass datasets to newdata to augment data that was not used during model fitting. This still requires that all columns used to fit the model are present.
#'
#' Augment will often behave differently depending on whether data or newdata is given. This is because there is often information associated with training observations (such as influences or related) measures that is not meaningfully defined for new observations.
#'
#' For convenience, many augment methods provide default data arguments, so that augment(fit) will return the augmented training data. In these cases, augment tries to reconstruct the original data based on the model object with varying degrees of success.
#'
#' The augmented dataset is always returned as a \code{tibble::tibble} with the __same number of rows__ as the passed dataset. This means that the passed data must be coercible to a tibble.
#'
#' We are in the process of defining behaviours for models fit with various na.action arguments, but make no guarantees about behaviour when data is missing at this time.
#'
#' @param x an object class 'izip' object, obtained from a call to \code{\link{glm.izip}}
#' @param data A base::data.frame or \code{tibble::tibble()} containing the original data that was used to produce the object x. Defaults to model.frame.izip(x) so that augment(my_fit) returns the augmented original data. __Do not__ pass new data to the data argument. Augment will report information such as influence and cooks distance for data passed to the data argument. These measures are only defined for the original training data.
#' @param newdata A \code{base::data.frame()} or \code{tibble::tibble()} containing all the original predictors used to create x. Defaults to NULL, indicating that nothing has been passed to newdata. If newdata is specified, the data argument will be ignored.
#' @param type.predict Passed to \code{\link{predict.izip}()} type argument. Defaults to \code{"link"}.
#' @param type.residuals Passed to \code{\link{residuals.izip}()} type arguments. Defaults to \code{"deviance"}.
#' @param se_fit Logical indicating whether or not a .se.fit column should be added to the augmented output. Defaults to \code{FALSE}.
#' @param ... Additional arguments. Not used. Needed to match generic signature only. Cautionary note: Misspelled arguments will be absorbed in ..., where they will be ignored. If the misspelled argument has a default value, the default value will be used. For example, if you pass conf.level = 0.9, all computation will proceed using conf.level = 0.95. Additionally, if you pass newdata = my_tibble to an augment() method that does not accept a newdata argument, it will use the default value for the data argument.
#'
#' @return
#' A \code{tibble::tibble()} with columns:
#' \item{.cooksd}{Cooks distance.}
#' \item{.fitted}{Fitted or predicted value.}
#' \item{.hat}{Diagonal of the hat matrix.}
#' \item{.resid}{The difference between observed and fitted values.}
#' \item{.se.fit}{Standard errors of fitted values.}
#' \item{.sigma}{Estimated residual standard deviation when corresponding observation is dropped from model.}
#' \item{.std.resid}{Standardised residuals.}

#' @export
#'
#' @examples
#' data(bioChemists)
#' M_bioChem <- glm.izip(art~ ., data=bioChemists)
#' augment(M_bioChem)
augment.izip <- function(x, data = model.frame.izip(x),
                        newdata = NULL,
                        type.predict = c("link", "response"),
                        type.residuals = c("deviance", "pearson", "response"),
                        se_fit = FALSE, ...) {
  type.predict <- rlang::arg_match(type.predict)
  type.residuals <- rlang::arg_match(type.residuals)
  df <- if (is.null(newdata)) {
    data
  } else {
    newdata
  }
  df <- as_augment_tibble(df)
  if (se_fit) {
    pred_obj <- predict.izip(x, newdata,
                            type = type.predict,
                            se.fit = TRUE
    )
    df$.fitted <- unname(pred_obj$fit)
    df$.se.fit <- unname(pred_obj$se.fit)
  }
  else {
    df$.fitted <- unname(predict(x, newdata, type = type.predict))
  }
  if (is.null(newdata)) {
    tryCatch(
      {
        infl <- influence.izip(x)
        df$.resid <- unname(residuals.izip(x, type = type.residuals))
        df$.std.resid <- unname(rstandard.izip(x, infl = infl, type = type.residuals))
        df$.hat <- unname(infl$hat)
        df$.cooksd <- unname(cooks.distance.izip(x, infl = infl))
      },
      error = data_error
    )
  }
  df
}


