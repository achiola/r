#install.packages("sp")
#install.packages("rgdal")

library(sp)
library(rgdal)

countries.sp <- readOGR(dsn="Seccion 14 - Datos geoespaciales/natural_earth",
                        layer = "ne_50m_admin_0_countries", verbose = T)

airports.sp <- readOGR(dsn="Seccion 14 - Datos geoespaciales/natural_earth",
                        layer = "ne_50m_airports")

class(countries.sp)
class(airports.sp)

plot(countries.sp,
     col = countries.sp@data$mapcolor9)

plot(airports.sp, add = TRUE)

spplot(countries.sp,c("economy"))
spplot(countries.sp,c("pop_est"))
spplot(countries.sp,c("gdp_md_est"))
spplot(countries.sp, col = countries.sp@data$mapcolor13)
