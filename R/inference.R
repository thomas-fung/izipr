#' Likelihood Ratio Test for nested iZIP models
#'
#' Perform a likelihood ratio chi-squared test between nested iZIP models.
#' The test statistics is calculated as \emph{2*(llik- llik_0)}. The test statistics
#' has degrees of freedom \emph{r} where \emph{r} is the difference in the number of
#' parameters between the full and null models.
#'
#'
#' @param object1 an object class 'izip', obtained from a call to \code{glm.izip}
#' @param object2 an object class 'izip', obtained from a call to \code{glm.izip}
#' @param digits numeric; minimum number of significant digits to be used for most numbers.
#' @import stats
#' @export
#' @seealso \code{\link{glm.izip}}, \code{\link{update.izip}}
#' @examples
#' data(bioChemists)
#'
#' ## Fit full model
#' M_bioChem.full <- glm.izip(art ~ ., data = bioChemists)
#'
#' ## Fit null model; without phd
#' M.bioChem.null <- update(M_bioChem.full, . ~ . - phd)
#'
#' ## Likelihood ratio test for the nested models
#' iziplrtest(M_bioChem.full, M.bioChem.null) # order of objects is not important
iziplrtest <- function(object1, object2, digits = 3) {
  if (class(object1) != "izip") {
    stop("object1 must be an S3 object of class izip.")
  }
  if (class(object2) != "izip") {
    stop("object2 must be an S3 object of class izip.")
  }
  if (!(all(names(object1$coefficients) %in% names(object2$coefficients))) &&
    !all(names(object2$coefficients) %in% names(object1$coefficients))) {
    warning(paste0(
      "Neither models' coefficient names are subset of the other. ",
      "Please make sure the models are nested."
    ))
  }
  if (object1$nobs != object2$nobs) {
    stop("The models have a different number of observations.")
  }
  L1 <- object1$logLik
  L2 <- object2$logLik
  df <- length(object1$coefficients) - length(object2$coefficients)
  ttest <- 2 * (L1 - L2)
  if (df < 0) {
    ttest <- -ttest
    df <- -df
  }
  pval <- 1 - pchisq(ttest, df)
  if (pval < 2e-16) {
    pval <- "< 2e-16"
  } else {
    pval <- signif(pval, digits)
  }
  cat("\nLikelihood ratio test for testing both iZIP models are equivalent\n")
  cat("LRT-statistic: ", signif(ttest, digits), "\n")
  cat("Chi-sq degrees of freedom: ", df, "\n")
  cat("P-value: ", pval, "\n")
}

#' Update and Re-fit a iZIP Model
#'
#' \code{update} (i.e., \code{update.izip}) will update and (by-default) re-fit a model. It is
#' identical to \code{update} in the \code{stats} package.
#'
#' @param object an object class 'izip', obtained from a call to \code{glm.izip}.
#' @param formula. changes to the existing formula in \code{object} -- see \code{update.formula}
#' @param ... other arguments passed to or from other methods  (currently unused).
#' @param evaluate logical; if \code{TRUE} evaluate the new call otherwise simply return
#' the call
#' @import stats
#' @export
#' @seealso \code{\link{glm.izip}}, \code{\link{update.formula}}, \code{\link{iziplrtest}}.
#'
#' @examples
#'
#' # To update the regression formula
#' data(bioChemist)
#'
#' ## Fit full model
#' M_bioChem.full <- glm.izip(art ~ ., data = bioChemists)
#' M_bioChem.full
#'
#' ## Dropping phd
#' M.bioChem.null <- update(M_bioChem.full, . ~ . - phd)
#' M.bioChem.null
update.izip <- function(object, formula., ...,
                        evaluate = TRUE) {
  if (is.null(call <- getCall(object))) {
    stop("need an object with call component")
  }
  extras <- match.call(expand.dots = FALSE)$...
  fixFormulaObject <- function(object) {
    Terms <- terms(object)
    tmp <- attr(Terms, "term.labels")
    ind <- grep("|", tmp, fixed = TRUE)
    if (length(ind)) {
      tmp[ind] <- paste("(", tmp[ind], ")")
    }
    if (length(ind <- attr(Terms, "offset"))) {
      tmp2 <- as.character(attr(Terms, "variables"))[-1L]
      tmp <- c(tmp, tmp2[ind])
    }
    rhs <- if (length(tmp)) {
      paste(tmp, collapse = " + ")
    } else {
      "1"
    }
    if (!attr(Terms, "intercept")) {
      rhs <- paste(rhs, "- 1")
    }
    if (length(form <- formula(object)) > 2L) {
      res <- formula(paste("lhs ~", rhs))
      res[[2L]] <- form[[2L]]
      res
    }
    else {
      formula(paste("~", rhs))
    }
  }
  if (!missing(formula.)) {
    call$formula <- stats::update.formula(fixFormulaObject(object), formula.,
      data = call$data
    )
  }
  if (length(extras)) {
    existing <- !is.na(match(names(extras), names(call)))
    for (a in names(extras)[existing]) call[[a]] <- extras[[a]]
    if (any(!existing)) {
      call <- c(as.list(call), extras[!existing])
      call <- as.call(call)
    }
  }
  if (evaluate) {
    eval(call, parent.frame())
  } else {
    call
  }
}


