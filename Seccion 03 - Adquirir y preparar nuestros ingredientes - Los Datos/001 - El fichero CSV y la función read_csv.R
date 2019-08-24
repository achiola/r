#Cargamos el csv
auto <- read.csv(
  "Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/auto-mpg.csv",
  header = TRUE,
  sep = ","
  )
#read.csv2() == read.csv() pero por defecto el sep es el ";", una autentica cagada

#mostraos lo nombres de las columnas (variables)
names(auto)

## Sin encabezados
auto_no_head = read.csv(
  "Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/auto-mpg-noheader.csv",
  header = FALSE
  )

head(auto_no_head, 4)

auto_custom_head = read.csv(
  "Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/auto-mpg-noheader.csv",
  header = FALSE,
  col.names = c("No", "mpg", "cylinders", "displacement", "horsepower",
                "weight", "acceleration", "model_year", "car_name")
  )

head(auto_custom_head, 4)


#######################################
# NA = Not Available
#######################################
as.character()