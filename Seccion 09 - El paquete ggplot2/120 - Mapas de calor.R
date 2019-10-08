install.packages("ggmap")
install.packages("maps")
install.packages("OpenStreetMap")

library("ggmap")
library(maps)
library(OpenStreetMap)
tartu.data <- read.csv("Seccion 09 - El paquete ggplot2/tartu_housing.csv",
                       sep = ";")

tartu.map <- get_map(location = "tartu",
                     maptype = "satellite")
