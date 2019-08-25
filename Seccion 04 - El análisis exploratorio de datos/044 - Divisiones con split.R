data <- read.csv("Seccion 04 - El análisis exploratorio de datos/auto-mpg.csv",
                 header = T,
                 stringsAsFactors = F)

## Split
carslist <- split(data, data$cylinders)
str(carslist[1])
str(carslist[[1]])
