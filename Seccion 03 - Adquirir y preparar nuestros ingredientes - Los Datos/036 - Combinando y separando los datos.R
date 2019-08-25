install.packages("tidyr")
library(tidyr)

crime.data <- read.csv("Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/USArrests.csv",
                       stringsAsFactors = FALSE)

# Vamos a agregar una columna con cbind
crime.data <- cbind(state = row.names(crime.data), crime.data)

######################################
#podemos hacer un "unpivot"
######################################
crime.data.1 <- gather(crime.data,
                       key = "crime_type", value = "arrest_estimate",
                       Murder : UrbanPop)

crime.data.2 <- gather(crime.data,
                       key = "crime_type", value = "arrest_estimate",
                       -state)

crime.data.3 <- gather(crime.data,
                       key = "crime_type", value = "arrest_estimate",
                       Murder, Assault)

######################################
#podemos hacer un "pivot"
######################################
crime.data.4 <- spread(crime.data.2,
                       key = "crime_type",value = "arrest_estimate")


######################################
#Combinar columas
######################################
crime.data.5 <- unite(crime.data,
                      col = "Murder_Assault",
                      Murder, Assault,
                      sep = "_")

######################################
#Ahora lo separamos
######################################
crime.data.6 <- separate(crime.data.5,
                         col = "Murder_Assault",
                         into = c("Murder","Assault"),
                         sep = "_")
