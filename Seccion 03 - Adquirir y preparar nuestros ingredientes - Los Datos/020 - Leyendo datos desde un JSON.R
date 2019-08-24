# cargamos libreria
library(jsonlite)

dat.1 <- fromJSON("Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/students.json")
dat.2 <- fromJSON("Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/student-courses.json")

library(curl)
# la api de yahoo no esta funcionando
#url <- "http://finance.yahoo.com/webservice/v1/symbols/allcurrencies/quote?format=json"
url <- "http://www.floatrates.com/daily/usd.json"
currencies <- fromJSON(url)

# 22. Acceso a los datos con la sintaxis de $
pesos <- currencies$ars
currencies_df <- as.data.frame(currencies$ars)

head(dat.1,3)

dat.1$Email

currencies_df <- data.frame(t(sapply(currencies, c)))

dat.1[c(2,5,8),]
dat.1[,c(2,5)]

dat.2
