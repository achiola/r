data <- read.csv("Seccion 04 - El análisis exploratorio de datos/daily-bike-rentals.csv")

data$dteday <- as.Date(data$dteday, format = "%Y-%m-%d")

data$season <- factor(data$season,
                      levels = c(1, 2, 3, 4),
                      labels = c("Invierno", "Primavera", "Verano", "Otoño"))

data$workingday <- factor(data$workingday, 
                          levels = c(0, 1),
                          labels = c("Festivo", "De trabajo"))

data$weathersit <- factor(data$weathersit,
                          levels = c(1, 2, 3),
                          labels = c("Despejado", "Nublado", "Lluvia/nieve"))

attach(data)


par(mfrow=c(2,2))

winter <- subset(data, season == "Invierno")$cnt
sprint <- subset(data, season == "Primavera")$cnt
summer <- subset(data, season == "Verano")$cnt
fall <- subset(data, season == "Otoño")$cnt

hist(winter, prob = T, xlab = "Alquiler en Invierno")
lines(density(winter))
abline(v = mean(winter), col = "red")
abline(v = median(winter), col = "blue")

hist(sprint, prob = T, xlab = "Alquiler en Primavera")
lines(density(sprint))
abline(v = mean(sprint), col = "red")
abline(v = median(sprint), col = "blue")

hist(summer, prob = T, xlab = "Alquiler en Verano")
lines(density(summer))
abline(v = mean(summer), col = "red")
abline(v = median(summer), col = "blue")

hist(fall, prob = T, xlab = "Alquiler en Otoño")
lines(density(fall))
abline(v = mean(fall), col = "red")
abline(v = median(fall), col = "blue")

##################################################
## 52. El gráfico de las judías
##################################################
install.packages("beanplot")
library(beanplot)

par(mfrow=c(1,1))
beanplot(data$cnt ~ data$season,
         col = c("blue","red", "yellow"))

##################################################
## 53. Análisis de la causalidad
##################################################
library(lattice)
bwplot(cnt ~ weathersit, data = data, layout = c(1,1), 
       xlab = "Pronostico del tiempo", ylab = "Frecuencias",
       par.settings = list(box.rectangle = list(fill = c("red", "yellow", "green"))))
