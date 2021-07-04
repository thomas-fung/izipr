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
is.wholenumber <- function(x, tol = .Machine$double.eps^0.5){
  abs(x - round(x)) < tol
}

#' @keywords internal
#' @importFrom tibble as_tibble add_column
as_augment_tibble <- function(data) {
  # Imported from the broom package
  if (inherits(data, "matrix") & is.null(colnames(data))) {
    stop(
      "The supplied `data`/`newdata` argument was an unnamed matrix. ",
      "Please supply a matrix or dataframe with column names."
    )
  }
  tryCatch(df <- tibble::as_tibble(data), error = function(cnd) {
    stop("Could not coerce data to `tibble`. Try explicitly passing a",
         "dataset to either the `data` or `newdata` argument.",
         call. = FALSE
    )
  })
  if (has_rownames(data)) {
    df <- tibble::add_column(df,
                             .rownames = rownames(data),
                             .before = TRUE
    )
  }
  df
}

#' @keywords internal
format.perc <- function(probs, digits) {
  # Imported from the stats package
  paste(
    format(100 * probs, trim = TRUE, scientific = FALSE, digits = digits),
    "%"
  )
}


#' @keywords internal
data_error <- function(cnd) {
  # Imported from the broom package
  stop("Must specify either `data` or `newdata` argument.",
       call. = FALSE
  )
}

#' @keywords internal
#' @importFrom stringr str_length
#' @importFrom purrr map2
#' @importFrom tibble as_tibble_row
as_glance_tibble <- function(..., na_types) {
  # Imported from the broom package
  cols <- list(...)
  if (length(cols) != stringr::str_length(na_types)) {
    stop(
      "The number of columns provided does not match the number of ",
      "column types provided."
    )
  }
  na_types_long <- parse_na_types(na_types)
  entries <- purrr::map2(cols, na_types_long, function(.x,
                                                       .y) {
    if (length(.x) == 0) {
      .y
    } else {
      .x
    }
  })
  tibble::as_tibble_row(entries)
}

#' @keywords internal
#' @importFrom purrr  map
#' @importFrom stringr str_split
parse_na_types <- function(s) {
  # Imported from the broom package
  positions <- unlist(purrr::map(
    stringr::str_split(s, pattern = ""),
    match,
    table = names(na_types_dict)
  ))

  unname(unlist(na_types_dict[positions]))
}

#' @keywords internal
#' @importFrom rlang na_int na_lgl
na_types_dict <- list(
  # Imported from the broom package
  "r" = NA_real_,
  "i" = rlang::na_int,
  "c" = NA_character_,
  "l" = rlang::na_lgl
)

#' @keywords internal
#' @importFrom tibble is_tibble
has_rownames <- function(df) {
  # Imported from the broom package.
  # Notice that this is difference to the same function in tibble.
  if (tibble::is_tibble(df)) {
    return(FALSE)
  }
  any(rownames(df) != as.character(1:nrow(df)))
}

#' @keywords internal
#' @importFrom dplyr mutate_at vars
exponentiate <- function(data) {
  # Imported from the broom package.
  estimate <- conf.low <- conf.high <- NULL
  data <- dplyr::mutate_at(data, dplyr::vars(estimate), exp)
  if ("conf.low" %in% colnames(data)) {
    data <- dplyr::mutate_at(data, dplyr::vars(conf.low, conf.high), exp)
  }
  data
}
