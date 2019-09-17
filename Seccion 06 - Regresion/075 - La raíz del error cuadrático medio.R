d <- read.csv("Seccion 06 - 75. La raíz del error cuadrático medio/rmse.csv")

rmse <- sqrt(mean((d$price - d$pred)^2))
rmse

plot(d$price, 
     d$pred,
     xlab = "Actual",
     ylab = "Predicho")
abline(0,1)

rmse.f <- function(actual, predicted){
  return(sqrt(mean((actual - predicted)^2)))
}
rmse.f(d$price, d$pred)
