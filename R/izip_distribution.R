#' The interpretable Zero-Inflated Poisson (iZIP) Distribution.
#'
#' Density, distribution function, quantile function and random generation for the
#' interpretable Zero-Inflated Poisson with parameter \code{mu} and \code{nu}
#'
#' @param x,q vector of quantiles
#' @param p vector of probabilities
#' @param n number of observations. If \code{length(n)} > 1, the length is taken to
#' be the number required.
#' @param pi an alternative way than nu to parametrized the distribution.
#' Must be between 0 and 1.
#' @param ref.lambda numeric; Baseline Poisson rate. Default is 1.
#' @param mu,nu mean and baseline zero inflation odds parameters. Must be strictly positive.
#' @param log.p logical; if \code{TRUE}, probabilities/densities \eqn{p} are returned as
#' \eqn{log(p)}.
#' @param lower.tail logical; if \code{TRUE} (default), probabilities are \eqn{P(X \le x)},
#' otherwise, \eqn{P(X>x)}.
#' @return \code{dizip} gives the density, \code{pizip} gives the distribution function, \code{qizip} gives the quantile function, and \code{rizip} generates random deviates.
#'
#' Invalid arguments will result in return value \code{NaN}, with a warning.
#'
#' The length of the results is determined by \code{n} for \code{rizip}, and is the maximum
#' of the lengths of the numerical arguments for the other functions.
#'
#' The numerical arguments other than \code{n} are recycled to the length of the results.
#' Only the first argument of the logical arguments are used.
#' @examples
#' dizip(0:5, mu = 2, nu = 1.2)
#' pizip(5, mu=2, nu =1.2)
#' p <- (1:9)/10
#' qizip(p, mu = 2, nu = 1)
#' rizip(10, mu = 2, nu = 4)
#' @name iZIP_Distribution
NULL

