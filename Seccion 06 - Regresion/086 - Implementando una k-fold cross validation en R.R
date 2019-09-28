bh <- read.csv("Seccion 06 - Regresion/BostonHousing.csv")

kfold.crossval.reg <- function(df, nfolds){
  fold <- sample(1:nfolds, 
                 nrow(df),
                 replace = T)
  mean.square.errs <- sapply(1:nfolds,
                             kfold.crossval.reg.iter,
                             df,
                             fold)
  list("MSE" = mean.square.errs,
       "Overall_Mean_Sqr_Error" = mean(mean.square.errs),
       "Std_Mean_Sqr_Error" = sd(mean.square.errs))
}

kfold.crossval.reg.iter <- function(k, df, fold){
  t.id <- !fold %in% c(k)
  test.id <- fold %in% c(k)
  mod <- lm(MEDV ~ .,
            data = df[t.id,])
  preds <- predict(mod, df[test.id,])
  sqr_errs <- (preds - df[test.id,"MEDV"])^2
  mean(sqr_errs)
}


res <- kfold.crossval.reg(bh, 5)
res


# 87. Implementando una LOOCV en R
loocv.reg <- function(df){
  mean.square.errs <- sapply(1:nrow(df),
                             loocv.reg.iter,
                             df)
  list("MSE" = mean.square.errs,
       "Overall_Mean_Sqr_Error" = mean(mean.square.errs),
       "Std_Mean_Sqr_Error" = sd(mean.square.errs))
}

loocv.reg.iter <- function(k, df){
  mod <- lm(MEDV ~ ., data = df[-k,])
  pred <- predict(mod, df[k,])
  sqr.error <- (pred - df[k,"MEDV"])^2
  sqr.error
}

res <- loocv.reg(bh)
res
