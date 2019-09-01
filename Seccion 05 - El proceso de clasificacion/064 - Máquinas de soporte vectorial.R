install.packages("e1071")
library(e1071)
library(caret)

bank <- read.csv("Seccion 05 - El proceso de clasificacion/banknote-authentication.csv")

bank$class <- factor(bank$class)

set.seed(2018)

training.ids <- createDataPartition(bank$class,
                                    p = 0.7,
                                    list = F)

mod <- svm(class ~ .,
           data = bank[training.ids,])

table(bank[training.ids,"class"], 
      fitted(mod),
      dnn = c("Actual", "Predicho"))

pred <- predict(mod, bank[-training.ids,])

table(bank[-training.ids,"class"], 
      pred,
      dnn = c("Actual", "Predicho"))


#plot con dos variables de las cuatro..
plot(mod, data = bank[training.ids,],
     skew ~ variance)
 
plot(mod, data = bank[-training.ids,],
     skew ~ variance)


# Parametros adicionales
tuned <- tune.svm(class ~ .,
           data = bank[training.ids,],
           gamma = 10^(-6:-1),
           cost = 10^(1:2)) # ajuste
summary(tuned)
