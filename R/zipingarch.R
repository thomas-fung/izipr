tsglm.izip <- function(y, X = NULL, past_mean_lags = 1,
                       past_obs_lags = 1,
                       ref.lambda = NULL, ...){
  temp_W.E  <-
    tryCatch.W.E(tscount::tsglm(y, model = list(past_obs = past_obs_lags,
                                 past_mean = past_mean_lags), xreg = X, ...))
  if (is.null(X)){
    X <-  matrix(1, nrow=length(y), ncol=1)
  }
  temp_value <- temp_W.E$value
  mu <- fitted(temp_value)
  delta <- coef(temp_value)
  rsq <- length(delta)
  if (is.null(ref.lambda)) {
    ref.lambda <- mean(y)
  }
  logziplik <-  function(log.odds){
    # pre-compute quantities for efficiency
    odds <-  exp(log.odds)
    theta <-  log(mu+VGAM::lambertW(odds*exp(ref.lambda-mu)*mu))-log(ref.lambda)
    lambda <-  ref.lambda*exp(theta)
    p_theta <-  odds/(odds+exp(-ref.lambda+lambda))
    # the negative log likelihood function
    # loglikelihoods contributions for the zero observations
    loglikzero <- (y==0)*log(p_theta + (1-p_theta)*exp(-lambda))
    # loglikelihood contributions for the non-zero observations
    logliknonzero <- (y > 0)*(log(1-p_theta) - lambda + y*log(lambda)-lgamma(y+1))
    loglik <- -sum(loglikzero + logliknonzero)
    return(loglik)
  }
  lm1 <-  stats::optim(0, logziplik, method = "BFGS",
                       control = list(maxit = 100000), hessian=TRUE)
  log.odds <-  lm1$par
  n <- length(y)
  odds <-  exp(log.odds)
  theta <-  log(mu+VGAM::lambertW(odds*exp(ref.lambda-mu)*mu))-log(ref.lambda)
  lambda <-  ref.lambda*exp(theta)
  p_theta <-  odds/(odds+exp(-ref.lambda+lambda))
  var_hat <-  mu+mu^2*p_theta/(1-p_theta)
  sd_hat <-  sqrt(var_hat)
  s <- length(past_obs_lags)
  q <- length(past_mean_lags)
  r <- rsq - s - q
  if (s>0 & q <=0){
    msq <-  past_obs_lags[s]
  } else if (s<=0 & q>0){
    msq <- past_mean_lags[q]
  } else {
    msq <-  max(past_obs_lags[s], past_mean_lags[q])
  }
  nmsq <-  n+msq
  D_FS <-  0
  D_FS_robust <- 0
  mu_time <-  c(rep(msq, mean(mu)), mu)
  Y_time <- c(rep(0, msq), y)
  dmudcovariates_time <- matrix(0, nrow=r, ncol=nmsq)
  dmudcovariates_time[,1:msq] <-  matrix(1, nrow = r, ncol=msq)/(1-sum(delta[(r+1):rsq]))
  if (s>0){
    dmudpast_obs_time <-  matrix(0, nrow= s, ncol = nmsq)
    dmudpast_obs_time[,1:msq] <- matrix(1, nrow=s, ncol=msq)/(1-sum(delta[(r+1):rsq]))^2
  }
  if (q>0){
    dmudpast_means_time <- matrix(0, nrow=q, ncol=nmsq)
    dmudpast_means_time[,1:msq] <-  matrix(1, nrow=q, ncol=msq)/(1-sum(delta[(r+1):rsq]))^2
  }

  for (t in 1:n){
    if (s>0 & q>0){
      dmudcovariates_time[,msq+t] <-  t(X[t,])
      for (i in 1:s){
        dmudpast_obs_time[i,msq+t] <-  Y_time[msq+t-past_obs_lags[i]]
      }
      for (i in 1:q){
        dmudpast_means_time[i,msq+t] <-  mu_time[msq+t-past_mean_lags[i]]
      }
      for (i in 1:q){
        dmudcovariates_time[,msq+t] <-  dmudcovariates_time[,msq+t] +
          delta[r+s+i]* dmudcovariates_time[,msq+t-past_mean_lags[i]]
        dmudpast_obs_time[,msq+t] <-  dmudpast_obs_time[,msq+t] +
          delta[r+s+i]*dmudpast_obs_time[,msq+t-past_mean_lags[i]]
        dmudpast_means_time[,msq+t] <- dmudpast_means_time[,msq+t] +
          delta[r+s+i]*dmudpast_means_time[,msq+t-past_mean_lags[i]]
      }
      temp <-  c(dmudcovariates_time[,msq+t], dmudpast_obs_time[,msq+t],
                     dmudpast_means_time[,msq+t])
    } else if (s>0 & q<=0){
      dmudcovariates_time[,msq+t] <- t(X[t,])
      for (i in 1:s){
        dmudpast_obs_time[i,msq+t] <-  Y_time[msq+t-past_obs_lags[i]]
      } # past obs parameters/ no past means parameters
      temp <-  c(dmudcovariates_time[,msq+t], dmudpast_obs_time[,msq+t])
    } else {
      dmudcovariates_time[,msq+t] <- t(X[t,])
      for (i in 1:q){
        dmudpast_means_time[i,msq+t] <- mu_time[msq+t-past_mean_lags[i]]
      }
      for (i in 1:q){
        dmudcovariates_time[,msq+t] <- dmudcovariates_time[,msq+t] +
          delta[r+i]* dmudcovariates_time[,msq+t-past_mean_lags[i]]
        dmudpast_means_time[,msq+t] <- dmudpast_means_time[,msq+t] +
          delta[r+i]* dmudpast_means_time[,msq+t-past_mean_lags[i]]
      }
      temp <- c(dmudcovariates_time[,msq+t], dmudpast_means_time[,msq+t])
    }
    D_FS <-  D_FS + 1/(mu[t])*(temp%*%t(temp))
    D_FS_robust <- D_FS_robust + var_hat[t]/(mu[t])^2*
      (temp%*%t(temp))
  }
  vcov_delta <- solve(D_FS) %*% D_FS_robust %*% solve(D_FS)
  stderr <- sqrt(diag(vcov_delta))
  #stderr <- sqrt(diag(solve(D_FS) %*% D_FS_robust %*% solve(D_FS)))
  output <- list()
  output$coef <- delta
  output$pi <- odds/(1+odds)
  output$ref.lambda <- ref.lambda
  output$log.lik <- -lm1$value
  output$mu <- mu
  output$p_theta <- p_theta
  output$y <- y
  output$X <- X
  output$nobs <- n
  output$stderr <- stderr
  output$vcov <- vcov_delta
  output$aic <- -2*output$log.lik+2*(length(delta)+1)
  output$bic <- -2*output$log.lik+log(n)*(length(delta)+1)
  output$convergence <- NULL
  class(output) = "zipingarch"
  if (!is.null(temp_W.E$warning)){
    st_length <- stringr::str_length(as.character(temp_W.E$warning))
    st_start <- as.numeric(stringr::str_locate(as.character(temp_W.E$warning), ":")[1,1]) + 1
    warning(stringr::str_sub(as.character(temp_W.E$warning),
                             start = st_start, end = st_length-1))
  }
  return(output)
}



