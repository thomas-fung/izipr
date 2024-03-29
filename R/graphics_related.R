#' PIT Plots for a iZIP Object
#'
#' Two plots for the non-randomized PIT are currently available for checking the
#' distributional assumption of the fitted iZIP model: the PIT histogram, and
#' the uniform Q-Q plot for PIT.
#'
#' @param object an object class "izip", obtained from a call to \code{glm.izip}.
#' @param bins numeric; the number of bins shown in the PIT histogram or the
#' PIT Q-Q plot.
#' @param line logical; if \code{TRUE} (default), the line for displaying the standard
#' uniform distribution will be shown for the purpose of comparison.
#' @param colLine	 numeric or character: the colour of the line for comparison
#' in PIT histogram.
#' @param lwdLine numeric; the line widths for the comparison line in PIT histogram.
#' @param colHist numeric or character; the colour of the histogram for PIT.
#' @param col1 numeric or character; the colour of the sample uniform Q-Q plot in PIT.
#' @param col2 numeric or character; the colour of the theoretical uniform Q-Q plot in PIT.
#' @param lty1 integer or character string: the line types for the sample
#' uniform Q-Q plot in PIT, see par(lty = .).
#' @param lty2 an integer or character string: the line types for the theoretical uniform
#' Q-Q plot in PIT, see par(lty = .).
#' @param type 1-character string; the type of plot for the sample uniform Q-Q plot in PIT.
#' @param main character string; a main title for the plot.
#' @param ... other arguments passed to plot.default and plot.ts.
#' @import graphics
#' @details
#' The histogram and the Q-Q plot are used to compare the fitted profile with a standard
#' uniform distribution. If they match relatively well, it means the iZIP distribution
#' is appropriate for the data.
#'
#' The \code{gg_histizipPIT} and \code{gg_qqizipPIT} functions
#' would provide the same two plots but in ggplot format.
#'
#' @references
#' Czado, C., Gneiting, T. and Held, L. (2009). Predictive model assessment
#' for count data. \emph{Biometrics}, \strong{65}, 1254--1261.
#'
#' Dunsmuir, W.T.M. and Scott, D.J. (2015). The \code{glarma} Package for Observation-Driven
#' Time Series Regression of Counts. \emph{Journal of Statistical Software},
#' \strong{67}, 1--36.
#' @seealso
#' \code{\link{gg_histizipPIT}}, \code{\link{gg_qqizipPIT}},
#' \code{\link{plot.izip}} and \code{\link{autoplot.izip}}.
#' @examples
#' ## For examples see example(plot.izip)
#' @name PIT_Plot
NULL

#' @rdname PIT_Plot
histizipPIT <- function(object, bins = 10, line = TRUE, colLine = "red", colHist = "royal blue", lwdLine = 2, main = NULL, ...) {
  PIT.out <- izipPIT(object, bins = bins)$PIT
  height <- diff(PIT.out[, ncol(PIT.out)]) * bins
  if (max(height) > 2) {
    y.upper <- max(height) + 1 / (bins / 2)
  }
  else {
    y.upper <- 2
  }
  if (is.null(main)) {
    main <- paste("PIT for iZIP")
  }
  barplot(height,
    ylim = c(0, y.upper), border = TRUE, space = 0,
    xpd = FALSE, xlab = "Probability Integral Transform",
    ylab = "Relative Frequency", main = main, col = colHist,
    ...
  )
  if (line == TRUE) {
    abline(h = 1, lty = 2, col = colLine, lwd = lwdLine)
  }
  plot.window(xlim = c(0, 1), ylim = c(0, y.upper))
  axis(1)
  box()
}

#' @rdname PIT_Plot
qqizipPIT <- function(object, bins = 10, col1 = "red", col2 = "black", lty1 = 1,
                      lty2 = 2, type = "l", main = NULL, ...) {
  dummy.variable <- seq(0, 1, by = 1 / bins)
  PIT <- izipPIT(object, bins = bins)$PIT
  qq.plot <- PIT[, ncol(PIT)]
  if (is.null(main)) {
    main <- "Q-Q Plot of Uniform PIT"
  }
  plot(dummy.variable, qq.plot, lty = lty1, col = col1, xlim = c(0, 1), ylim = c(0, 1), type = type, xlab = "Theoretical", ylab = "Sample", main = main, ...)
  abline(0, 1, col = col2, lty = lty2)
  list(sample = qq.plot, theoretical = dummy.variable)
  invisible()
}

#' ggplot version of PIT Plots for a iZIP Object
#'
#' Two plots for the non-randomized PIT are currently available for checking the
#' distributional assumption of the fitted iZIP model: the PIT histogram, and
#' the uniform Q-Q plot for PIT.
#'
#' \code{histizipPIT} and \code{qqizipPIT}
#'
#' @param object an object class "izip", obtained from a call to \code{glm.izip}.
#' @param bins numeric; the number of bins shown in the PIT histogram or the
#' PIT Q-Q plot.
#' @param ref_line logical; if \code{TRUE} (default), the line for displaying the standard
#' uniform distribution will be shown for the purpose of comparison.
#' @param col_line	 numeric or character: the colour of the reference line
#' for comparison in PIT histogram.
#' @param size numeric; the line widths for the comparison line in PIT histogram.
#' @param col_hist numeric or character; the colour of the histogram for PIT.
#' @param col1 numeric or character; the colour of the sample uniform Q-Q plot in PIT.
#' @param col2 numeric or character; the colour of the theoretical uniform Q-Q plot in PIT.
#' @param lty1 integer or character string: the line types for the sample
#' uniform Q-Q plot in PIT, see ggplot2::linetype.
#' @param lty2 an integer or character string: the line types for the theoretical uniform
#' Q-Q plot in PIT, see ggplot2::linetype.
#' @import ggplot2
#' @import ggpubr
#'
#' @details
#' The histogram and the Q-Q plot are used to compare the fitted profile with a standard
#' uniform distribution. If they match relatively well, it means the iZIP distribution
#' is appropriate for the data.
#'
#' The \code{histizipPIT} and \code{qqizipPIT} functions
#' would provide the same two plots but in base R format.
#' @references
#' Czado, C., Gneiting, T. and Held, L. (2009). Predictive model assessment
#' for count data. \emph{Biometrics}, \strong{65}, 1254--1261.
#'
#' Dunsmuir, W.T.M. and Scott, D.J. (2015). The \code{glarma} Package for Observation-Driven
#' Time Series Regression of Counts. \emph{Journal of Statistical Software},
#' \strong{67}, 1--36.
#' @seealso
#' \code{\link{histizipPIT}}, \code{\link{qqizipPIT}},
#' \code{\link{plot.izip}} and \code{\link{autoplot.izip}}.

