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

#####################################################
### 35. Formas de completar la información que falta
#####################################################
install.packages("Hmisc")
library(Hmisc)

housing.data.4 <- housing.data

#Usamos la fx impute para reemplazar NA
#promedio
housing.data.4$ptratio <- impute(housing.data.4$ptratio, mean)
housing.data.4$rad <- impute(housing.data.4$rad, mean)
summary(housing.data.4)

#mediana
housing.data.5 <- housing.data
housing.data.5$ptratio <- impute(housing.data.5$ptratio, median)
housing.data.5$rad <- impute(housing.data.5$rad, median)
summary(housing.data.5)


#constante
housing.data.6 <- housing.data
housing.data.6$ptratio <- impute(housing.data.6$ptratio, 18)
housing.data.6$rad <- impute(housing.data.6$rad, 7)
summary(housing.data.6)


#####################################################
## Visualizacion
#####################################################
install.packages("mice")

library(mice)
md.pattern(housing.data)

install.packages("VIM")
library(VIM)

aggr(
  housing.data,
  col = c('green','red'),
  numbers = TRUE,
  sortVars = TRUE,
  cex.axis = 0.7,
  gap = 2.5,
  ylab = c("Histograma de NA", "Patrón")
  )
