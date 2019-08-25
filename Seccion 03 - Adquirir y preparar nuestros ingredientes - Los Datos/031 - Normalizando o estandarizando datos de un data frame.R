housing <- read.csv("Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/BostonHousing.csv")

#esta funcion deben ser todas las variables numericas ()
housing.z <- scale(housing)
housing.z <- scale(housing, center = TRUE, scale = TRUE) # por defecto es asi 

housing.none <- scale(housing, center = FALSE, scale = FALSE) # por defecto es asi
housing.mean <- scale(housing, center = TRUE, scale = FALSE) 
housing.sd <- scale(housing, center = FALSE, scale = TRUE) 

scale.many <- function(dataframe, cols) {
  names <- names(dataframe)
  for(col in cols) {
    name <- paste(names[cols], "z", sep = ".")
    dataframe[name] <- scale(dataframe[,col])
  }
  cat(paste("Hemos normalizado ", length(cols), " variable(s)"))
  dataframe
}

housing.2 <- scale.many(housing, c(1, 3, 5:8))

