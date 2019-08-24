# caso 1: reemplazamos los espacios con NA
data <- read.csv("Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/missing-data.csv",
                 na.strings = "")

# caso 2: omitimos los NA
data.clean <- na.omit(data)

# caso 3: is.na
# en el caso de que se aplique a un valor devuelve un bool
is.na(data[4,2])
# si se lo aplicamos a una matriz, nos devuelve una matriz de bools
is.na(data)


# 27. Limpieza selectiva de los datos sin valor

#limpiamos na de income
data[!is.na(data$Income),]

#nos devuelve true si existe un valor na en la fila
complete.cases(data)
data.clean.2 <- data[complete.cases(data),]


#convertir los 0 de ingresos en na
data$Income[data$Income==0] <- NA
# medidas de centralizacion y dispersion
mean(data$Income) #al existir NA, nos devuelve NA
mean(data$Income, na.rm = TRUE) #de esta forma le indicamos que quite los NA del calculo
#lo mismo para otros funciones, como por ejemplo desviacion estandard
sd(data$Income) # nos da NA
sd(data$Income, na.rm = TRUE) 


