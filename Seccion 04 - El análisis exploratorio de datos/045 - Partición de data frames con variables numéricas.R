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
