library(randomForest)
library(caret)

bh <- read.csv("Seccion 06 - Regresion/BostonHousing.csv")

set.seed(2018)

t.id <- createDataPartition(bh$MEDV,
                            p = 0.7,
                            list = F)

mod <- randomForest(x = bh[t.id, 1:13],
                    y = bh[t.id, 14],
                    ntree = 1000,
                    xtest = bh[-t.id, 1:13],
                    ytest = bh[-t.id, 14],
                    importance = T,
                    keep.forest = T)
mod

mod$importance


plot(bh[t.id,]$MEDV,
     predict(mod, bh[t.id,]),
     xlab = "Actuales",
     ylab = "Predichos")
abline(0,1)



plot(bh[-t.id,]$MEDV,
     predict(mod, bh[-t.id,]),
     xlab = "Actuales",
     ylab = "Predichos")
abline(0,1)
