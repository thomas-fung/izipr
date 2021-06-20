##' Catch *and* save both errors and warnings, and in the case of
##' a warning, also keep the computed result.
##'
##' @title tryCatch both warnings (with value) and errors
##' @param expr an \R expression to evaluate
##' @return a list with 'value' and 'warning', where
##'   'value' may be an error caught.
##' @author Martin Maechler;
##' Copyright (C) 2010-2012  The R Core Team
tryCatch.W.E <- function(expr)
{
  W <- NULL
  w.handler <- function(w){ # warning handler
    W <<- w
    invokeRestart("muffleWarning")
  }
  list(value = withCallingHandlers(tryCatch(expr, error = function(e) e),
                                   warning = w.handler),
       warning = W)
}


#' Combine R Objects by Columns
#'
#' Take a sequence of vector, matrix or data-frame arguments and combine them by columns.
#' \code{CBIND} is used within the package over \code{cbind} to recycle the shorter
#' arguments so that their number of rows would match.
#'
#' @param ... (generalized) vectors or matrices. These can be given as named arguments
#' @param deparse.level integer; deparse.level = 0 constructs no labels,
#' deparse.level = 1 (the default) or > 1 constructs labels from the arguments names.
#'
CBIND <- function(..., deparse.level = 1) {
  dots <- list(...)
  len <- sapply(dots, length)
  dots <- lapply(seq_along(dots),
                 function(i, x, len) rep(x[[i]], length.out = len),
                 x = dots, len = max(len))
  do.call(cbind, c(dots, deparse.level = deparse.level))
}

#' Test for a whole number
#'
#' Test for integer/whole number vector
#'
#' @param x numeric vector to be tested
#' @param tol numeric; precision level
#'
is.wholenumber <- function(x, tol = .Machine$double.eps^0.5){
  abs(x - round(x)) < tol
}

