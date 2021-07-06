#' Fit an integered-valued GARCH time series iZIP Model
#'
#' The function tsglm.izip is used to fit an iZIP integer-valued INGARCH model with identity link. The estimation is done by qausi-likelihood approach based on the Poisson likelihood function.
#' @param formula an object of class 'formula': a symbolic description of the response and exogenous regressors.
#' @param data an optional data frame containing the variables in the model
#' @param past_mean_lags numeric vector: integer vector giving the previous conditional means to be regressed on. If omitted, or of length zero, there will be no regression on previous observations.
#' @param past_obs_lags numeric vector: integer vector giving the previous observations to be regressed on (autoregression). If omitted, or of length zero, there will be no regression on previous conditional means.
#' @param ref.lambda the rate of a Poisson distribution that baseline zero-inflated odds based on.
#' @param ... additional arguments to be passed to the lower level fitting function tsglm. See ?tscount::tsglm for more details.
#'
#' @details
#' Fit an integered-valued GARCH time series iZIP Model.
#'
#' The model is
#'
#' \deqn{Y_i ~ ZIP_{\nu}(\mu_i | \lambda = \lambda_{ref}),}
#'
#' where
#'
#' \deqn{E(Y_i) = \mu_i = x_i^T \beta + \alpha_1\mu_{t-1} + \ldots + \alpha_s\mu_{t-s} + \beta_1Y_{t-1} + \ldots + \beta_q Y_{t-q},}
#'
#' \eqn{x_i} are some covariates.
#'
#' \eqn{\nu \ge 0} is the baseline zero-inflated odds relative to a Poisson with
#' rate \eqn{\lambda_{ref}}.
#'
#' @return
#' A fitted model object of class \code{tsizip} similar to one obtained from \code{tsglm}.
#'
#' The function \code{summary} (i.e., \code{\link{summary.tsizip}}) can be used to obtain
#' and print a summary of the results.
#'
#' The functions \code{plot} (i.e., \code{\link{plot.tsizip}}) and
#' \code{autoplot} can be used to produce a range
#' of diagnostic plots.
#'
#' The generic assessor functions \code{coef} (i.e., \code{\link{coef.tsizip}}),
#' \code{logLik} (i.e., \code{\link{logLik.tsizip}})
#' \code{fitted} (i.e., \code{\link{fitted.tsizip}}),
#' \code{nobs} (i.e., \code{\link{nobs.tsizip}}),
#' \code{AIC} (i.e., \code{\link{AIC.tsizip}}) and
#' \code{residuals} (i.e., \code{\link{residuals.tsizip}})
#' can be used to extract various useful features of the value
#' returned by \code{tsglm.izip}.
#'
#' An object class 'tsizip' is a list containing at least the following components:
#'
#' \item{coefficients}{a named vector of coefficients}
#' \item{stderr}{robust standard errors (using the sandwich estimators)}
#' \item{residuals}{the \emph{response} residuals (i.e., observed-fitted)}
#' \item{fitted_values}{the fitted mean values}
#' \item{y}{the \code{y} vector used.}
#' \item{X}{the model matrix for mean}
#' \item{model}{the model frame for regression}
#' \item{call}{the matched call}
#' \item{formula}{the formula supplied for regression}
#' \item{terms}{the \code{terms} object used for regression}
#' \item{data}{the \code{data} argument}
#'
#' @references
#' Huang, A. and Fung, T. (2020). Zero-inflated Poisson exponential families, with applications to time-series modelling of counts.

