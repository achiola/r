housing.data <- read.csv("Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/housing-with-missing-value.csv",
                         stringsAsFactors = FALSE)

# resumen
summary(housing.data)

# omitirlos, ojo como impactan!!
housing.data.1 <- na.omit(housing.data)
summary(housing.data.1)

#Eliminar los NA de ciertas columnas
drop_na <- c("rad") #rad es el nombre de la columna que vamos a permitir NA
housing.data.2 <- housing.data[complete.cases(housing.data[,!(names(housing.data))%in% drop_na]),]
summary(housing.data.2)

##Podemos eliminar una columna completa
housing.data$rad <- NULL
summary(housing.data)

#Volvemos a cargar
#Eliminamos varias columnas
drops <- c("rad","ptratio")
housing.data.3 <- housing.data[,!(names(housing.data) %in% drops)]
summary(housing.data.3)
