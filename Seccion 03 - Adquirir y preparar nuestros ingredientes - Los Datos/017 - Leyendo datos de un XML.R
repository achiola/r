# Directamente en la consola
# install.packages("XML")
library(XML)

url <- "Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/cd_catalog.xml"
xmldoc <- xmlParse(url)
rootnode <- xmlRoot(xmldoc)
rootnode[1]

cds_data <- xmlSApply(rootnode, function(x) xmlSApply(x, xmlValue))
cds_catalog <- data.frame(t(cds_data), row.names = NULL)

head(cds_catalog, 2)

cds_catalog[1:5,]

# 18. Leyendo tablas incrustadas en un HTML
population_url <- "Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/WorldPopulation-wiki.htm"
tablas <- readHTMLTable(population_url)
most_populate <- tablas[[6]]


# leer solo una tabla del html
custom_table <- readHTMLTable(population_url, which = 6)


