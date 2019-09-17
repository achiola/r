library(caret)

bh <- read.csv("Seccion 05 - El proceso de clasificacion/boston-housing-logistic.csv")

bh$CLASS <- factor(bh$CLASS)

set.seed(2018)

t.id <- createDataPartition(bh$CLASS, 
                            p = 0.7,
                            list = F)

mod <- glm(CLASS ~ .,
           data = bh[t.id,],
           family = binomial)

summary(mod)

bh[-t.id, "prob_success"] <- predict(mod,
                                     newdata = bh[-t.id,],
                                     type = "response")

bh[-t.id, "pred_50"] <- ifelse(bh[-t.id,"prob_success"] > 0.5, 1, 0)

table(bh[-t.id,"CLASS"],
      bh[-t.id, "pred_50"],
      dnn = c("Actual", "Predicho"))
