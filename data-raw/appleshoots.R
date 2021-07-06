## code to prepare `appleshoots` dataset goes here
install.packages("agridat")
library(agridat)
data(ridout.appleshoots)
appleshoots <- ridout.appleshoots
usethis::use_data(appleshoots, overwrite = TRUE)
