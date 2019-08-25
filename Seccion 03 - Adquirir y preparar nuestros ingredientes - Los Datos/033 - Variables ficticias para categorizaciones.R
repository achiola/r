students <- read.csv("Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/data-conversion.csv")

install.packages("dummies")
library(dummies)

# todas las columnas
students.dummy <- dummy.data.frame(students, sep = ".")

# Solo una columna
dummy(students$State, sep = ".")

#varias columnas
dummy.data.frame(students, names = c("State","Gender"),sep = ".")
