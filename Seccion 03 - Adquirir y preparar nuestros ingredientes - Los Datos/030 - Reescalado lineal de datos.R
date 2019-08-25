# instalamos el paquete
install.packages("scales")

library(scales)

students <- read.csv("Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/data-conversion.csv")

#rescalamos entre 0 y 1
students$Income.rescaled <- rescale(students$Income)

# lo que es lo mismo
(students$Income - min(students$Income)) / (max(students$Income) - min(students$Income))

#rescalamos entre 0 y 100
rescale(students$Income, to = c(0,100))

rescale.many <- function(dataframe, cols) {
  names <- names(dataframe)
  for(col in cols){
    name <- paste(names[col], "rescaled", sep = ".")
    dataframe[name] <- rescale(dataframe[,col])
  }
  cat(paste("Hemos reescalado ", length(cols), " variable(s)"))
  dataframe
}

students <- rescale.many(students,c(1,4))
