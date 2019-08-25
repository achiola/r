students <- read.csv("Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/data-conversion.csv")

#comenzamos con la variable income
#la vamos a convertir a categorica
bp <- c(-Inf, 10000, 31000, Inf)
names <- c("Low", "Average", "High")
students$Income.cat <- cut(students$Income, breaks = bp, labels = names)

#sino indicamos etiquetas.. se le asigna
students$Income.cat2 <- cut(students$Income, breaks = bp)

#Cortes hechos por R
students$Income.cat3 <- cut(students$Income, breaks = 4, labels = c("L1", "L2", "L3", "L4"))
students$Income.cat4 <- cut(students$Income, breaks = 4)
