#install.packages("gpclib")
library(sp)
library(maps)
library(maptools) #incluye sp

nj.data <- read.csv("Seccion 14 - Datos geoespaciales/nj-county-data.csv")
nj.map <- map("country", "new jersey", fill = T, plot = F)
