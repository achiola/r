install.packages("rpart")
install.packages("rpart.plot")

library(rpart)
library(rpart.plot)  
library(caret)

bh <- read.csv("Seccion 06 - Regresion/BostonHousing.csv")

t.id <- createDataPartition(bh$MEDV,
                            p = 0.7,
                            list = F)


bfit <- rpart(MEDV ~ .,
              data = bh[t.id,])
bfit


prp(bfit,
    type = 2,
    nn = T,
    fallen.leaves = T,
    faclen = 4,
    varlen = 8,
    shadow.col = "gray")

bfit$cptable

plotcp(bfit)

bfitpruned <- prune(bfit, cp = 0.02357120)
prp(bfitpruned,
    type = 2,
    nn = T,
    fallen.leaves = T,
    faclen = 4,
    varlen = 8,
    shadow.col = "gray")


preds <- predict(bfitpruned, bh[t.id,])
sqrt(mean((preds - bh[t.id,]$MEDV)^2))

preds <- predict(bfitpruned, bh[-t.id,])
sqrt(mean((preds - bh[-t.id,]$MEDV)^2))

preds <- predict(bfit, bh[t.id,])
sqrt(mean((preds - bh[t.id,]$MEDV)^2))

preds <- predict(bfit, bh[-t.id,])
sqrt(mean((preds - bh[-t.id,]$MEDV)^2))
