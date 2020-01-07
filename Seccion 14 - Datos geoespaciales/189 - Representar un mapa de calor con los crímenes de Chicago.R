#install.packages(c("ggmap","maps"))
library(ggmap)
library(maps)
library(RgoogleMaps)

crimes <- read.csv("Seccion 14 - Datos geoespaciales/chicago-crime.csv")
head(crimes)

crimes$Date <- strptime(crimes$Date, format = "%m/%d/%y %H:%M")
head(crimes)


lat = 41.8339042
lon = -88.0121581

chicago <- get_map(location = c(lat,lon), zoom = 11)

chicago <- GetMap(center = c(lat,lon), zoom = 8)
ggmap(chicago)


counts <- as.data.frame(table(round(crimes$Longitude,2),
                              round(crimes$Latitude,2)
                              )
                        )

counts$Lon <- as.numeric(as.character(counts$Var1))
counts$Lat <- as.numeric(as.character(counts$Var2))

counts$Var1 <- NULL
counts$Var2 <- NULL

pal <- AddAlpha(palette(c("red","green")))

map2 <- MapBackground(counts$Lat, counts$Lon, zoom = 20)
PlotOnStaticMap(map2, counts$Lat, counts$Lon,
                pch = 1,
                cex = 1.5,
                bg = pal[counts$Freq],
                lwd = NULL)


