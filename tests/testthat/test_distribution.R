test_that("Test pizip", {
  expect_snapshot(pizip(5, 4, 0.5))
  expect_snapshot(pizip(c(5, 4), 4, 0.5, ref.lambda = c(2, 1)))
  expect_snapshot(pizip(5, 4, 0.5, ref.lambda = 2))
  expect_equal(pizip(-1, 4, 0.5), 0)
  expect_snapshot(pizip(5, 4, 1.5))
  expect_snapshot_error(pizip(1.5))
  expect_snapshot_error(pizip(1.5, mu = 1.5, nu = 1.5, pi = 0.9))
})

test_that("Test dizip", {
  expect_snapshot(dizip(5, 4, 0.5))
  expect_snapshot(dizip(c(5, 4), 4, 0.5, ref.lambda = c(2, 1)))
  expect_snapshot(dizip(5.5, 4, 0.5))
  expect_snapshot(dizip(-1, 4, 0.5))
  expect_snapshot_error(dizip(1.5))
  expect_snapshot_error(dizip(1.5, mu = 1.5, nu = 1.5, pi = 0.9))
})

test_that("Test qizip", {
  expect_snapshot(qizip(0.2, 4, 0.5))
  expect_snapshot(qizip(c(0.2, 0.4), 4, 0.5, ref.lambda = c(2, 1)))
  expect_snapshot(qizip(0, 4, 0.5))
  expect_snapshot(qizip(1.1, 4, 0.5))
  expect_snapshot(qizip(-1, 4, 0.5))
  expect_snapshot_error(qizip(1.5))
  expect_snapshot_error(qizip(1.5, mu = 1.5, nu = 1.5, pi = 0.9))
})

test_that("Test rizip", {
  expect_length(rizip(20, 4, 0.5), 20)
  expect_snapshot_error(rizip(20))
  expect_snapshot_error(rizip(20, mu = 1.5, nu = 1.5, pi = 0.9))
})