#' @examples
#' ## For examples see example(autoplot)
#' @name PIT_ggPlot
NULL

#' @rdname PIT_ggPlot
gg_histizipPIT <-
  function(object, bins = 10, ref_line = TRUE, col_line = "red",
           col_hist = "royal blue", size = 1) {
    x <- NULL
    PIT.out <- izipPIT(object, bins = bins)$PIT
    height <- diff(PIT.out[, ncol(PIT.out)]) * bins
    if (max(height) > 2) {
      y_lim <- max(height) + 1 / (bins / 2)
    } else {
      y_lim <- 2
    }
    p <- ggplot(data.frame(
      height = height,
      x = (seq(0, 1,
        length.out = (bins + 1)
      ) +
        1 / (bins * 2))[-(bins + 1)]
    )) +
      geom_col(aes(y = height, x = x), fill = col_hist) +
      ylim(0, y_lim) +
      xlim(0, 1) +
      labs(
        x = "Probability Integral Transform", y = "Relative Frequency",
        title = "Histogram of Uniform PIT for iZIP"
      )
    if (ref_line == TRUE) {
      p <- p + geom_hline(
        yintercept = 1, linetype = 2, colour = col_line,
        size = size
      )
    }
    return(p)
  }

#' @rdname PIT_ggPlot
#' @export
gg_qqizipPIT <- function(object, bins = 10, col1 = "red",
                         col2 = "#999999",
                         lty1 = 1, lty2 = 2) {
  PIT <- NULL
  dummy.variable <- seq(0, 1, by = 1 / bins)
  PIT.out <- izipPIT(object, bins = bins)$PIT
  qq.plot <- PIT.out[, ncol(PIT.out)]
  p <- ggplot(data.frame(dummy.variable = dummy.variable, PIT = qq.plot)) +
    geom_line(aes(x = dummy.variable, y = PIT), linetype = lty1, colour = col1) +
    geom_abline(intercept = 0, slope = 1, linetype = lty2, colour = col2) +
    labs(x = "theoretical", y = "sample", title = "QQ Plot of Uniform PIT")
  return(p)
}


#' Non-randomized Probability Integral Transform
#'
#' Functions to produce the non-randomized probability integral transform (PIT) to check the
#' adequacy of the distributional assumption of the iZIP model. The majority of the
#' code and descriptions are taken from Dunsmuir and Scott (2015).
#'
#' @param object an object class "izip", obtained from a call to \code{glm.izip}.
#' @param bins numeric; the number of bins shown in the PIT histogram or the
#' PIT Q-Q plot.
#' @details
#' These functions are used to obtain the predictive probabilities and the probability
#' integral transform for a fitted izip model. The majority of the code and
#' descriptions are taken from Dunsmuir and Scott (2015).
#' @return
#' \code{izipPredProb} returns a list with values:
#' \item{upper}{the predictive cumulative probabilities used as the upper bound for
#' computing the non-randomized PIT.}
#' \item{lower}{the predictive cumulative probabilities used as the upper bound for
#' computing the non-randomized PIT.}
#'
#' \code{izipPIT} returns a list with values:
#' \item{conditionalPIT}{the conditional probability integral transformation given the
#' observed counts.}
#' \item{PIT}{the probability integral transformation.}
#' @references
#' Czado, C., Gneiting, T. and Held, L. (2009). Predictive model assessment
#' for count data. \emph{Biometrics}, \strong{65}, 1254--1261.
#'
#' Dunsmuir, W.T.M. and Scott, D.J. (2015). The \code{glarma} Package for Observation-Driven
#' Time Series Regression of Counts. \emph{Journal of Statistical Software},
#' \strong{67}, 1--36.
#' @examples
#' data(bioChemists)
#' M_bioChem <- glm.izip(art ~ ., data = bioChemists)
#' izipPredProb(M_bioChem)
#' izipPIT(M_bioChem)
#' @name nrPIT
NULL

#' @rdname nrPIT
#' @export
izipPredProb <- function(object) {
  lower <- pizip(object$y - 1, mu = object$fitted_values, nu = object$nu)
  upper <- lower + dizip(object$y, mu = object$fitted_values, nu = object$nu)
  list(lower = lower, upper = upper)
}

#' @rdname nrPIT
#' @export
izipPIT <- function(object, bins = 10) {
  dummy.variable <- seq(0, 1, by = 1 / bins)
  predProb <- izipPredProb(object)
  con.PIT <- matrix(0, ncol = length(object$y), nrow = length(dummy.variable))
  for (i in 1:length(object$y)) {
    for (j in 1:length(dummy.variable)) {
      if (dummy.variable[j] <= predProb$lower[i]) {
        con.PIT[j, i] <- 0
      }
      if (dummy.variable[j] > predProb$lower[i] & dummy.variable[j] <
        predProb$upper[i]) {
        con.PIT[j, i] <- (dummy.variable[j] - predProb$lower[i]) / (predProb$upper[i] -
          predProb$lower[i])
      }
      if (dummy.variable[j] >= predProb$upper[i]) {
        con.PIT[j, i] <- 1
      }
    }
  }
  PIT.out <- matrix(0, ncol = length(object$y), nrow = length(dummy.variable))
  for (i in 2:length(object$y)) {
    PIT.out[, i] <- apply(con.PIT[, 1:i], 1, sum) * (i - 1)^(-1)
  }
  list(ConditionalPIT = con.PIT, PIT = PIT.out)
}

