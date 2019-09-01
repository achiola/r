install.packages("ROCR")
library(ROCR)

data1 <- read.csv("Seccion 05 - El proceso de clasificacion/roc-example-1.csv")
data2 <- read.csv("Seccion 05 - El proceso de clasificacion/roc-example-2.csv")

#en Data1 0 = fracaso, 1 = exito
pred1 <- prediction(data1$prob, data1$class)
perf1 <- performance(prediction.obj = pred1, "tpr", "fpr")
plot(perf1)
lines(par()$usr[1:2], par()$usr[3:4])

prob.cuts.1 <- data.frame(cut = perf1@alpha.values[[1]],
                          fpr = perf1@x.values[[1]],
                          tpr = perf1@y.values[[1]])

head(prob.cuts.1)
tail(prob.cuts.1)

prob.cuts.1[prob.cuts.1$tpr>=0.8,]

## Con el csv2, es casi igual, pero con etiquetas
pred2 <- prediction(data2$prob, data2$class, label.ordering = c("non-buyer","buyer"))
perf2 <- performance(pred2, "tpr", "fpr")
plot(perf2)
lines(par()$usr[1:2], par()$usr[3:4])
