install.packages("GGally")
library(ggplot2)
library(GGally)
bike <- read.csv("Seccion 09 - El paquete ggplot2/daily-bike-rentals.csv")

bike$season <- factor(bike$season,
                      levels = c(1,2,3,4),
                      labels = c("Invierno", "Primavera", "Verano", "Otoño"))

bike$weathersit <- factor(bike$weathersit,
                          levels = c(1,2,3),
                          labels = c("Despejado", "Nublado", "Lluvia"))

bike$weekday <- factor(bike$weekday,
                       levels = 0:6,
                       labels = c("D","L","Ma","Mi","J","V","S"))

bike$windspeed.fac <- cut(bike$windspeed,
                          breaks = 3,
                          labels = c("Poco","Mediano","Fuerte"))

ggplot(bike, aes(x = temp, y = cnt)) +
  geom_point(size = 3, aes(color=windspeed.fac)) +
  theme(legend.position = "bottom") +
  geom_smooth(method = "lm", se = F, col = "red") +
  facet_grid(weekday ~ season)