#' Random Normal Probability Integral Transform
#'
#' A function to create the normal conditional (randomized) quantile residuals.
#' The majority of the code and descriptions are taken from Dunsmuir and Scott (2015).
#' @param object an object class "izip", obtained from a call to \code{glm.izip}.
#'
#' @import stats
#' @details
#' The function \code{izipPredProb} produces the non-randomized probability integral
#' transform(PIT). It returns estimates of the cumulative predictive probabilities as
#' upper and lower bounds of a collection of intervals. If the model is correct, a
#' histogram drawn using these estimated probabilities should resemble a histogram
#' obtained from a sample from the uniform distribution.
#'
#' This function aims to produce observations which instead resemble a sample from
#' a normal distribution. Such a sample can then be examined by the usual tools for
#' checking normality, such as histograms and normal Q-Q plots.
#'
#' For each of the intervals produced by \code{izipnormRandPIT}, a random uniform observation
#' is generated, which is then converted to a normal observation by applying the inverse
#' standard normal distribution function (using \code{qnorm}). The vector of these values
#' is returned by the function in the list element \code{rt}. In addition non-random
#' observations which should appear similar to a sample from a normal distribution
#' are obtained by applying \code{qnorm} to the mid-points of the predictive distribution
#' intervals. The vector of these values is returned by the function in the list element
#' \code{rtMid}.

#' @return
#' A list consisting of two elements:
#' \item{rt}{the normal conditional randomized quantile residuals}
#' \item{rdMid}{the midpoints of the predictive probability intervals}
#' @references
#' Berkowitz, J. (2001). Testing density forecasts, with applications to risk management.
#' \emph{Journal of Business \& Economic Statistics}, \bold{19}, 465--474.
#'
#' Dunn, P. K. and Smyth, G. K. (1996). Randomized quantile residuals. \emph{Journal of
#' Computational and Graphical Statistics}, \bold{5}, 236--244.
#'
#' Dunsmuir, W.T.M. and Scott, D.J. (2015). The \code{glarma} Package for Observation-Driven
#' Time Series Regression of Counts. \emph{Journal of Statistical Software},
#' \strong{67}, 1--36.
#' @examples
#' data(bioChemists)
#' M_bioChem <- glm.izip(art ~ ., data = bioChemists)
#' izipnormRandPIT(M_bioChem)
#' @name rPIT
NULL

#' @rdname rPIT
#' @export
izipnormRandPIT <- function(object) {
  temp <- izipPredProb(object)
  rt <- qnorm(runif(length(temp$lower), temp$lower, temp$upper))
  rtMid <- qnorm((temp$lower + temp$upper) / 2)
  list(rt = rt, rtMid = rtMid)
}

#' Plot Diagnostic for a \code{glm.izip} Object
#'
#' Eight plots (selectable by \code{which}) are currently available using ggplot or graphics:
#' a plot of deviance residuals against fitted values,
#' a non-randomized PIT histogram,
#' a uniform Q-Q plot for non-randomized PIT,
#' a histogram of the normal randomized residuals,
#' a Q-Q plot of the normal randomized residuals,
#' a Scale-Location plot of sqrt(| residuals |) against fitted values
#' a plot of Cook's distances versus row labels
#' a plot of pearson residuals against leverage.
#' By default, four plots (number 1, 2, 6, and 8 from this list of plots) are provided.
#'
#' @param x an object class 'izip' object, obtained from a call to \code{glm.izip}
#' @param which if a subset of plots is required, specify a subset of the numbers 1:8.
#' See 'Details' below.
#' @param ask logical; if \code{TRUE}, the user is asked before each plot.
#' @param bins numeric; the number of bins shown in the PIT histogram or the
#' PIT Q-Q plot.
#' @param nrow numeric; (optional) number of rows in the plot grid.
#' @param ncol numeric; (optional) number of columns in the plot grid.
#' @param output_as_ggplot logical; if \code{TRUE}, the function would
#' return a list of \code{ggplot} objects; if \code{FALSE}, the
#' function would return an \code{ggarrange} object, which is a ggplot or a list of ggplot.
#' @param ... other arguments passed to or from other methods (currently unused).
#'
#' @return A ggarrange object, which is a ggplot or a list of ggplot for autoplot.
#' @import ggplot2
#' @import ggpubr
#' @import graphics
#' @import stats
#' @import grDevices
#' @details
#' The 'Scale-Location' plot, also called 'Spread-Location' plot, takes the square root of
#' the absolute standardized deviance residuals (\emph{sqrt|E|}) in order to diminish
#' skewness is much less skewed than than \emph{|E|} for Gaussian zero-mean E.
#'
#' The 'Scale-Location' plot uses the standardized deviance residuals while the
#' Residual-Leverage plot uses the standardized pearson residuals. They are given as
#' \eqn{R_i/\sqrt{1-h_{ii}}} where \eqn{h_{ii}} are the diagonal entries of the hat matrix.
#'
#' The Residuals-Leverage plot shows contours of equal Cook's distance for values of 0.5
#' and 1.
#'
#' There are two plots based on the non-randomized probability integral transformation (PIT)
#' using \code{\link{izipPIT}}. These are a histogram and a uniform Q-Q plot. If the
#' model assumption is appropriate, these plots should reflect a sample obtained
#' from a uniform distribution.
#'
#' There are also two plots based on the normal randomized residuals calculated
#' using \code{\link{izipnormRandPIT}}. These are a histogram and a normal Q-Q plot. If the model
#' assumption is appropriate, these plots should reflect a sample obtained from a normal
#' distribution.
#'
#' @seealso
#' \code{\link{izipPIT}}, \code{\link{izipnormRandPIT}},
#' and \code{\link{glm.izip}}.
#' @examples
#' data(bioChemists)
#' M_bioChem <- glm.izip(art ~ ., data = bioChemists)
#'
#' ## The default plots are shown
#' plot(M_bioChem) # or autoplot(M_bioChem)
#'
#' ## The plots for the non-randomized PIT
#' plot(M_bioChem, which = c(2, 3))
#' # or autoplot(M_bioChem, which = c(2,3))
#' @name izip_graphics
NULL

