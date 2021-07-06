data(bioChemists)
M_bioChem <- glm.izip(art ~ ., data = bioChemists)

expect_doppelganger <- function(title,
                                fig,
                                writer = vdiffr::write_svg,
                                cran = FALSE) {
  fig_name <- vdiffr:::str_standardise(title)
  testcase <- vdiffr:::make_testcase_file(fig_name)
  writer(fig, testcase, title)
  file <- paste0(fig_name, ".svg")
  withCallingHandlers(
    testthat::expect_snapshot_file(testcase,
      name = file, cran = cran
    ),
    expectation_failure = function(cnd) {
      if (vdiffr:::is_snapshot_stale(title, testcase)) {
        testthat::skip(
          paste_line(
            "SVG snapshot generated under a different vdiffr version.",
            i = "Please update your snapshots."
          )
        )
      }
      if (!is.null(snapshotter <-
        vdiffr:::get_snapshotter())) {
        path_old <- vdiffr:::snapshot_path(snapshotter, file)
        path_new <-
          vdiffr:::snapshot_path(snapshotter, paste0(
            fig_name,
            ".new.svg"
          ))
        if (all(file.exists(path_old, path_new))) {
          vdiffr:::push_log(fig_name, path_old, path_new)
        }
      }
    }
  )
}
disp_plot <- function(which) {
  plot(M_bioChem, which = which)
}
set.seed(200253046)
test_that("Testing graphics", {
  expect_doppelganger("disp-plot1", disp_plot(1))
  expect_doppelganger("disp-plot2", disp_plot(2))
  expect_doppelganger("disp-plot3", disp_plot(3))
  expect_doppelganger("disp-plot6", disp_plot(6))
  expect_doppelganger("disp-plot7", disp_plot(7))
  expect_doppelganger("disp-plot8", disp_plot(8))
  disp_ggplot <- autoplot(M_bioChem, which = 1:8)
  expect_doppelganger("disp-ggplot", disp_ggplot)
})
