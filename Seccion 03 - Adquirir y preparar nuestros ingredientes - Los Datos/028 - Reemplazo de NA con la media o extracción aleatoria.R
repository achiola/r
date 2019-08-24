data <- read.csv("Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/missing-data.csv",
                 na.strings = "")

# podriamos reemplazar los na con el promedio de la poblacion
data$Income.mean <- ifelse( 
  is.na(data$Income), 
  mean(data$Income, na.rm = TRUE),  
  data$Income)

rand.impute <- function(x) {
  missing <- is.na(x)
  n.missing <- sum(missing)
  x.obs <- x[!missing]
  imputed <- x
  imputed[missing] <- sample(x.obs, n.missing, replace = TRUE)
  return(imputed)
}

random.impute.data.frame <- function(dataframe, cols) {
  name <- names(dataframe)
  for(col in cols){
    name <- paste(name[col], "imputed", sep = ".")
    dataframe[name] <- rand.impute(dataframe[,col])
  }
  dataframe
}


data <- read.csv("Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/missing-data.csv",
                 na.strings = "")
data$Income[data$Income == 0] <- NA
data.2 <- random.impute.data.frame(data, c(1,2))