#' Confidence Intervals for iZIP Model Parameters
#'
#' Computes confidence intervals for one or more parameters in a
#' fitted model.
#' @param object an object class 'izip' or 'tsizip', obtained from a call to \code{\link{glm.izip}} or \code{\link{tsglm.izip}}.
#' @param parm a specification of which parameters are to be given confidence intervals, either a vector of numbers or a vector of names (comparing to those provided by \code{\link{coef}()}) . If missing, all parameters are considered.
#' @param level the confidence level required.
#' @param ... other arguments passed to or from other methods  (currently unused).
#'
#' @return
#' A matrix (or vector) with columns giving lower and upper confidence limits for each parameter. These will be labelled as (1-level)/2 and 1 - (1-level)/2 in % (by default 2.5% and 97.5%).
#' @examples
#' data(bioChemists)
#' M_bioChem <- glm.izip(art ~ ., data = bioChemists)
#' confint(M_bioChem)
#' # 90% CI for 'ment' only
#' confint(M_bioChem, parm = "ment", level = 0.9)
#'
#' data(arson)
#' M_arson <- tsglm.izip(arson ~ 1, past_mean_lags = 1, past_obs_lags = c(1, 2))
#' confint(M_arson)
#' @name confint.izip
NULL

#' @rdname confint.izip
#' @export
confint.izip <- function(object, parm, level = 0.95, ...) {
  cf <- coef(object)
  ses <- object$stderr
  pnames <- names(ses) <- names(cf)
  if (missing(parm)) {
    parm <- pnames
  } else if (is.numeric(parm)) {
    parm <- pnames[parm]
  }
  a <- (1 - level) / 2
  a <- c(a, 1 - a)
  fac <- qnorm(a)
  pct <- format.perc(a, 3)
  ci <- array(NA_real_,
    dim = c(length(parm), 2L),
    dimnames = list(parm, pct)
  )
  ci[] <- cf[parm] + ses[parm] %o% fac
  ci
}



#' @rdname confint.izip
#' @export
confint.tsizip <- function(object, parm, level = 0.95, ...) {
  cf <- coef(object)
  ses <- object$stderr
  pnames <- names(ses) <- names(cf)
  if (missing(parm)) {
    parm <- pnames
  } else if (is.numeric(parm)) {
    parm <- pnames[parm]
  }
  a <- (1 - level) / 2
  a <- c(a, 1 - a)
  fac <- qnorm(a)
  pct <- format.perc(a, 3)
  ci <- array(NA_real_,
    dim = c(length(parm), 2L),
    dimnames = list(parm, pct)
  )
  ci[] <- cf[parm] + ses[parm] %o% fac
  ci
}
