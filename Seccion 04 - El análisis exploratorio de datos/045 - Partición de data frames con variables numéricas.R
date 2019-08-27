install.packages("caret")
library(caret)
data <- read.csv("Seccion 04 - El análisis exploratorio de datos/BostonHousing.csv",
                 header = T,
                 stringsAsFactors = F)


training.ids <- createDataPartition(data$MEDV, p = 0.8, list = F)
data.training <- data[training.ids,]
data.test <- data[-training.ids,]


training.ids.2 <- createDataPartition(data$MEDV, p = 0.7, list = F)
data.training.2 <- data[training.ids.2,]
temp <- data[-training.ids.2,]
training.ids.3 <- createDataPartition(temp$MEDV, p = 0.5, list = F)
data.test.2 <- temp[training.ids.3,]
data.validation.2 <- temp[-training.ids.3,]


### 46. Partición de data frames con variables categóricas
data2 <- read.csv("Seccion 04 - El análisis exploratorio de datos/boston-housing-classification.csv",
                  header = T,
                  stringsAsFactors = T)

training.ids.4 <- createDataPartition(data2$MEDV_CAT, p = 0.7, list = F)
data.training.4 <- data2[training.ids.4,]
data.validation.4 <- data2[-training.ids.4,]


###############################################
# funciones para hacer las particiones
###############################################
rda.cb.partition2 <- function(dataframe, target.index, prob) {
  library(caret)
  training.ids <- createDataPartition(dataframe[,target.index], p = prob, list = F)
  list(train = dataframe[training.ids,], val = dataframe[-training.ids,])
}

rda.cb.partition3 <- function(dataframe, target.index, prob.train, prob.val) {
  library(caret)
  training.ids <- createDataPartition(dataframe[,target.index], p = prob.train, list = F)
  train.data <- dataframe[training.ids,]
  temp <- dataframe[-training.ids,]
  validation.ids <- createDataPartition(temp[,target.index], p = prob.val, list = F)
  list(train = train.data, val = temp[validation.ids,], test = temp[-validation.ids,])
}



data.1 <- rda.cb.partition2(data, 14, 0.8)
data.2 <- rda.cb.partition3(data2, 14, 0.7, 0.5) 

View(data.1$train)
View(data.1$val)


# tomar una muestra
sample1 <- sample(data$CRIM, 40, replace = F)
