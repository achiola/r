library(RgoogleMaps)
#-32.754211, -63.790825
lat <- -32.754211
lon <- -63.790825

#jpeg png pdf
miMapa <- GetMap(center = c(lat, lon), zoom = 14,
                 destfile = "Seccion 14 - Datos geoespaciales/mimapa.jpeg",
                 format = "jpeg",
                 maptype = "hybrid")

PlotOnStaticMap(miMapa)
