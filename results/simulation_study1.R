library(tidyverse)

#setwd("~/Dropbox/MATLAB/ZIP/ZIP_R")
sim_zipingarch <- function(n, nrep, beta0, beta1, pastmean1, p){
  set.seed(2002530456)
  Y <-  matrix(0, (n+1), nrep)
  mu_record <-  matrix(0, (n+1), nrep)
  for (j in 1:nrep){
    mu <-  beta0
    mu_record[1,j] <-  mu
    theta <-  log(mu+W(exp(1+log(p/(1-p))-mu)*mu))
    lambdanew <-  exp(theta)
    pnew <-  p/(p+(1-p)*exp(-(1-lambdanew)))
    if (rbinom(1,1,pnew)==1) {
      Y[1,j] <- 0}
    else {
      Y[1,j] <-  rpois(1,lambdanew)}
    for (i in 2:(n+1)){
      mu <-  beta0 + beta1*Y[i-1,j]+ pastmean1*mu
      mu_record[i,j] <-  mu
      theta <-  log(mu+W(exp(1+log(p/(1-p))-mu)*mu))
      lambdanew <-  exp(theta)
      pnew <-  p/(p+(1-p)*exp(-(1-lambdanew)))
      if (rbinom(1,1,pnew)==1) {
        Y[i,j] <- 0}
      else { Y[i,j] <-  rpois(1,lambdanew)}
    }
  }
  out <- list()
  out$Y <- Y
  out$mu_record <- mu_record
  return(out)
}
sim_zipingarch_zhu <- function(n, nrep, beta0, beta1, pastmean1, p){
  set.seed(2002530456)
  Y <-  matrix(0, (n+1), nrep)
  for (j in 1:nrep){
    lambda = beta0
    if (rbinom(1,1,p)==1) {
      Y[1,j]=0}
    else {
      Y[1,j] = rpois(1,lambda)}
    lambdaold = lambda
    for (i in 2:(n+1)){
      lambda = beta0 + beta1*Y[i-1,j]+ pastmean1*lambdaold
      if (rbinom(1,1,p)==1){
        Y[i,j]=0}
      else {
        Y[i,j] = rpois(1,lambda)}
      lambdaold = lambda}}
  out <- list()
  out$Y <- Y
  return(out)
}

param_p_A <- c(0.05, 0.15, 0.3)
param_intercept_A <- rep(0.6,3)
param_past_mean_A <- rep(0.4,3)
param_past_obs_A <- rep(0.3,3)
param_p_B <- c(0.05, 0.3, 0.5, 0.8)
param_intercept_B <- rep(0.7, 4)
param_past_mean_B <- rep(0.4, 4)
param_past_obs_B <- rep(0.2, 4)
model <- c(paste0("A",1:3), paste0("B", 1:4))

param <- data.frame(model = model,
                delta = c(param_intercept_A, param_intercept_B),
                alpha1 = c(param_past_mean_A, param_past_mean_B),
                beta1 = c(param_past_obs_A, param_past_obs_B),
                p = c(param_p_A, param_p_B))
#write_csv(param, path = here::here("data", "testingzipingarch_setting.csv"))
#param <- read_csv(here::here("data", "testingzipingarch_setting.csv"))

param <- param %>% mutate(delta = ifelse(model %in% c("A1", "A2", "A3"),
                                         delta/(1-p), delta),
                          beta1 = ifelse(model %in% c("A1", "A2", "A3"),
                                         beta1/(1-p), beta1),
                          nu = effectsize::convert_probs_to_odds(p))

param %>% filter(str_sub(model,1,1)=="A") %>%
  mutate(condition_value_A = (1-p)*beta1^2+2*(1-p)*alpha1*beta1+alpha1^2, condition_holds = condition_value_A<1)
param %>% filter(str_sub(model,1,1)=="B") %>%
  mutate(condition_value_B = (alpha1+beta1)^2+(beta1)^2*exp(1+log(nu)),
         condition_holds = condition_value_B<1)

