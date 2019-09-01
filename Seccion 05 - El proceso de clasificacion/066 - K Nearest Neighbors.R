install.packages("class")
library(class)
library(caret)

v <- read.csv("Seccion 05 - El proceso de clasificacion/vacation-trip-classification.csv")

#normalizamos los datos
v$Income.z <- scale(v$Income)
v$Family_size.z <- scale(v$Family_size)

set.seed(2018)

t.ids <- createDataPartition(v$Result, 
                             p = 0.5,
                             list = F)
train <- v[t.ids,]
tmp <- v[-t.ids,]
v.ids <- createDataPartition(tmp$Result, 
                             p = 0.5,
                             list = F)
validation <- tmp[v.ids,]
test <- tmp[-v.ids,]


# va a decidir solo el vecino mas cercano
pred1 <- knn(train[,4:5],
             validation[,4:5],
             train[,3],
             k = 1)

tab1 <- table(validation$Result, 
             pred1, 
             dnn = c("Actual", "Predicho"))
tab1
confusionMatrix(tab1)

# ahora con el voto de dos vecinos cercanos
pred2 <- knn(train[,4:5],
             validation[,4:5],
             train[,3],
             k = 2)

tab2 <- table(validation$Result, 
              pred2, 
              dnn = c("Actual", "Predicho"))
tab2


# con 5
pred5 <- knn(train[,4:5],
             validation[,4:5],
             train[,3],
             k = 5)

tab5 <- table(validation$Result, 
              pred5, 
              dnn = c("Actual", "Predicho"))
tab5


# con el conjunto de testing
pred.t <- knn(train[,4:5],
             test[,4:5],
             train[,3],
             k = 5)

tab.t <- table(test$Result, 
              pred.t, 
              dnn = c("Actual", "Predicho"))
tab5

#################################################################
## 67. Eligiendo el mejor número de vecinos para la decisión
#################################################################
knn.automate <- function(tr_predictors, val_predictors, 
                         tr_target, val_target,
                         start_k, end_k){
  for(k in start_k:end_k){
    pred <- knn(tr_predictors,
                val_predictors,
                tr_target,
                k)
    tab <- table(val_target, pred, dnn = c("Actual", "Predicho"))
    cat(paste("Matriz de confusion para k = ",k,"\n"))
    cat("================================================\n")
    print(tab)
    cat("\n------------------------------------------------\n")
    
  }
  
}

knn.automate(train[,4:5],
             validation[,4:5],
             train[,3],
             validation[,3],
             1, 8
             )


# vamos a utilizar lo mismo pero con una fx de caret
# que hace el scalado, centra  automaticamente

tctrl <- trainControl(method = "repeatedcv",
                      number = 10,
                      repeats = 3)
caret_knn_fit <- train(Result ~ Family_size + Income,
                       data = train,
                       method = "knn",
                       trControl = tctrl,
                       preProcess = c("center", "scale"),
                       tuneLength = 10)
caret_knn_fit
pred6 <- knn(train[,4:5],
             validation[,4:5],
             train[,3],
             k=5,
             prob = T)
pred6