#' @rdname izip_graphics
#' @export
plot.izip <- function(x, which = c(1L, 2L, 6L, 8L),
                      ask = prod(par("mfcol")) < length(which) && dev.interactive(),
                      bins = 10,
                      ...) {
  # plot 1 deviance residuals vs fitted
  # plot 2 Histogram of non-randomized PIT
  # plot 3 q-q plot of non-randomized PIT
  # plot 4 Histogram of Randomized Residuals
  # plot 5 Q-Q Plot of Randomized Residuals
  # plot 6 sclae-location plot
  # plot 7 cook's distance vs obs number
  # plot 8 std pearson resid. vs leverage
  object <- x
  if (any(!(which %in% 1:8))) {
    cat("The acceptable ragne for option 'which' is 1:8.\n")
    cat("Anyting outside this range would be ignored.\n")
    cat("Use ?plot.izip to see which plots are available.\n")
  }
  show <- rep(FALSE, 8)
  show[which] <- TRUE
  if (ask) {
    oask <- devAskNewPage(TRUE)
    on.exit(devAskNewPage(oask))
  }
  if (any(show[c(1L, 6L)] == TRUE)) {
    dev_res <- object$d_res
  }
  if (show[1L]) {
    dev.hold()
    plot(object$linear_predictors, dev_res,
      main = "Residuals vs Fitted",
      ylab = "(Deviance) Residuals",
      xlab = paste(c("Linear Predicted values", object$call))
    )
    abline(h = 0, lty = 2)
    lines(lowess(object$linear_predictors, dev_res), col = "red")
    index.dev.res <- order(abs(dev_res), decreasing = TRUE)[1:3]
    text(object$linear_predictors[index.dev.res],
      dev_res[index.dev.res],
      labels = paste(index.dev.res), cex = 0.7, pos = 4
    )
    dev.flush()
  }
  if (show[2L]) {
    dev.hold()
    histizipPIT(object)
    dev.flush()
  }
  if (show[3L]) {
    dev.hold()
    qqizipPIT(object)
    dev.flush()
  }
  if (any(show[4L:5L] == TRUE)) {
    rt <- izipnormRandPIT(object)$rt
  }
  if (show[4L]) {
    dev.hold()
    hist(rt,
      main = "Histogram of Randomized Residuals", col = "royal blue",
      xlab = expression(r[t])
    )
    box()
    dev.flush()
  }
  if (show[5L]) {
    dev.hold()
    qqnorm(rt, main = "Q-Q Plot of Randomized Residuals")
    abline(0, 1, lty = 2, col = "black")
    dev.flush()
  }
  if (show[6L]) {
    dev.hold()
    std.dev.res <- rstandard.izip(object, type = "deviance")
    res <- sqrt(abs(std.dev.res))
    plot(object$linear_predictors, res,
      main = "Scale-Location", xlab = paste(c("Linear Predicted values", object$call)),
      ylab = expression(sqrt("|Std. deviance resid.|"))
    )
    lines(lowess(object$linear_predictors, res), col = "red")
    index.dev.res <- order(res, decreasing = TRUE)[1:3]
    text(object$linear_predictors[index.dev.res],
      dev_res[index.dev.res],
      labels = paste(index.dev.res), cex = 0.7, pos = 4
    )
    dev.flush()
  }
  if (any(show[7L:8L] == TRUE)) {
    rk <- object$rank
    h <- hatvalues.izip(object)
    std.pear <- rstandard.izip(object, type = "pearson")
    cook <- cooks.distance.izip(object)
    n <- length(cook)
    index.cook <- order(cook, decreasing = TRUE)[1:3]
  }
  if (show[7L]) {
    dev.hold()
    plot(cook,
      type = "h", main = "Cook's distance",
      xlab = paste(c("Obs. number", object$call)),
      ylab = "Approx. Cook's distance", ylim = c(0, ymx <- max(cook) * 1.075)
    )
    text(index.cook, cook[index.cook], labels = paste(index.cook), cex = 0.7, pos = 3)
    dev.hold()
  }
  if (show[8L]) {
    ylim <- extendrange(r = range(std.pear, na.rm = TRUE), f = 0.08)
    xlim <- extendrange(r = c(0, max(h, na.rm = TRUE)), f = 0.08)
    plot(h, std.pear,
      main = "Residuals vs Leverage",
      xlab = paste(c("Leverage", object$call)), ylab = "Std. Pearson resid.",
      xlim = xlim, ylim = ylim
    )
    abline(h = 0, v = 0, lty = 3, col = "gray")
    bound <- par("usr")
    x <- NULL
    curve(sqrt(rk * 0.5 * (1 - x) / x), 0.01, bound[2], add = TRUE, col = "red", lty = 2)
    curve(sqrt(rk * (1 - x) / x), 0.01, bound[2], add = TRUE, col = "red", lty = 2)
    curve(-sqrt(rk * 0.5 * (1 - x) / x), 0.01, bound[2], add = TRUE, col = "red", lty = 2)
    curve(-sqrt(rk * (1 - x) / x), 0.01, bound[2], add = TRUE, col = "red", lty = 2)
    legend("bottomleft",
      legend = "Cook's distance",
      lty = 2, col = 2, bty = "n"
    )
    xmax <- min(0.99, bound[2L])
    ymult <- sqrt(rk * (1 - xmax) / xmax)
    cook.levels <- c(0.5, 1)
    aty <- sqrt(cook.levels) * ymult
    axis(4,
      at = c(-rev(aty), aty), labels = paste(c(rev(cook.levels), cook.levels)),
      mgp = c(0.25, 0.25, 0), las = 2,
      tck = 0, cex.axis = 0.75, col.axis = 2
    )
    text(h[index.cook], std.pear[index.cook],
      labels = paste(index.cook),
      cex = 0.7, pos = 4
    )
    dev.flush()
  }
  invisible()
}

