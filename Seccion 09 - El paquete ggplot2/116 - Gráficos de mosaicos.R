library(stats)

mtcars <- read.csv("Seccion 09 - El paquete ggplot2/mtcars.csv")

mosaicplot(~ gear+carb, data = mtcars, color = 2:7, las = 1)
mosaicplot(~ gear+carb, data = mtcars, color = T, las = 1)
