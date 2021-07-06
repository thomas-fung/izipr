data(bioChemists)
M_bioChem <- glm.izip(art ~ ., data = bioChemists)
M_bioChem1 <- glm.izip(art ~ .,
  data = bioChemists,
  ref.lambda = 1
)
newdataframe <- data.frame(
  fem = "Women", mar = "Married", kid5 = 2,
  phd = 3, ment = 8
)
data(arson)
M_arson <- tsglm.izip(arson ~ 1, past_mean_lags = 1, past_obs_lags = c(1, 2))



test_that("Testing main estimation function", {
  expect_snapshot(M_bioChem)
  expect_snapshot(M_bioChem$coefficients)
  expect_snapshot(M_bioChem$loglik)
  expect_snapshot(round(M_bioChem$vcov,5))
  expect_snapshot(M_bioChem1)
  expect_snapshot(M_bioChem1$coefficients)
  expect_snapshot(M_bioChem1$loglik)
  expect_snapshot(M_bioChem1$vcov)
})

test_that("Testing main estimation ts function", {
  expect_snapshot(M_arson)
  expect_snapshot(M_arson$coefficients)
  expect_snapshot(M_arson$loglik)
  expect_snapshot(M_arson$vcov)
})




test_that("Testing function that extracting info from glm.izip", {
  expect_snapshot(coef(M_bioChem))
  expect_equal(coefficients(M_bioChem), coef(M_bioChem))
  expect_snapshot(summary(M_bioChem))
  expect_snapshot(logLik(M_bioChem))
  expect_snapshot(nobs(M_bioChem))
  expect_snapshot(AIC(M_bioChem))
  expect_snapshot(AIC(M_bioChem, k = log(nobs(M_bioChem))))
  expect_snapshot(coef(M_bioChem))
  expect_snapshot(fitted(M_bioChem))
  expect_snapshot(model.frame(M_bioChem))
  expect_snapshot(residuals(M_bioChem))
  expect_equal(resid(M_bioChem), residuals(M_bioChem))
  expect_equal(
    residuals(M_bioChem),
    residuals(M_bioChem, type = "deviance")
  )
  expect_snapshot(round(residuals(M_bioChem,
                                  type = "response"), 5))
  expect_snapshot(residuals(M_bioChem, type = "pearson"))
  expect_snapshot(influence(M_bioChem))
  expect_snapshot(hatvalues(M_bioChem))
  expect_snapshot(rstandard(M_bioChem))
  expect_snapshot(round(rstandard(M_bioChem,
                                  type = "pearson"), 5))
  expect_snapshot(cooks.distance(M_bioChem))
  expect_snapshot(round(predict(M_bioChem,
                                type = "link"), 5))
  expect_snapshot(predict(M_bioChem, type = "response"))
  expect_equal(
    predict(M_bioChem, type = "link"),
    predict(M_bioChem)
  )
  expect_snapshot(
    round(predict(M_bioChem, se.fit = TRUE)$se.fit, 5))
  expect_equal(
    predict(M_bioChem, type = "link", se.fit = TRUE),
    predict(M_bioChem, se.fit = TRUE)
  )
  expect_snapshot(
    round(predict(M_bioChem,
    type = "response",
    se.fit = TRUE)$se.fit, 5))
  expect_snapshot(
    predict(M_bioChem,
      newdata = newdataframe, type = "response"
    )
  )
  expect_snapshot(
    predict(M_bioChem,
      newdata = newdataframe, type = "link"
    )
  )
  expect_snapshot(
    predict(M_bioChem,
      se.fit = TRUE,
      newdata = newdataframe, type = "response"
    )
  )
  expect_snapshot(
    predict(M_bioChem,
      se.fit = TRUE,
      newdata = newdataframe, type = "link"
    )
  )
})


test_that("Testing function that extracting info from tsglm.izip", {
  expect_snapshot(coef(M_arson))
  expect_equal(coefficients(M_arson), coef(M_arson))
  expect_snapshot(summary(M_arson))
  expect_snapshot(logLik(M_arson))
  expect_snapshot(nobs(M_arson))
  expect_snapshot(AIC(M_arson))
  expect_snapshot(AIC(M_arson, k = log(nobs(M_arson))))
  expect_snapshot(coef(M_arson))
  expect_snapshot(fitted(M_arson))
  expect_snapshot(model.frame(M_arson))
  expect_snapshot(residuals(M_arson))
  expect_equal(resid(M_arson), residuals(M_arson))
  expect_equal(
    residuals(M_arson),
    residuals(M_arson, type = "response")
  )
  expect_snapshot(residuals(M_arson, type = "pearson"))
})


test_that("Testing broom for iZIP", {
  expect_snapshot(glance(M_bioChem))
  expect_snapshot(tidy(M_bioChem))
  expect_snapshot(tidy(M_bioChem, conf.int = TRUE))
  expect_snapshot(tidy(M_bioChem, conf.int = TRUE, exponentiate = TRUE))
  expect_snapshot(tidy(M_bioChem, exponentiate = TRUE))
  expect_snapshot(augment(M_bioChem))
  expect_equal(
    augment(M_bioChem),
    augment(M_bioChem, type.predict = "link")
  )
  expect_snapshot(augment(M_bioChem, se_fit = TRUE))
  expect_snapshot(augment(M_bioChem, type.predict = "response"))
  expect_snapshot(augment(M_bioChem, type.predict = "response", se_fit = TRUE))
  expect_equal(
    augment(M_bioChem,
      newdata = newdataframe,
      type.predict = "link"
    ),
    augment(M_bioChem, newdata = newdataframe)
  )
  expect_snapshot(augment(M_bioChem, newdata = newdataframe, se_fit = TRUE))
  expect_equal(
    augment(M_bioChem, newdata = newdataframe, se_fit = TRUE),
    augment(M_bioChem,
      newdata = newdataframe, type.predict = "link",
      se_fit = TRUE
    )
  )
  expect_snapshot(augment(M_bioChem,
    newdata = newdataframe,
    type.predict = "response"
  ))
  expect_snapshot(augment(M_bioChem,
    newdata = newdataframe,
    type.predict = "response", se_fit = TRUE
  ))
  expect_snapshot(augment(M_bioChem, type.residuals = "pearson"))
  expect_equal(
    augment(M_bioChem,
      newdata = newdataframe,
      type.residuals = "deviance"
    ),
    augment(M_bioChem,
      newdata = newdataframe,
      type.residuals = "pearson"
    )
  )
})