#' @rdname izip_graphics
#' @export
autoplot.izip <- function(x, which = c(1L, 2L, 6L, 8L), bins = 10,
                          ask = TRUE, nrow = NULL, ncol = NULL,
                          output_as_ggplot = TRUE) {
  # plot 1 deviance residuals vs fitted
  # plot 2 Histogram of non-randomized PIT
  # plot 3 q-q plot of non-randomized PIT
  # plot 4 Histogram of Randomized Residuals
  # plot 5 Q-Q Plot of Randomized Residuals
  # plot 6 sclae-location plot
  # plot 7 cook's distance vs obs number
  # plot 8 std pearson resid. vs leverage
  y <- linear_predictors <- index <- leg <- cook_level <- NULL
  object <- x
  if (any(!(which %in% 1:8))) {
    cat("The acceptable ragne for option 'which' is 1:8.\n")
    cat("Anyting outside this range would be ignored.\n")
    cat("Use ?gg_plot to see which plots are available.\n")
  }
  show <- rep(FALSE, 8)
  show[which] <- TRUE
  p <- vector("list", sum(show))
  show_count <- 0
  if (any(show[c(1L, 6L)] == TRUE)) {
    dev_res <- object$d_res
  }
  if (show[1L]) {
    index_dev_res <- order(abs(dev_res), decreasing = TRUE)[1:3]
    p_temp <- ggplot(data.frame(
      x = object$linear_predictors,
      y = dev_res
    )) +
      geom_point(aes(x = x, y = y)) +
      labs(
        title = "Residuals vs Fitted",
        x = paste(c("Linear Predicted values\n", object$call), collapse = ""),
        y = "(Deviance) Residuals"
      ) +
      geom_hline(yintercept = 0, linetype = 2) +
      geom_smooth(aes(x = x, y = y),
        formula = y ~ x, colour = "red", se = FALSE,
        method = "loess"
      ) +
      geom_text(aes(x = linear_predictors, y = dev_res, label = index),
        hjust = "inward", vjust = "outward",
        data =
          data.frame(
            linear_predictors =
              object$linear_predictors[index_dev_res[1:3]],
            dev_res = dev_res[index_dev_res[1:3]],
            index = paste(index_dev_res[1:3])
          )
      )
    show_count <- show_count + 1
    p[[show_count]] <- p_temp
  }
  if (show[2L]) {
    p_temp <- gg_histizipPIT(object)
    show_count <- show_count + 1
    p[[show_count]] <- p_temp
  }
  if (show[3L]) {
    p_temp <- gg_qqizipPIT(object)
    show_count <- show_count + 1
    p[[show_count]] <- p_temp
  }
  if (any(show[4L:5L] == TRUE)) {
    rt <- izipnormRandPIT(object)$rt
  }
  if (show[4L]) {
    p_temp <- ggplot(data.frame(rt = rt), aes(rt)) +
      geom_histogram(bins = 30, fill = "royal blue", colour = "royal blue") +
      labs(title = "Histogram of Randomized Residuals", x = expression(r[t]))
    show_count <- show_count + 1
    p[[show_count]] <- p_temp
  }
  if (show[5L]) {
    p_temp <- ggplot(data.frame(rt = rt), aes(sample = rt)) +
      stat_qq() +
      stat_qq_line() +
      labs(title = "QQ Plot for Randomized Residuals")
    show_count <- show_count + 1
    p[[show_count]] <- p_temp
  }
  if (show[6L]) {
    std_dev_res <- rstandard.izip(object, type = "deviance")
    res <- sqrt(abs(std_dev_res))
    index_res <- order(abs(res), decreasing = TRUE)[1:3]
    p_temp <- ggplot(data.frame(x = object$linear_predictors, y = res)) +
      geom_point(aes(x = x, y = y)) +
      labs(
        title = "Scale-Location",
        x = paste(c("Linear Predicted values \n", object$call), collapse = ""),
        y = expression(sqrt("|Std. deviance resid.|"))
      ) +
      geom_smooth(aes(x = x, y = y),
        formula = y ~ x, method = "loess", se = FALSE,
        colour = "red"
      ) +
      geom_text(aes(
        x = linear_predictors,
        y = res, label = index
      ),
      hjust = "inward", vjust = "outward",
      data = data.frame(
        linear_predictors =
          object$linear_predictors[index_res[1:3]],
        res = res[index_res[1:3]],
        index = index_res[1:3]
      )
      )
    show_count <- show_count + 1
    p[[show_count]] <- p_temp
  }
  if (any(show[7L:8L] == TRUE)) {
    rk <- object$rank
    h <- hatvalues.izip(object)
    std_pear <- rstandard.izip(object, type = "pearson")
    cook <- cooks.distance.izip(object)
    n <- length(cook)
    index_cook <- order(cook, decreasing = TRUE)[1:3]
  }
  if (show[7L]) {
    p_temp <- ggplot(data.frame(cook = cook, index = 1:n)) +
      geom_segment(aes(x = index, y = cook, xend = index, yend = 0)) +
      labs(
        title = "Cook's distance",
        x = paste(c("Obs number\n", object$call), collapse = ""),
        y = "Approx. Cook's distance"
      ) +
      ylim(0, max(cook) * 1.075) +
      geom_text(aes(
        x = index_cook, y = cook,
        label = index
      ),
      vjust = "outward", data =
        data.frame(
          index_cook = index_cook[1:3],
          cook = cook[index_cook[1:3]],
          index = index_cook[1:3]
        )
      )
    show_count <- show_count + 1
    p[[show_count]] <- p_temp
  }
  if (show[8L]) {
    options(warn = -1)
    ylim <- extendrange(r = range(std_pear, na.rm = TRUE), f = 0.08)
    xlim <- extendrange(r = c(0, max(h, na.rm = TRUE)), f = 0.08)
    xmax <- min(0.99, xlim[2])
    ymult <- sqrt(rk * (1 - xmax) / xmax)
    cook_levels <- c(0.5, 1)
    at_y <- sqrt(cook_levels) * ymult
    p_temp <- ggplot(data.frame(
      h = h,
      std_pear = std_pear,
      leg = "Cook's distance"
    )) +
      geom_point(aes(x = h, y = std_pear)) +
      labs(
        title = "Residuals vs Leverage",
        x = paste(c("Leverage \n", object$call), collapse = ""),
        y = "Std. Pearson resid."
      ) +
      xlim(xlim[1], xlim[2]) +
      ylim(ylim[1], ylim[2]) +
      geom_hline(yintercept = 0, linetype = 3, colour = "#999999", size = 1.5) +
      geom_vline(xintercept = 0, linetype = 3, colour = "#999999", size = 1.5) +
      stat_function(aes(colour = leg),
        fun = function(x) sqrt(rk * 0.5 * (1 - x) / x),
        xlim = c(0.01, xlim[2]),
        show.legend = TRUE, linetype = 2,
        na.rm = TRUE
      ) +
      stat_function(aes(colour = leg),
        fun = function(x) sqrt(rk * (1 - x) / x),
        xlim = c(0.01, xlim[2]),
        show.legend = TRUE, linetype = 2,
        na.rm = TRUE
      ) +
      stat_function(aes(colour = leg),
        fun = function(x) -sqrt(rk * 0.5 * (1 - x) / x),
        xlim = c(0.01, xlim[2]),
        show.legend = TRUE, linetype = 2,
        na.rm = TRUE
      ) +
      stat_function(aes(colour = leg),
        fun = function(x) -sqrt(rk * (1 - x) / x),
        xlim = c(0.01, xlim[2]),
        show.legend = TRUE, linetype = 2,
        na.rm = TRUE
      ) +
      geom_text(aes(
        x = h, y = std_pear,
        label = index
      ),
      hjust = "inward", vjust = "outward", data =
        data.frame(
          h = h[index_cook[1:3]],
          std_pear = std_pear[index_cook[1:3]],
          index = index_cook[1:3]
        ),
      na.rm = TRUE
      ) +
      geom_text(aes(x = xlim, y = at_y, label = cook_level),
        data = data.frame(
          xlim = rep(xlim[2], 4),
          at_y = c(-rev(at_y), at_y),
          cook_level = c(
            rev(cook_levels),
            cook_levels
          )
        ),
        colour = "red", hjust = "outward",
        vjust = "outward", na.rm = TRUE
      ) +
      theme(
        legend.justification = c(0, 0), legend.position = c(0, 0),
        legend.background = element_blank(),
        legend.title = element_blank()
      )
    show_count <- show_count + 1
    p[[show_count]] <- p_temp
    options(warn = 0)
  }
  p_ggarrange <- ggpubr::ggarrange(plotlist = p, ncol = ncol, nrow = nrow)
  if ((is.null(ncol) & is.null(nrow))) {
    print(p_ggarrange)
  } else if (class(p_ggarrange)[1] != "list") {
    print(p_ggarrange)
  } else {
    for (i in 1:length(p_ggarrange)) {
      if (ask) {
        invisible(readline(prompt = "Press <Return> to see next plot:"))
        print(p_ggarrange[[i]])
      }
    }
  }
  if (!output_as_ggplot) {
    p <- p_ggarrange
  }
  return(invisible(p))
  invisible()
}