#' @rdname iZIP_Distribution
#' @export
dizip <- function(x, mu, nu, pi, ref.lambda = 1, log.p = FALSE){
  # compute the pmf/density for iZIP distribution with mean mu and  baseline ZI odd nu
  # x, mu, nu are recycled to match the length of each other.
  if (missing(mu)){
    stop('argument "mu" is missing, with no default')
  }
  if (missing(nu) && missing(pi)){
    stop('both argument "nu" and "pi" are missing, with no default.
         You should specify one of them.')
  }
  if (!missing(nu) && !missing(pi)) {
    stop("specify 'nu' or 'pi' but not both")
  }
  if (missing(nu)){
    nu <- pi/(1-pi)
  }
  if (missing(pi)){
    pi <- nu/(1+nu)
  }
  df <- CBIND(x = x, mu=mu, nu=nu)
  x <- df[,1]
  mu <- df[,2]
  nu <- df[,3]
  theta <- log(mu+VGAM::lambertW(nu*exp(ref.lambda-mu)*mu))-log(ref.lambda)
  lambda <- ref.lambda*exp(theta)
  p_theta <- nu/(nu+exp(-ref.lambda+lambda))
  # the negative log likelihood function
  # loglikelihoods contributions for the zero observations
  loglikzero <- (x==0)*log(p_theta + (1-p_theta)*exp(-lambda))
  # loglikelihood contributions for the non-zero observations
  logliknonzero <- (x > 0)*(log(1-p_theta) - lambda + x*log(lambda)-lgamma(x+1))
  loglik <- loglikzero + logliknonzero
  warn <- FALSE
  # at a vector of yvalues
  pmf <- rep(0,length(x))
  for (i in 1:length(x)) {
    if (mu[i] == 0 && x[i]==0) {
      pmf[i] = 0 # log(1), 1 as the distribution is degenerated at 0
    } else if (mu[i]< 0 | nu[i] < 0 | is.na(theta[i])) {
      pmf[i] <- NaN
      warn <- TRUE
    } else {
      if (!is.wholenumber(x[i])) {
        warning(paste("non-integer x =", x[i]))
        pmf[i] <- -Inf # log(0)
      } else {
        if (x[i]<0){pmf[i]= -Inf } else{ #log(0)
          # pmf <- log(density)
          pmf[i] <- loglik[i]
        }
      }
    }
  }
  if (!log.p){ pmf = exp(pmf)}
  if (warn){warning("NaN(s) produced")}
  return(pmf)
}


#' @rdname iZIP_Distribution
#' @export
pizip <- function(q, mu, nu, pi, lower.tail = TRUE, log.p = FALSE){
  # compute the distribution function for iZIP distribution with mean mu and
  # baseline ZI odd nu
  # q, mu, nu are recycled to match the length of each other.
  if (missing(mu)){
    stop('argument "mu" is missing, with no default')
  }
  if (missing(nu) && missing(pi)){
    stop('both argument "nu" and "pi" are missing, with no default.
         You should specify one of them.')
  }
  if (!missing(nu) && !missing(pi)) {
    stop("specify 'nu' or 'pi' but not both")
  }
  if (missing(nu)){
    nu <- pi/(1-pi)
  }
  if (missing(pi)){
    pi <- nu/(1+nu)
  }
  df <- CBIND(q = q, mu=mu, nu=nu)
  q <- df[,1]
  mu <- df[,2]
  nu <- df[,3]
  cdf <- rep(0,length(q))
  warn <- FALSE
  for (i in 1:length(q)) {
    if ( mu[i] == 0 && q[i]>=0){
      cdf[i] = 1
    }
    else if (mu[i]< 0 | nu[i] <=0) {
      cdf[i] <- NaN
      warn <- TRUE
    } else {
      if (q[i] >= 0){
        cdf[i] <- sum(dizip(0:floor(q[i]), mu = mu[i], nu = nu[i]))
      }
    }
  }
  if (warn){warning("NaNs produced")}
  if (!lower.tail){ cdf = 1-cdf}
  if (log.p){ cdf = log(cdf)}
  return(cdf)
}

#' @rdname iZIP_Distribution
#' @export
qizip <- function(p, mu, nu, pi, lower.tail = TRUE, log.p = FALSE){
  # compute the quantile function or iZIP distribution with mean mu and
  # baseline ZI odd nu
  # p, mu, nu are recycled to match the length of each other.
  if (missing(mu)){
    stop('argument "mu" is missing, with no default')
  }
  if (missing(nu) && missing(pi)){
    stop('both argument "nu" and "pi" are missing, with no default.
         You should specify one of them.')
  }
  if (!missing(nu) && !missing(pi)) {
    stop("specify 'nu' or 'pi' but not both")
  }
  if (missing(nu)){
    nu <- pi/(1-pi)
  }
  if (missing(pi)){
    pi <- nu/(1+nu)
  }
  df <- CBIND(p = p, mu=mu, nu=nu)
  p <- df[,1]
  mu <- df[,2]
  nu <- df[,3]
  q <- rep(0, length(p))
  warn <- FALSE
  if (!lower.tail){ p <- 1-p}
  if (log.p){ p <- exp(p)}
  for (i in 1:length(p)) {
    if (mu[i] == 0) {
      q[i] <- 0
    }
    else if (mu[i]< 0 | nu[i] <0 | p[i]<0 | p[i]>1) {
      q[i] <- NaN
      warn <- TRUE
    } else {
      y <- 0
      py <- dizip(y, mu = mu[i], nu = nu[i])
      while (py <= p[i]){
        y = y+1
        py <- py + dizip(y, mu = mu[i], nu = nu[i])
      }
      q[i] = y
    }
  }
  if (warn){ warning("NaNs produced") }
  return(q)
}

#' @rdname iZIP_Distribution
#' @export
rizip <- function(n, mu, nu, pi){
  # generates random deviates of izip variables with mean mu and baseline ZI odds nu
  # mu, nu, pi are recycled to give vectors length n
  if (length(n)>1){
    n <- length(n)
  }
  if (missing(mu)){
    stop('argument "mu" is missing, with no default')
  }
  if (missing(nu) && missing(pi)){
    stop('both argument "nu" and "pi" are missing, with no default.
         You should specify one of them.')
  }
  if (!missing(nu) && !missing(pi)) {
    stop("specify 'nu' or 'pi' but not both")
  }
  if (missing(nu)){
    nu <- pi/(1-pi)
  }
  if (missing(pi)){
    pi <- nu/(1+nu)
  }
  if (n < max(length(mu), length(nu), length(pi))){
    stop("unused argument in mu or nu or pi")
  }
  df <- CBIND(x = rep(0,n), mu=mu, nu=nu)
  x <- df[,1]
  mu <- df[,2]
  nu <- df[,3]
  theta <- log(mu+VGAM::lambertW(nu*exp(ref.lambda-mu)*mu))-log(ref.lambda)
  lambda <- ref.lambda*exp(theta)
  p_theta <- nu/(nu+exp(-ref.lambda+lambda))
  summax <- mu + 20*sqrt(mu+mu^2*p_theta/(1-p_theta))
  unif <- runif(n)
  warn <- FALSE
  for (i in 1:n){
    if (mu[i] ==0){
      x[i] = 0
    } else if (mu[i]< 0 | nu[i] < 0) {
      x[i] <- NA
      warn <- TRUE
    } else {
      y <- 0
      dc <- dizip(0:summax, mu = mu[i], nu = nu[i])
      py <- dc[y+1]
      while (py <= unif[i]){
        y <- y+1
        py <- py + dc[y+1]
      }
      x[i] <- y
    }
  }
  if (warn){ warning("NAs produced") }
  return(x)
}
