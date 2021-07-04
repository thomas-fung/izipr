data(bioChemists)
M_bioChem.full <- glm.izip(art ~ ., data = bioChemists)
M_bioChem.full2 <- glm.izip(art ~ fem + mar + kid5 + phd + ment,
                            data = bioChemists)
M.bioChem.null <- update(M_bioChem.full, . ~ . - phd)

test_that("Testing inference", {
  expect_snapshot(update(M_bioChem.full, . ~ . - phd))
  expect_snapshot(update(M_bioChem.full2, . ~ . - phd))
  expect_equal(update(M_bioChem.full, . ~ . - phd)$coefficients,
               update(M_bioChem.full2, . ~ . - phd)$coefficients)
  expect_equal(update(M_bioChem.full, . ~ . - phd)$logLik,
               update(M_bioChem.full2, . ~ . - phd)$logLik)
  expect_snapshot(iziplrtest(M_bioChem.full, M.bioChem.null))
  expect_snapshot(confint(M_bioChem.full))
  expect_snapshot(confint(M_bioChem.full, param = "ment", level = 0.9))
}
)
