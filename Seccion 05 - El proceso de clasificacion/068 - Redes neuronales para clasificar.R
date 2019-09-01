install.packages("nnet")
library(nnet)
library(caret)
library(ROCR)

bn <- read.csv("Seccion 05 - El proceso de clasificacion/banknote-authentication.csv")
bn$class <- factor(bn$class)

t.id <- createDataPartition(bn$class, 
                            p = 0.7,
                            list = F)

mod <- nnet(class ~ .,
            data = bn[t.id,],
            size = 3,
            maxit = 10000,
            decay = 0.001,
            rang = 0.05)

pred <- predict(mod, 
                newdata = bn[-t.id,],
                type = "class",
                na.action = na.omit ) # si quisieramos omitir los na

table(bn[-t.id,]$class, 
      pred,
      dnn = c("Actual", "Predichos")) 


# con esto podemos hacer diagramas rocr
pred2 <- predict(mod, 
                newdata = bn[-t.id,],
                type = "raw")
perf <- performance(prediction(pred2, bn[-t.id,"class"]),
                    "tpr", 
                    "fpr")

plot(perf)
