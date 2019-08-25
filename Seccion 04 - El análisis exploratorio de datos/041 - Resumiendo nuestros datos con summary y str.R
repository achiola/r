data <- read.csv("Seccion 04 - El análisis exploratorio de datos/auto-mpg.csv",
                 header = TRUE,
                 stringsAsFactors = FALSE)
summary(data)

#Cambios a categoria la variable cylinders (no nos interesa como numerica)
data$cylinders <- factor(data$cylinders,
                         levels = c(3, 4, 5, 6, 8),
                         labels = c("3 cil", "4 cil", "5 cil", "6 cil", "8 cil"))
summary(data)
str(data)
summary(data$cylinders)
summary(data$mpg)

####################################################
## 42. Estadísticos y medidas básicas
####################################################
install.packages("modeest")
install.packages("genefilter")
install.packages("BiocManager") 
library("BiocManager")
BiocManager::install("genefilter")
BiocManager::install("digest")
install.packages("raster")
install.packages("moments")
library(modeest) #moda
library(raster) #quantiles y cv
library(moments) #asimetria y curtosis

x = data$mpg

## Medidas de centralización
mean(x) # sum(x)/length(x)
median(x) #media
mfv(x) #Moda
quantile(x) #cuantiles


## Medidas de dispersion
var(x) # Varianza
sd(x) # Descviación estandard
cv(x) # Coeficiente de variacion


## Medidas de asimetria
skewness(x) #asimetria
kurtosis(x)


hist(x)
