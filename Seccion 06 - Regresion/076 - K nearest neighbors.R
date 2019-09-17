install.packages("FNN")

library(dummies)
library(FNN)
library(scales)
library(caret)

edu <- read.csv("Seccion 06 - Regresion/education.csv")

#variables dummies para region
dms <- dummy(edu$region, sep = "_")

edu <- cbind(edu,dms)

#normalizamos..
edu$urban.s <- rescale(edu$urban)
edu$income.s <- rescale(edu$income)
edu$under18.s <- rescale(edu$under18)


set.seed(2018)
t.id <- createDataPartition(edu$expense,
                            p = 0.6,
                            list = F)
tr <- edu[t.id,]
temp <- edu[-t.id,]
v.id <- createDataPartition(temp$expense,
                            p = 0.5,
                            list = F)
val <- temp[v.id, ]
test <- temp[-v.id, ]


#Creamos varios modelos para ver cual es el mejor

## k = 1
reg1 <- knn.reg(tr[,7:12], 
                val[,7:12], 
                tr$expense,
                k = 1,
                algorithm = "brute")
rmse1 <- sqrt(mean((reg1$pred - val$expense)^2))
rmse1


## k = 2
reg2 <- knn.reg(tr[,7:12], 
                val[,7:12], 
                tr$expense,
                k = 2,
                algorithm = "brute")
rmse2 <- sqrt(mean((reg2$pred - val$expense)^2))
rmse2


## k = 3
reg3 <- knn.reg(tr[,7:12], 
                val[,7:12], 
                tr$expense,
                k = 3,
                algorithm = "brute")
rmse3 <- sqrt(mean((reg3$pred - val$expense)^2))
rmse3

## k = 4
reg4 <- knn.reg(tr[,7:12], 
                val[,7:12], 
                tr$expense,
                k = 4,
                algorithm = "brute")
rmse4 <- sqrt(mean((reg4$pred - val$expense)^2))
rmse4


errors = c(rmse1,rmse2,rmse3,rmse4)
plot(errors,
     type = 'o',
     xlab = "k",
     ylab = "RSME")



#######################
reg.test <- knn.reg(tr[,7:12], 
                    test[,7:12], 
                    tr$expense,
                    k = 4,
                    algorithm = "brute")
rmse.test <- sqrt(mean((reg.test$pred - test$expense)^2))
rmse.test



#############################################################
## 77. K Nearest Neighbors sin partición de validación
#############################################################

t.id <- createDataPartition(edu$expense,
                            p = 0.7,
                            list = F)

tr <- edu[t.id, ]
val <- edu[-t.id, ]

reg <- knn.reg(tr[,7:12], 
               test = NULL,
               tr$expense,
               k = 4,
               algorithm = "brute")
rmse <- sqrt(mean((reg$residuals)^2))
rmse


##################################################
# creamos un fx para hacer las regresiones
##################################################
rdacb.knn.reg <- function(tr_predictors, val_predictors,
                          tr_target, val_target, k){
  library(FNN)
  res <- knn.reg(tr_predictors,
                 val_predictors,
                 tr_target,
                 k,
                 algorithm = "brute")
  rmserror <- sqrt(mean((val_target-res$pred)^2))
  cat(paste("RMSE para k =  ", toString(k) , ": ", rmserror, "\n", sep = ""))
  rmserror
}

rdacb.knn.reg(tr[,7:12],
              val[,7:12],
              tr$expense,
              val$expense,
              1)

rdacb.knn.reg(tr[,7:12],
              val[,7:12],
              tr$expense,
              val$expense,
              2)

rdacb.knn.reg(tr[,7:12],
              val[,7:12],
              tr$expense,
              val$expense,
              3)

rdacb.knn.reg(tr[,7:12],
              val[,7:12],
              tr$expense,
              val$expense,
              4)

rdacb.knn.multi <- function(tr_predictors, val_predictors,
                            tr_target, val_target, start_k, end_k){
  rms_errors <- vector()
  for(k in start_k:end_k){
    rms_error <- rdacb.knn.reg(tr_predictors,
                                val_predictors,
                                tr_target,
                                val_target,
                                k)
    rms_errors <- c(rms_errors, rms_error)
  }
  plot(rms_errors, 
       type = "o",
       xlab = "k",
       ylab = "RMSE")
}



rdacb.knn.multi(tr[,7:12],
              val[,7:12],
              tr$expense,
              val$expense,
              1,
              10)


##################################################
### ver los datos predichos
##################################################

df = data.frame(actual = test$expense, 
                pred = reg.test$pred)
plot(df)
abline(0,1)
  