#' Plot Diagnostic for a \code{tsglm.izip} Object
#'
#' Eleven plots (selectable by \code{which}) are currently available using ggplot or graphics:
#' a plot of observed vs fitted time series plot,
#' an ACF plot of Pearson residuals,
#' a PACF plot of Pearson residuals,
#' a plot of Pearson residuals against time,
#' a Normal Q-Q Plot of Pearson residuals,
#' an non-randomized PIT histogram,
#' an uniform Q-Q plot for non-randomized PIT,
#' a histogram of normal randomized residuals,
#' a Q-Q plot of the normal randomized residuals,
#' an ACF plot of the normal randomized residuals
#' a PACF plot of the normal randomized residuals
#'
#' By default, 6 plots (number 1, 6, 7, 8, 10 and 11 from this list of plots) are provided for \code{plot} and 5 plots (number 1, 6, 7, 10 and 11) are provided for \code{autoplot}
#'
#' @param x an object class 'tsizip' object, obtained from a call to \code{tsglm.izip}
#' @param object an object class 'tsizip' object, obtained from a call to \code{tsglm.izip}
#' @param which if a subset of plots is required, specify a subset of the numbers 1:11.
#' See 'Details' below.
#' @param ask logical; if \code{TRUE}, the user is asked before each plot.
#' @param bins numeric; the number of bins shown in the PIT histogram or the
#' PIT Q-Q plot.
#' @param nrow numeric; (optional) number of rows in the plot grid.
#' @param ncol numeric; (optional) number of columns in the plot grid.
#' @param output_as_ggplot logical; if \code{TRUE}, the function would
#' return a list of \code{ggplot} objects; if \code{FALSE}, the
#' function would return an \code{ggarrange} object, which is a ggplot or a list of ggplot.
#' @param ... other arguments passed to or from other methods (currently unused).
#'
#' @return A ggarrange object, which is a ggplot or a list of ggplot for autoplot.
#' @import ggplot2
#' @import ggpubr
#' @import graphics
#' @import stats
#' @import grDevices
#' @importFrom forecast ggAcf ggPacf Acf Pacf
#' @details
#' There are two plots based on the non-randomized probability integral transformation (PIT)
#' using \code{\link{izipPIT}}. These are a histogram and a uniform Q-Q plot. If the
#' model assumption is appropriate, these plots should reflect a sample obtained
#' from a uniform distribution.
#'
#' There are also two plots based on the normal randomized residuals calculated
#' using \code{\link{izipnormRandPIT}}. These are a histogram and a normal Q-Q plot. If the model
#' assumption is appropriate, these plots should reflect a sample obtained from a normal
#' distribution.
#'
#' @seealso
#' \code{\link{izipPIT}}, \code{\link{izipnormRandPIT}},
#' and \code{\link{tsglm.izip}}.
#' @examples
#' data(arson)
#' M_arson <- tsglm.izip(arson ~ 1, past_mean_lags = 1, past_obs_lags = c(1, 2))
#' ## The default plots are shown
#' plot(M_arson) # or autoplot(M_arson)
#'
#' ## The plots for the ACF and PACF of the normal randomized residuals
#' plot(M_arson, which = c(10, 11))
#' # or autoplot(M_arson, which = c(10,11))
#' @name tsizip_graphics
NULL


