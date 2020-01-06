auto <- read.csv("Seccion 13 - Soluciones eficientes en R/auto-mpg.csv",
                 stringsAsFactors = F)
auto$cylinders <- factor(auto$cylinders,
                         levels = c(3,4,5,6,8),
                         labels = c("3C","4C","5C","6C","8C"))

#install.packages("data.table")
library(data.table)

auto.dt <- data.table(auto)
class(auto.dt)

auto.dt$mpg
auto.dt[, .(mpg)]
auto.dt[, .(mpg, horsepower, acceleration)]

#filtrado
auto.dt[cylinders %in% c("3C","5C")]
auto.dt[cylinders == "4C" & horsepower>100]
auto.dt[car_name %like% 'mazda']


auto.dt[,mean(mpg), by=cylinders]

auto.dt[,mean_pgm := mean(mpg), by=cylinders]
head(auto.dt)

auto.dt[,c("sd_mpg","Z_mpg") := list(
  sd(mpg),
  round((mpg - mean(mpg))/sd(mpg),2)),
  by = cylinders]
head(auto.dt)

auto.dt[, lapply(.SD, mean),
        .SDcols = c("mpg","horsepower")]


# para que devuelva un data.frame (en vez de un data.table)
class(auto.dt[1:5, c(1:3,9:12)])
class(auto.dt[1:5, c(1:3,9:12), with = FALSE])


# establecer la clave
setkey(auto.dt, cylinders)
tables()
auto.dt["4C",c(1:3,9:10), with = F]

auto.dt[,list(mean = mean(mpg),
              min = min(mpg),
              max = max(mpg),
              sd = sd(mpg))]


auto.dt[,list(mean = mean(mpg),
              min = min(mpg),
              max = max(mpg),
              sd = sd(mpg)),
        by = cylinders]


# establecer multiples claves
setkeyv(auto.dt,c("cylinders","model_year"))
tables()
auto.dt[.("4C"),c(1:3,9:10), with = F]

