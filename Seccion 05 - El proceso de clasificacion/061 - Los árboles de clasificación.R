install.packages("rpart")
install.packages("rpart.plot")
install.packages("caret")
library(rpart)
library(rpart.plot)
library(caret)

banknote <- read.csv("Seccion 05 - El proceso de clasificacion/banknote-authentication.csv")

set.seed(2018)

training.ids <- createDataPartition(banknote$class, p=0.7, list = F)

#class ~ . = class ~ [y todas las variables del df]
#class ~ . = class ~ variance + skew + cutsosis, entropy
mod <- rpart(class ~ ., 
             data = banknote[training.ids,],
             method = "class",
             control = rpart.control(minsplit = 20, cp = 0.01))

mod

prp(mod, 
    type = 2, 
    extra = 104, 
    nn = T, 
    fallen.leaves = T, 
    faclen = 4,
    varlen = 8,
    roundint=FALSE,
    shadow.col = "gray")

mod$cptable

mod.pruned <- prune(mod, mod$cptable[5, "CP"])
prp(mod.pruned, 
    type = 2, 
    extra = 104, 
    nn = T, 
    fallen.leaves = T, 
    faclen = 4,
    varlen = 8,
    roundint=FALSE,
    shadow.col = "gray")


mod.pruned.2 <- prune(mod, mod$cptable[2, "CP"])
prp(mod.pruned.2, 
    type = 2, 
    extra = 104, 
    nn = T, 
    fallen.leaves = T, 
    faclen = 4,
    varlen = 8,
    roundint=FALSE,
    shadow.col = "gray")

pred <- predict(mod, 
                banknote[-training.ids,],
                type = "class")
table(banknote[-training.ids,]$class, pred, dnn = c("Actual","Predicho"))  

pred.pruned <- predict(mod.pruned, 
                banknote[-training.ids,],
                type = "class")
table(banknote[-training.ids,]$class, pred.pruned, dnn = c("Actual","Predicho"))  

pred.pruned.2 <- predict(mod.pruned.2, 
                       banknote[-training.ids,],
                       type = "class")
table(banknote[-training.ids,]$class, pred.pruned.2, dnn = c("Actual","Predicho"))  


## Tipo prob
pred.pruned.prob <- predict(mod.pruned, 
                            banknote[-training.ids,],
                            type = "prob")
head(pred.pruned)
head(pred.pruned.prob)

pred.prob <- prediction(pred.pruned.prob[,2], banknote[-training.ids,"class"])
perf.prob <- performance(pred.prob, "tpr", "fpr")
plot(perf.prob)