#' @rdname tsizip_graphics
#' @export
plot.tsizip <- function(x, which = c(1L, 3L, 5L, 7L, 8L, 9L),
                        ask = prod(par("mfcol")) < length(which) && dev.interactive(),
                        bins = 10, ...) {
  # plot 1: observed vs vs INGARCH
  # plot 2 ACF of Pearson Residuals
  # plot 3 PACF of Pearson Residuals
  # plot 4 Normal QQ Plot of Pearson Residauls
  # plot 5 Histogram of Uniform PIT
  # plot 6 QQ plot of Uniform PIT
  # plot 7 Histogram of Randomized Residuals
  # plot 8 QQ plot of Randomized Residuals
  # plot 9 ACF of randomized residuals
  # Plot 10 PACF of randomized residuals
  show <- rep(FALSE, 11)
  show[which] <- TRUE
  if (ask) {
    oask <- devAskNewPage(TRUE)
    on.exit(devAskNewPage(oask))
  }
  if (show[1L]) {
    dev.hold()
    plot.ts(x$y,
      main = "Observed vs INGARCH", ylab = "Counts",
      xlab = "Time", col = NA
    )
    lines(x$fitted_values, col = "blue", lty = 1)
    lines(x$y, col = "black", lty = 2)
    par(xpd = NA)
    mfrow <- par("mfrow")
    graph.param <- legend("top",
      legend = c("obs", "INGARCH"),
      lty = c(2, 1), ncol = 2, cex = 0.7 -
        (mfrow[1] - 1) / 10 - (mfrow[2] - 1) / 10, bty = "n",
      plot = FALSE
    )
    legend(graph.param$rect$left, graph.param$rect$top +
      graph.param$rect$h,
    legend = c("obs", "INGARCH"),
    pch = c(NA, NA), col = c("black", "blue"),
    lwd = c(1, 1), lty = c(2, 1),
    ncol = 2, cex = 0.7 - (mfrow[1] - 1) / 10 - (mfrow[2] -
      1) / 10, bty = "n", text.font = 4
    )
    par(xpd = FALSE)
    dev.flush()
  }
  if (show[2L]) {
    dev.hold()
    acf(resid(x, type = "pearson"), main = "ACF of Pearson Residuals")
    dev.flush()
  }
  if (show[3L]) {
    dev.hold()
    pacf(resid(x, type = "pearson"), main = "PACF of Pearson Residuals")
    dev.flush()
  }
  if (show[4L]) {
    dev.hold()
    plot.ts(resid(x, type = "pearson"), ylab = "Residuals", type = "h", main = "Pearson Residuals")
    dev.flush()
  }
  if (show[5L]) {
    dev.hold()
    qqnorm(resid(x, type = "pearson"), ylab = "Residuals", main = "Normal QQ Plot of Pearson Residuals")
    qqline(resid(x, type = "pearson"))
    dev.flush()
  }
  if (show[6L]) {
    dev.hold()
    histizipPIT(x)
    dev.flush()
  }
  if (show[7L]) {
    dev.hold()
    qqizipPIT(x)
    dev.flush()
  }
  if (any(show[8L:11L] == TRUE)) {
    rt <- izipnormRandPIT(x)$rt
  }
  if (show[8L]) {
    dev.hold()
    hist(rt,
      main = "Histogram of Randomized Residuals", col = "royal blue",
      xlab = expression(r[t])
    )
    box()
    dev.flush()
  }
  if (show[9L]) {
    dev.hold()
    qqnorm(rt, main = "QQ Plot of Randomized Residuals")
    qqline(rt)
    dev.flush()
  }
  if (show[10L]) {
    dev.hold()
    acf(rt, main = "ACF of Randomized Residuals")
    dev.flush()
  }
  if (show[11L]) {
    dev.hold()
    pacf(rt, main = "PACF of Randomized Residuals")
    dev.flush()
  }
  invisible()
}

