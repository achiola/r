library(rpart)
library(rpart.plot)  
library(caret)

ed <- read.csv("Seccion 06 - Regresion/education.csv")
ed$region <- factor(ed$region)

t.id <- createDataPartition(ed$expense,
                            p = 0.7,
                            list = F)
fit <- rpart(expense ~ region+urban+income+under18,
             data = ed[t.id,])

prp(fit,
    type = 2,
    nn = T,
    fallen.leaves = T,
    faclen = 4,
    varlen = 8,
    shadow.col = "gray")

pred <- predict(fit, ed[t.id,])
sqrt(mean((pred - ed[t.id,]$expense)^2))

#bagging
install.packages("ipred")
library(ipred)
bagging.fit <- bagging(expense ~ region+urban+income+under18, 
                       data = ed[t.id,])
prediction.t <- predict(bagging.fit, ed[t.id,])
sqrt(mean((prediction.t - ed[t.id,]$expense)^2))

#boosting
install.packages("gbm")
library(gbm)
gbm.fit <- gbm(expense ~ region+urban+income+under18,
               data = ed,
               distribution = "gaussian")
