install.packages("randomForest")
library(caret)
library(randomForest)

banknote <- read.csv("Seccion 05 - El proceso de clasificacion/banknote-authentication.csv")

banknote$class <- factor(banknote$class)

set.seed(2018)

training.ids <- createDataPartition(banknote$class, p = 0.7, list = F)

mod <- randomForest(x = banknote[training.ids, 1:4],
                    y = banknote[training.ids, 5],
                    ntree = 500,
                    keep.forest = T)

pred <- predict(mod, banknote[-training.ids,])
table(banknote[-training.ids, "class"], pred, dnn = c("Actual", "Predicho"))

prob <- predict(mod, banknote[-training.ids,], type = "prob")
library(ROCR)
head(prob)
pred <- prediction(prob[,2],banknote[-training.ids,"class"])
perf <- performance(pred, "tpr", "fpr")
plot(perf)
