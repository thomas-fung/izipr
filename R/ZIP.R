#' Fit an interpretable Zero-Inflated Poisson Generalized Linear Model
#'
#' The function \code{glm.izip} is used to fit an interpretable zero-inflated Poisson
#' generalized linear model with a log-link.
#' @param formula an object of class 'formula': a symbolic description of the model to be fitted to the mean via log-link.
#' @param data an optional data frame containing the variables in the model
#' @param ref.lambda the rate of a Poisson distribution that baseline zero-inflated odds based on.
#' @param offset this can be used to specify an *a priori* known component to be included
#' @param subset an optional vector specifying a subset of observations to be used in the
#' fitting process.
#' @param contrast optional lists. See the contrasts.arg of model.matrix.default.
#' @param na.action a function which indicates what should happen when the data contain
#' NAs. The default is set by the na.action setting of options, and is na.fail if that
#' is unset. The ‘factory-fresh’ default is na.omit. Another possible value is NULL,
#' no action. Value na.exclude can be useful.
#' @details
#' Fit an interpretable zero-inflated Poisson regression using maximum likelihood estimation.
#'
#' The model is
#'
#' \deqn{Y_i ~ ZIP_{\nu}(\mu_i | \lambda = \lambda_{ref}),}
#'
#' where
#'
#' \deqn{E(Y_i) = \mu_i = exp(x_i^T \beta),}
#'
#' \eqn{x_i} are some covariates.
#'
#' \eqn{\nu \ge 0} is the baseline zero-inflated odds relative to a Poisson with
#' rate \eqn{\lambda_{ref}}.
#'
#' @return
#' A fitted model object of class \code{izip} similar to one obtained from \code{glm}
#' or \code{glm.nb}.
#'
#' The function \code{summary} (i.e., \code{\link{summary.izip}}) can be used to obtain
#' and print a summary of the results.
#'
#' The functions \code{plot} (i.e., \code{\link{plot.izip}}) and
#' \code{autoplot} can be used to produce a range
#' of diagnostic plots.
#'
#' The generic assessor functions \code{coef} (i.e., \code{\link{coef.izip}}),
#' \code{logLik} (i.e., \code{\link{logLik.izip}})
#' \code{fitted} (i.e., \code{\link{fitted.izip}}),
#' \code{nobs} (i.e., \code{\link{nobs.izip}}),
#' \code{AIC} (i.e., \code{\link{AIC.izip}}) and
#' \code{residuals} (i.e., \code{\link{residuals.izip}})
#' can be used to extract various useful features of the value
#' returned by \code{glm.izip}.
#'
#' An object class 'glm.izip' is a list containing at least the following components:
#'
#' \item{coefficients}{a named vector of coefficients}
#' \item{stderr}{approximate standard errors (using observed rather than expected information) for mean coefficients}
#' \item{residuals}{the \emph{response} residuals (i.e., observed-fitted)}
#' \item{fitted_values}{the fitted mean values}
#' \item{rank}{the numeric rank of the fitted linear model for mean}
#' \item{linear_predictors}{the linear fit for mean on log scale}
#' \item{df_residuals}{the residuals degrees of freedom}
#' \item{df_null}{the residual degrees of freedom for the null model}
#' \item{null_deviance}{The deviance for the null model.
#' The null model will include only the intercept.}
#' \item{deviance; residual_deviance}{The residual deviance of the model}
#' \item{y}{the \code{y} vector used.}
#' \item{X}{the model matrix for mean}
#' \item{model}{the model frame for regression}
#' \item{call}{the matched call}
#' \item{formula}{the formula supplied for regression}
#' \item{terms}{the \code{terms} object used for regression}
#' \item{data}{the \code{data} argument}
#' \item{offset}{the \code{offset} vector used}
#'
#' @references
#' Huang, A. and Fung, T. (2020). Zero-inflated Poisson exponential families, with applications to time-series modelling of counts.
#' @export
#'
#' @examples
#' data()
glm.izip <- function(formula, data, ref.lambda = NULL,
                 offset = NULL,
                 subset, contrasts = NULL,
                 na.action){
  call <- match.call()
  mf <- match.call(expand.dots = FALSE)
  m <- match(c("formula", "data", "subset", "na.action", "offset"), names(mf), 0L)
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
  X <- model.matrix(formula, mf, contrasts)
  q <- dim(X)[2]
  offset <- as.vector(model.offset(mf))
  if (is.null(offset)) {
    offset <-  rep(0, length(y))
  } else {
    offset <-  model.extract(mf, "offset")
  }
  if(is.null(ref.lambda)) {ref.lambda <- mean(y)}
  logziplik <- function(para){
    # pre-compute quantities for efficiency
    log.odds <- para[q+1]
    odds <- exp(log.odds)
    mu <- exp(X%*%para[1:q]+offset)
    theta <- log(mu+VGAM::lambertW(odds*exp(ref.lambda-mu)*mu))-log(ref.lambda)
    lambda <- ref.lambda*exp(theta)
    p_theta <- odds/(odds+exp(-ref.lambda+lambda))
    # the negative log likelihood function
    # loglikelihoods contributions for the zero observations
    loglikzero <- (y==0)*log(p_theta + (1-p_theta)*exp(-lambda))
    # loglikelihood contributions for the non-zero observations
    logliknonzero <- (y > 0)*(log(1-p_theta) - lambda + y*log(lambda)-lgamma(y+1))
    loglik <- -sum(loglikzero + logliknonzero)
    return(loglik)
  }
  lm1 <-  stats::optim(c(log(mean(y)),rep(0,q-1),0),
                     logziplik, method = "BFGS",
                     control = list(maxit = 100000), hessian=TRUE)
  beta <- lm1$par[1:q]
  log.odds <- lm1$par[q+1]
  odds <- exp(log.odds)
  mu <- as.numeric(exp(X%*%lm1$par[1:q]+offset))
  theta <- log(mu+VGAM::lambertW(odds*exp(ref.lambda-mu)*mu))-log(ref.lambda)
  lambda <- ref.lambda*exp(theta)
  p_theta <- odds/(odds+exp(-ref.lambda+lambda))
  variances <- mu + mu^2*p_theta/(1-p_theta)
  variance_beta <- solve(lm1$hessian)[1:q, 1:q]
  se_beta <- as.vector(sqrt(diag(variance_beta)))
  Xtilde <- diag(mu/sqrt(variances))%*%as.matrix(X)
  h <- diag(Xtilde%*%solve(t(Xtilde)%*%Xtilde)%*%t(Xtilde))
  df_residuals <- length(y)-length(beta)
  if (df_residuals > 0){
    indsat_deviance <-  dizip(y, mu = y, nu = odds, log.p=TRUE)
    indred_deviance <-  2*(indsat_deviance - dizip(y, mu = mu, nu=odds, log.p=TRUE))
    d_res <-  sign(y-mu)*sqrt(abs(indred_deviance))
  } else { d_res = rep(0,length(y))
  }
  out <- list()
  out$coefficients <- beta
  names(out$coefficients) <- labels(X)[[2]]
  out$call <- call
  out$nobs <- NROW(X)
  out$rank <- q
  out$offset <- offset
  out$pi <- exp(lm1$par[q+1])/(1+exp(lm1$par[q+1]))
  out$nu <- odds
  out$ref.lambda <- ref.lambda
  out$logLik <- -lm1$value
  out$hessian <- lm1$hessian
  out$vcov <- variance_beta
  out$df_residuals <- df_residuals
  out$df_null <- NROW(X)-1
  colnames(out$vcov) <- row.names(out$vcov) <- names(as.data.frame(X))
  out$stderr <- se_beta
  names(out$stderr) <- names(as.data.frame(X))
  out$convergence <- lm1$convergence
  out$theta <- theta
  out$lambda <- lambda
  out$p_theta <- p_theta
  out$formula <- formula
  out$leverage <- h
  out$offset <- offset
  out$d_res <- d_res
  out$null_deviance <- 2*(sum(indsat_deviance) -
                            sum(dizip(y, mu = mean(y), nu = odds, log.p = TRUE,
                                      ref.lambda = ref.lambda)))
  out$deviance <- out$residual_deviance <-
    2*(sum(indsat_deviance) -
         sum(dizip(y, mu = mu, nu = odds, log.p = TRUE, ref.lambda = ref.lambda)))
  out$linear_predictors <- t(X%*%out$coef)[1,]
  names(out$offset) <- names(out$linear_predictors) <- names(out$theta) <-
    names(out$lambda) <- names(out$leverage) <- 1:out$nobs
  out$fitted_values <- mu
  out$residuals <- y - mu
  out$fitted_zero <- p_theta
  out$y <- y
  out$X <- X
  out$model <- mf
  out$family <-
    structure(list(family =
                     paste0("iZIP(mu, ",
                            signif(odds,
                                   max(3, getOption("digits") - 4)),
                            "| ref.lambda =",
                            signif(ref.lambda,
                                   max(3, getOption("digits") - 4)), ")"),
                   link = 'log'),
                   class = "family")
  out$terms <- mt
  out$aic <- -2*out$logLik+2*length(lm1$par)
  out$bic <- -2*out$logLik+log(NROW(X))*length(lm1$par)
  class(out) = "izip"
  return(out)
}