n_actual <- c(250, 500, 750)
n_sim <- 2000
nrep <- 1000
for (j in 1:length(model)){
  data <- param[j,]
  if (stringr::str_sub(data$model,1,1)=="B"){
    out <- sim_zipingarch(n = n_sim, nrep= nrep, beta0 = data$delta,
                          beta1 = data$beta1, pastmean1 = data$alpha1,
                          p = data$p)
  } else {
    out <- sim_zipingarch_zhu(n = n_sim,
                              nrep= nrep, beta0 = data$delta,
                              beta1 = data$beta1, pastmean1 = data$alpha1,
                              p = data$p)
  }
  for (i in 1:length(n_actual)){
    Y <-  out$Y[(n_sim-n_actual[i]+1):n_sim,]
    print(c(data$model, n_actual[i], mean(Y), sum(Y==0)/n_actual[i]/nrep))
    delta <- matrix(0, ncol = 4, nrow = nrep)
    colnames(delta) <- c("(Intercept)", "beta_1", "alpha_1", "pi")
    stderr <- matrix(0, ncol = 3, nrow = nrep)
    colnames(stderr) <- c("(Intercept)", "beta_1", "alpha_1")
    maxloglik <- matrix(0, ncol = 6, nrow = nrep)
    colnames(maxloglik) <- c("INGARCH(0,1)", "INGARCH(0,2)", "INGARCH(1,1)",
                          "INGARCH(2,1)", "INGARCH(1,2)", "INGARCH(2,2)")
    aic_matrix <- bic_matrix <- maxloglik
    for (k in  990:1000){
      temp11 <- tryCatch.W.E(tsglm.izip(Y[, k], ref.lambda = 1))
      if(is.null(temp11$value$pi)){
        delta[k, ] <- rep(NA, 4)
        } else {
          delta[k, ] <- c(temp11$value$coef, temp11$value$pi)
        }
      if(is.null(temp11$value$pi)){
        stderr[k,] <- rep(NA, 3)
        } else {
      stderr[k,] <- temp11$value$stderr
      }
      temp01 <- tryCatch.W.E(tsglm.izip(Y[,k],
                                        past_mean_lags = NULL,
                                        past_obs_lags = 1, ref.lambda = 1))
      temp02 <- tryCatch.W.E(tsglm.izip(Y[,k],
                                        past_mean_lags = NULL,
                                        past_obs_lags = c(1,2), ref.lambda = 1))
      temp12 <- tryCatch.W.E(tsglm.izip(Y[,k],
                                        past_mean_lags = 1,
                                        past_obs_lags = c(1,2),
                                        ref.lambda = 1))
      temp21 <- tryCatch.W.E(tsglm.izip(Y[,k],
                                        past_mean_lags = 1:2,
                                        past_obs_lags = c(1), ref.lambda = 1))
      temp22 <- tryCatch.W.E(tsglm.izip(Y[,k],
                                        past_mean_lags = 1:2,
                                        past_obs_lags = c(1:2),
                                        ref.lambda = 1))
      maxloglik[k, ] <- c(
        ifelse(is.null(temp01$value$log.lik), NA, temp01$value$log.lik),
        ifelse(is.null(temp02$value$log.lik), NA, temp02$value$log.lik),
        ifelse(is.null(temp11$value$log.lik), NA, temp11$value$log.lik),
        ifelse(is.null(temp12$value$log.lik), NA, temp12$value$log.lik),
        ifelse(is.null(temp21$value$log.lik), NA, temp21$value$log.lik),
        ifelse(is.null(temp22$value$log.lik), NA, temp22$value$log.lik))
      aic_matrix[k, ] <- c(
        ifelse(is.null(temp01$value$aic), NA, temp01$value$aic),
        ifelse(is.null(temp02$value$aic), NA, temp02$value$aic),
        ifelse(is.null(temp11$value$aic), NA, temp11$value$aic),
        ifelse(is.null(temp12$value$aic), NA, temp12$value$aic),
        ifelse(is.null(temp21$value$aic), NA, temp21$value$aic),
        ifelse(is.null(temp22$value$aic), NA, temp22$value$aic))
      bic_matrix[k, ] <- c(
        ifelse(is.null(temp01$value$bic), NA, temp01$value$bic),
        ifelse(is.null(temp02$value$bic), NA, temp02$value$bic),
        ifelse(is.null(temp11$value$bic), NA, temp11$value$bic),
        ifelse(is.null(temp12$value$bic), NA, temp12$value$bic),
        ifelse(is.null(temp21$value$bic), NA, temp21$value$bic),
        ifelse(is.null(temp22$value$bic), NA, temp22$value$bic))
    }
    dalta <- as.data.frame(delta)
    stderr <- as.data.frame(stderr)
    maxloglik <- as.data.frame(maxloglik)
    aic_matrix <- as.data.frame(aic_matrix)
    bic_matrix <- as.data.frame(bic_matrix)
    file_path2 <-  paste0("delta",
                          "_zipingarch_r_for_testingingarch_",
                          model[j], "_n_", n_actual[i], ".csv")
    file_path3 <- paste0("stderr", "_zipingarch_r_for_testingingarch_",
                         model[j], "_n_", n_actual[i], ".csv")
    file_path4 = paste0("maxloglik", "_zipingarch_r_for_testingingarch_",
                        model[j],"_n_", n_actual[i],
                        ".csv")
    file_path5 = paste0("aic", "_zipingarch_r_for_testingingarch_",
                        model[j],"_n_", n_actual[i],
                        ".csv")
    file_path6 = paste0("bic", "_zipingarch_r_for_testingingarch_",
                        model[j],"_n_", n_actual[i],
                        ".csv")
    write.csv(delta, file = here::here("results", file_path2))
    write.csv(stderr, file = here::here("results", file_path3))
    write.csv(maxloglik, file = here::here("results", file_path4))
    write.csv(aic_matrix, file = here::here("results", file_path5))
    write.csv(bic_matrix, file = here::here("results", file_path6))
  }
}



