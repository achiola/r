cp <- read.csv("Seccion 05 - El proceso de clasificacion/college-perf.csv")

# vamos a ordenar los factores, para que tengan sentido
cp$Perf <- ordered(cp$Perf, levels = c("Low", "Medium", "High"))
cp$Pred <- ordered(cp$Pred, levels = c("Low", "Medium", "High"))

table <- table(cp$Perf, cp$Pred, dnn = c("Actual", "Predecido"))

table
prop.table(table)

# 100 por fila
round(prop.table(table,1)*100,2)
# 100 por columna
round(prop.table(table,2)*100,2)

############################################
## 58. Diagramas de mosaico
############################################
barplot(table, 
        legend = T,
        xlab = "Prediccion",
        ylab = "Real")

mosaicplot(table, main = "Eficiencia del modelo")


summary(table)
