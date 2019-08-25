data <- read.csv("Seccion 04 - El análisis exploratorio de datos/auto-mpg.csv",
                 header = TRUE,
                 stringsAsFactors = FALSE)



# Buscamos subconjuntos basados en los idx por posicion
data[1:5,8:9]
data[1:5,c(8,9)]

# Buscamos subconjuntos basados en los idx por nombre
data[1:5,c("model_year", "car_name")]

# Min & max
data[data$mpg == min(data$mpg) | data$mpg == max(data$mpg),]


# Por condicion
data[data$mpg>30 & data$cylinders == 6,]
data[data$mpg>30 & data$cylinders == 6,c("car_name","mpg")]


####################################################
# subset
####################################################
subset(data, mpg>30 & cylinders == 6, select = c("car_name", "mpg"))
subset(data, mpg>40 , select = c("car_name", "mpg","model_year","cylinders"))
