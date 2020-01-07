library(sp)

nj <- read.csv("Seccion 14 - Datos geoespaciales/nj-wages.csv")
class(nj)

coordinates(nj) <- c("Long", "Lat")
class(nj)

plot(nj)

nj.lines <- SpatialLines(list(Lines(list(Line(coordinates(nj)
                                              )
                                         )
                                    ,"linenj")
                              )
                         )

plot(nj.lines)