#' @importFrom tscount tsglm
#' @importFrom VGAM lambertW
#' @importFrom stringr str_length str_locate str_sub
#' @export
#'
#' @examples
#' data(arson)
#' M_arson <- tsglm.izip(arson ~ 1, past_mean_lags = 1, past_obs_lags = c(1, 2))
#' summary(M_arson)
#' plot(M_arson) # or autoplot(M_arson)
tsglm.izip <- function(formula, past_mean_lags = 1,
                       past_obs_lags = 1, data,
                       ref.lambda = NULL, ...) {
  call <- match.call()
  mf <- match.call(expand.dots = FALSE)
  m <- match(c("formula"), names(mf), 0L)
  if (is.null(formula)) {
    stop("formula must be specified (can not be NULL)")
  }
  if (missing(data)) {
    data <- environment(formula)
  }
  mf <- mf[c(1L, m)]
  mf$drop.unused.levels <- TRUE
  mf[[1L]] <- as.name("model.frame")
  mf <- eval(mf, parent.frame())
  mt <- attr(mf, "terms")
  y <- model.response(mf)
  X <- model.matrix(formula, mf)
  temp_W.E <-
    tryCatch.W.E(tscount::tsglm(y,
      model = list(
        past_obs = past_obs_lags,
        past_mean = past_mean_lags
      ),
      xreg = delete.intercept(X), ...
    ))
  temp_value <- temp_W.E$value
  mu <- fitted(temp_value)
  delta <- coef(temp_value)
  rsq <- length(delta)
  if (is.null(ref.lambda)) {
    ref.lambda <- mean(y)
  }
  logziplik <- function(log.odds) {
    # pre-compute quantities for efficiency
    odds <- exp(log.odds)
    theta <- log(mu + VGAM::lambertW(odds * exp(ref.lambda - mu) * mu)) - log(ref.lambda)
    lambda <- ref.lambda * exp(theta)
    p_theta <- odds / (odds + exp(-ref.lambda + lambda))
    # the negative log likelihood function
    # loglikelihoods contributions for the zero observations
    loglikzero <- (y == 0) * log(p_theta + (1 - p_theta) * exp(-lambda))
    # loglikelihood contributions for the non-zero observations
    logliknonzero <- (y > 0) * (log(1 - p_theta) - lambda + y * log(lambda) - lgamma(y + 1))
    loglik <- -sum(loglikzero + logliknonzero)
    return(loglik)
  }
  lm1 <- stats::optim(0, logziplik,
    method = "BFGS",
    control = list(maxit = 100000), hessian = TRUE
  )
  log.odds <- lm1$par
  n <- length(y)
  odds <- exp(log.odds)
  theta <- log(mu + VGAM::lambertW(odds * exp(ref.lambda - mu) * mu)) - log(ref.lambda)
  lambda <- ref.lambda * exp(theta)
  p_theta <- odds / (odds + exp(-ref.lambda + lambda))
  var_hat <- mu + mu^2 * p_theta / (1 - p_theta)
  sd_hat <- sqrt(var_hat)
  s <- length(past_obs_lags)
  q <- length(past_mean_lags)
  r <- rsq - s - q
  if (s > 0 & q <= 0) {
    msq <- past_obs_lags[s]
  } else if (s <= 0 & q > 0) {
    msq <- past_mean_lags[q]
  } else {
    msq <- max(past_obs_lags[s], past_mean_lags[q])
  }
  nmsq <- n + msq
  D_FS <- 0
  D_FS_robust <- 0
  mu_time <- c(rep(mean(mu), msq), mu)
  Y_time <- c(rep(0, msq), y)
  dmudcovariates_time <- matrix(0, nrow = r, ncol = nmsq)
  dmudcovariates_time[, 1:msq] <- matrix(1, nrow = r, ncol = msq) / (1 - sum(delta[(r + 1):rsq]))
  if (s > 0) {
    dmudpast_obs_time <- matrix(0, nrow = s, ncol = nmsq)
    dmudpast_obs_time[, 1:msq] <- matrix(1, nrow = s, ncol = msq) / (1 - sum(delta[(r + 1):rsq]))^2
  }
  if (q > 0) {
    dmudpast_means_time <- matrix(0, nrow = q, ncol = nmsq)
    dmudpast_means_time[, 1:msq] <- matrix(1, nrow = q, ncol = msq) / (1 - sum(delta[(r + 1):rsq]))^2
  }

  for (t in 1:n) {
    if (s > 0 & q > 0) {
      dmudcovariates_time[, msq + t] <- t(X[t, ])
      for (i in 1:s) {
        dmudpast_obs_time[i, msq + t] <- Y_time[msq + t - past_obs_lags[i]]
      }
      for (i in 1:q) {
        dmudpast_means_time[i, msq + t] <- mu_time[msq + t - past_mean_lags[i]]
      }
      for (i in 1:q) {
        dmudcovariates_time[, msq + t] <- dmudcovariates_time[, msq + t] +
          delta[r + s + i] * dmudcovariates_time[, msq + t - past_mean_lags[i]]
        dmudpast_obs_time[, msq + t] <- dmudpast_obs_time[, msq + t] +
          delta[r + s + i] * dmudpast_obs_time[, msq + t - past_mean_lags[i]]
        dmudpast_means_time[, msq + t] <- dmudpast_means_time[, msq + t] +
          delta[r + s + i] * dmudpast_means_time[, msq + t - past_mean_lags[i]]
      }
      temp <- c(
        dmudcovariates_time[, msq + t], dmudpast_obs_time[, msq + t],
        dmudpast_means_time[, msq + t]
      )
    } else if (s > 0 & q <= 0) {
      dmudcovariates_time[, msq + t] <- t(X[t, ])
      for (i in 1:s) {
        dmudpast_obs_time[i, msq + t] <- Y_time[msq + t - past_obs_lags[i]]
      } # past obs parameters/ no past means parameters
      temp <- c(dmudcovariates_time[, msq + t], dmudpast_obs_time[, msq + t])
    } else {
      dmudcovariates_time[, msq + t] <- t(X[t, ])
      for (i in 1:q) {
        dmudpast_means_time[i, msq + t] <- mu_time[msq + t - past_mean_lags[i]]
      }
      for (i in 1:q) {
        dmudcovariates_time[, msq + t] <- dmudcovariates_time[, msq + t] +
          delta[r + i] * dmudcovariates_time[, msq + t - past_mean_lags[i]]
        dmudpast_means_time[, msq + t] <- dmudpast_means_time[, msq + t] +
          delta[r + i] * dmudpast_means_time[, msq + t - past_mean_lags[i]]
      }
      temp <- c(dmudcovariates_time[, msq + t], dmudpast_means_time[, msq + t])
    }
    D_FS <- D_FS + 1 / (mu[t]) * (temp %*% t(temp))
    D_FS_robust <- D_FS_robust + var_hat[t] / (mu[t])^2 *
      (temp %*% t(temp))
  }
  vcov_delta <- solve(D_FS) %*% D_FS_robust %*% solve(D_FS)
  stderr <- sqrt(diag(vcov_delta))
  # stderr <- sqrt(diag(solve(D_FS) %*% D_FS_robust %*% solve(D_FS)))
  output <- list()
  output$call <- call
  output$formula
  output$terms <- mt
  output$model <- mf
  output$coefficients <- delta
  output$pi <- odds / (1 + odds)
  output$nu <- odds
  output$ref.lambda <- ref.lambda
  output$logLik <- -lm1$value
  output$fitted_values <- mu
  output$fitted_zero <- p_theta
  output$y <- y
  output$X <- X
  output$nobs <- n
  output$residuals <- y - mu
  output$stderr <- stderr
  output$vcov <- vcov_delta
  output$aic <- -2 * output$log.lik + 2 * (length(delta) + 1)
  output$bic <- -2 * output$log.lik + log(n) * (length(delta) + 1)
  output$convergence <- NULL
  class(output) <- "tsizip"
  if (!is.null(temp_W.E$warning)) {
    st_length <- stringr::str_length(as.character(temp_W.E$warning))
    st_start <- as.numeric(stringr::str_locate(as.character(temp_W.E$warning), ":")[1, 1]) + 1
    warning(stringr::str_sub(as.character(temp_W.E$warning),
      start = st_start, end = st_length - 1
    ))
  }
  return(output)
}
