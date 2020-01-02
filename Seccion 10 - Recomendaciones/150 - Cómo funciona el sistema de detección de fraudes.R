library(caret)
library(pROC)
library(DMwR)
library(caTools)
#install.packages("pROC")
#install.packages("DMwR")
#install.packages("caTools")

ccdata <- read.csv("Seccion 10 - Recomendaciones/creditcard.csv")

head(ccdata)

ccdata$Class <- factor(ifelse(ccdata$Class == 0, "0", "1"))

table(ccdata$Class)

t.id <- createDataPartition(ccdata$Class,
                            p = 0.7,
                            list = F,
                            times = 1)

training <- ccdata[t.id,]
test <- ccdata[-t.id,]

table(training$Class)
table(test$Class)


t.smote <- SMOTE(Class ~ .,
                 training,
                 perc.under =  100,
                 perc.over =  200)

table(t.smote$Class)

t.smote$Class <- as.numeric(t.smote$Class)
trControl <- trainControl(method = "CV",
                          number = 10)

model <- train(Class ~ .,
               data = t.smote,
               method = "treebag",
               trControl = trControl)

model


predictors <- names(t.smote)[names(t.smote)!= "Class"]
pred <- predict(model$finalModel, test[,predictors])

auc <- roc(test$Class, pred)
auc

plot(auc,
     ylim = c(0,1),
     print.thres = T,
     main = paste("AUC con SMOTE:", round(auc$auc[[1]],2)))
abline(h=1, col = "green", lwd = 2)
abline(h=0, col = "red", lwd = 2)
