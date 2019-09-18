library(caret)

auto <-read.csv("Seccion 06 - Regresion/auto-mpg.csv")

auto$cylinders <- factor(auto$cylinders,
                         levels = c(3,4, 5,6,8),
                         labels = c("3 cyl", "4 cyl", "5 cyl", "6 cyl", "8 cyl"))

set.seed(2018)

t.id <- createDataPartition(auto$mpg,
                            p = 0.7,
                            list = F)

names(auto)

mod <- lm(mpg ~ .,
          data = auto[t.id, -c(1, 8, 9)])

mod

# mpg = 37.284202 + 
#       6.231475 * 4Cyl + 
#       8.248195 * 5Cyl + 
#       2.131026 * 6Cyl + 
#       4.568171 * 8Cyl + 
#       0.002245 * displacement +
#       -0.057543 * horsepower +
#       -0.00466 * weight + 
#       0.050745 * acceleration

summary(mod)

boxplot(mod$residuals)

sqrt(mean((mod$fitted.values - auto[t.id,]$mpg)^2))

pred <- predict(mod, auto[-t.id, -c(1,8,9)])
sqrt(mean((pred - auto[-t.id,]$mpg)^2))

auto2 <- auto[-t.id,]
auto2$pred <- pred

par(mfrow=c(2,2))
plot(mod)


#############################################################
# 80. Opciones para las fórmulas de un modelo lineal
#############################################################
#categiria de referencia
auto <- within(auto, cylinders <- relevel(cylinders, ref="4 cyl"))

mod <- lm(mpg ~ .,
          data = auto[t.id, -c(1, 8, 9)])
mod
pred <- predict(mod, auto[-t.id, -c(1,8,9)])
sqrt(mean((pred - auto[-t.id,]$mpg)^2))
plot(mod)
auto2$pred2 <- pred


#############################################################
# 81. La función step para simplificar el modelo lineal
#############################################################
library(MASS)
mod
summary(mod)
step.model <- stepAIC(mod, direction = "backward")
summary(step.model)
