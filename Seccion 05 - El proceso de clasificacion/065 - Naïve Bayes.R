library(e1071)
library(caret)

ep = read.csv("Seccion 05 - El proceso de clasificacion/electronics-purchase.csv")

set.seed(2018)

t.ids <- createDataPartition(ep$Purchase,
                             p = 0.67,
                             list = F)

mod <- naiveBayes(Purchase ~ .,
                  data = ep[t.ids,])

mod

pred <- predict(mod, ep[-t.ids,])

tab <- table(ep[-t.ids,]$Purchase, 
             pred,
             dnn = c("Actual","Predicho"))
confusionMatrix(tab)
