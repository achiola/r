install.packages("MASS")
library(MASS)
library(caret)

bn <- read.csv("Seccion 05 - El proceso de clasificacion/banknote-authentication.csv")
bn$class <- factor(bn$class)

set.seed(2018)

t.id <- createDataPartition(bn$class,
                            p = 0.7,
                            list = F)

mod <- lda(bn[t.id,1:4],
           bn[t.id,5])
# el de abajo es identico al de arriba
mod <- lda(class ~ .,
           data = bn[t.id,])

bn[t.id,"predic"] <- predict(mod,
                             bn[t.id,1:4])$class
table(bn[t.id, "class"],
      bn[t.id, "predic"],
      dnn = c("actual", "predichos"))

bn[-t.id,"predic"] <- predict(mod,
                             bn[-t.id,1:4])$class

table(bn[-t.id, "class"],
      bn[-t.id, "predic"],
      dnn = c("actual", "predichos"))