#' @rdname tsizip_graphics
#' @export
autoplot.tsizip <- function(object, which = c(1L, 6L, 7L, 10L, 11L), bins = 10,
                            ask = TRUE, nrow = NULL, ncol = NULL,
                            output_as_ggplot = TRUE,
                            ...) {
  # plot 1: observed vs Fixed vs GLARMA
  # plot 2: ACF of Pearson Residuals
  # plot 3: PACF of Pearson residuals
  # plot 4: Pearson Residuals
  # plot 5: Normal QQ Plot of Pearson Residauls
  # plot 6: Histogram of Uniform PIT
  # plot 7: QQ plot of Uniform PIT
  # plot 8: Histogram of Randomized Residuals
  # plot 9: QQ plot of Randomized Residuals
  # plot 10: ACF of randomized residuals
  # plot 11: ACF of randomized residuals
  if (any(!(which %in% 1:11))) {
    cat("The acceptable ragne for option 'which' is 1:11.\n")
    cat("Anyting outside this range would be ignored.\n")
    cat("Use ?gg_plot.spglarma to see which plots are available.\n")
  }
  y <- x <- series <- index <- r <- NULL
  show <- rep(FALSE, 11)
  show[which] <- TRUE
  p <- vector("list", sum(show))
  show_count <- 0
  if (show[1L]) {
    df <- data.frame(
      y = c(
        object$y,
        object$fitted_values
      ),
      x = rep(1:length(object$y), 2),
      series = rep(
        c("Observed", "INGARCH"),
        rep(length(object$y), 2)
      )
    )
    p_temp <- ggplot(df) +
      geom_line(aes(
        y = y, x = x, colour = series,
        linetype = series
      )) +
      labs(
        x = "Time", y = "Counts",
        subtitle = "Observed vs INGARCH"
      ) +
      theme(legend.position = "top") +
      scale_color_manual(values = c("black", "blue"))
    show_count <- show_count + 1
    p[[show_count]] <- p_temp
  }
  if (show[2L]) {
    p_temp <-
      forecast::ggAcf(resid(object, type = "pearson")) +
      labs(title = "ACF of Pearson Residuals")
    show_count <- show_count + 1
    p[[show_count]] <- p_temp
  }
  if (show[3L]) {
    p_temp <-
      forecast::ggPacf(resid(object, type = "pearson")) +
      labs(title = "PACF of Pearson Residuals")
    show_count <- show_count + 1
    p[[show_count]] <- p_temp
  }
  if (show[4L]) {
    p_temp <- ggplot(
      data.frame(
        index = 1:length(resid(object, type = "pearson")),
        r = resid(object, type = "pearson")
      ),
      aes(x = index, y = r)
    ) +
      geom_segment(aes(
        x = index, y = r,
        xend = index,
        yend = 0
      )) +
      labs(title = "Pearson residuals", x = "Time", y = "Residuals")
    show_count <- show_count + 1
    p[[show_count]] <- p_temp
  }
  if (show[5L]) {
    p_temp <- ggplot(data.frame(r = resid(object, type = "pearson")), aes(sample = r)) +
      stat_qq() +
      stat_qq_line() +
      labs(title = "QQ Plot of Pearson Residuals")
    show_count <- show_count + 1
    p[[show_count]] <- p_temp
  }
  if (show[6L]) {
    p_temp <- gg_histizipPIT(object)
    show_count <- show_count + 1
    p[[show_count]] <- p_temp
  }
  if (show[7L]) {
    p_temp <- gg_qqizipPIT(object)
    show_count <- show_count + 1
    p[[show_count]] <- p_temp
  }
  if (any(show[8L:11L] == TRUE)) {
    rt <- izipnormRandPIT(object)$rt
  }
  if (show[8L]) {
    p_temp <- ggplot(data.frame(rt = rt), aes(rt)) +
      geom_histogram(bins = 30) +
      labs(title = "Histogram of Randomized Residuals", x = expression(r[t]))
    show_count <- show_count + 1
    p[[show_count]] <- p_temp
  }
  if (show[9L]) {
    p_temp <- ggplot(data.frame(rt = rt), aes(sample = rt)) +
      stat_qq() +
      stat_qq_line() +
      labs(title = "QQ Plot of Randomized Residuals")
    show_count <- show_count + 1
    p[[show_count]] <- p_temp
  }
  if (show[10L]) {
    p_temp <- forecast::ggAcf(rt) +
      labs(title = "ACF of Randomized Residuals")
    show_count <- show_count + 1
    p[[show_count]] <- p_temp
  }
  if (show[11L]) {
    p_temp <- forecast::ggPacf(rt) +
      labs(title = "PACF of Randomized Residuals")
    show_count <- show_count + 1
    p[[show_count]] <- p_temp
  }
  p_ggarrange <- ggarrange(plotlist = p, ncol = ncol, nrow = nrow)
  if ((is.null(ncol) & is.null(nrow))) {
    if (all(which - c(1L, 6L, 7L, 10L, 11L) == 0)) {
      p_ggarrange <- ggarrange(p[[1]],
        ggarrange(p[[2]], p[[3]], p[[4]], p[[5]],
          ncol = 2, nrow = 2
        ),
        ncol = 1, nrow = 2
      )
    }
    print(p_ggarrange)
  } else if (class(p_ggarrange)[1] != "list") {
    print(p_ggarrange)
  } else {
    for (i in 1:length(p_ggarrange)) {
      if (ask) {
        invisible(readline(prompt = "Press <Return> to see next plot:"))
        print(p_ggarrange[[i]])
      }
    }
  }
  if (!output_as_ggplot) {
    p <- p_ggarrange
  }
  return(invisible(p))
}
