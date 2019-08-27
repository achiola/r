auto <- read.csv("Seccion 04 - El análisis exploratorio de datos/auto-mpg.csv",
                 header = T,
                 stringsAsFactors = T)

auto$cylinders <- factor(auto$cylinders, 
                         levels = c(3,4,5,6,8),
                         labels = c("3 cil", "4 cil", "5 cil", "6 cil", "8 cil"))

# ahora forma parte de la session actual de r ???!!
attach(auto)
head(cylinders)

###########################################################
hist(acceleration)

# agregamos color
hist(acceleration,
     col = "blue")

# agregamos etiquetas
hist(acceleration,
     col = "blue",
     xlab = "Aceleración",
     ylab = "Frecuencia",
     main = "Histograma de las aceleraciones")


# Divisiones
hist(acceleration,
     col = "blue",
     xlab = "Aceleración",
     ylab = "Frecuencia",
     main = "Histograma de las aceleraciones",
     breaks = 16)


# mas colorines
hist(acceleration,
     col = rainbow(16),
     xlab = "Aceleración",
     ylab = "Frecuencia",
     main = "Histograma de las aceleraciones",
     breaks = 16)

###########################################################
#boxplots
boxplot(mpg,
        xlab = "Millas por galon")

#dividimos los datos 
boxplot(mpg ~ model_year,
        xlab = "Millas por galon")

#Otro ejemplo
boxplot(mpg ~ cylinders,
        xlab = "Millas por galon")

#graficar todo el df
boxplot(auto)

###########################################################
#scatterplot
plot(mpg ~ horsepower)

#matriz de scatterplots
pairs(~mpg+displacement+horsepower+weight)


###########################################################
#Combinar graficos
hist(mpg, probability = T)
lines(density(mpg))

hist(mpg, probability = T, breaks = 16)
lines(density(mpg))

plot(mpg ~ horsepower)
linearmodel <- lm(mpg ~ horsepower)
abline(linearmodel)

#agregar colores para cada cilindrada
plot(mpg ~ horsepower, type = "n")
linearmodel <- lm(mpg ~ horsepower)
abline(linearmodel)
with(subset(auto, cylinders == "8 cil"), points(horsepower, mpg, col = "red", pch=19))
with(subset(auto, cylinders == "6 cil"), points(horsepower, mpg, col = "yellow", pch=19))
with(subset(auto, cylinders == "5 cil"), points(horsepower, mpg, col = "green", pch=19))
with(subset(auto, cylinders == "4 cil"), points(horsepower, mpg, col = "blue", pch=19))
with(subset(auto, cylinders == "3 cil"), points(horsepower, mpg, pch=19))



###########################################################
#Combinar de plots
old.par <- par()
old.par

par(mfrow = c(1,2))
with(auto , {
        plot(mpg ~ weight, main = "Peso vs consumo")
        plot(mpg ~ acceleration, main ="Aceleracion vs consumo")
})
par(old.par)
