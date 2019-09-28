install.packages("devtools")

library(nnet)
library(caret)
library(devtools)

bh <- read.csv("Seccion 06 - Regresion/BostonHousing.csv")

set.seed(2018)

t.id <- createDataPartition(bh$MEDV, 
                            p = 0.7,
                            list = F)

summary(bh$MEDV)

#vamos a escalar el medv
fit <- nnet(MEDV/50 ~ .,
            data = bh[t.id,],
            size = 6,
            decay = 0.1,
            maxit = 1000,
            linout = T)

source_url("https://gist.githubusercontent.com/fawda123/7471137/raw/466c1474d0a505ff044412703516c34f1a4684a5/nnet_plot_update.r")
plot(fit, max.sp = T)

sqrt(mean((fit$fitted.values*50-bh[t.id,"MEDV"])^2))

pred <- predict(fit, bh[-t.id, ])

predictions <- bh[-t.id, ]
predictions$pred <- pred*50
sqrt(mean((pred*50-bh[-t.id,"MEDV"])^2))
