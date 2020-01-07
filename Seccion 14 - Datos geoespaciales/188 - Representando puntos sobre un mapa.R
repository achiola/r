library(RgoogleMaps)
wages <- read.csv("Seccion 14 - Datos geoespaciales/nj-wages.csv")
head(wages)

wages$wgClass <- cut(wages$Avgwg,
                     quantile(wages$Avgwg, probs = seq(0,1 , 0.2)),
                     labels = F,
                     include.lowest = T)


pal <- palette(rainbow(5))

#lat = 40.155
#lon = -74.715

#map <- GetMap(center = c(lat,lon), zoom = 8)


#PlotOnStaticMap(map, wages$Lat, wages$Long,
#                pch = 21,
#                cex = sqrt(wages$wgClass),
#                bg = pal[wages$wgClass])


map2 <- MapBackground(wages$Lat, wages$Long)
PlotOnStaticMap(map2, wages$Lat, wages$Long,
                pch = 21,
                cex = sqrt(wages$wgClass),
                bg = pal[wages$wgClass])
legend("topleft",
       legend = paste("<=", round(tapply(wages$Avgwg, wages$wgClass, max),0)),
       pch = 21,
       pt.bg = pal,
       pt.cex = 1.0,
       bg="gray",
       title = "Ingresos promedio")
