# a = array
# d = data.frame
# l = list
# _ = no hay salida
# y se pueden combinar entre entrada y salida

auto <- read.csv("Seccion 13 - Soluciones eficientes en R/auto-mpg.csv",
                 stringsAsFactors = F)
auto$cylinders <- factor(auto$cylinders,
                         levels = c(3,4,5,6,8),
                         labels = c("3C","4C","5C","6C","8C"))


#install.packages("plyr")
library(plyr)

ddply(auto, "cylinders",
      function(df){mean(df$mpg)})
#otra forma de escribirlo
ddply(auto, ~cylinders,
      function(df){mean(df$mpg)})

ddply(auto, c("cylinders","model_year"),
      function(df){
        c(mean = mean(df$mpg),
          min = min(df$mpg),
          max = max(df$mpg))
      })


ddply(auto, .(cylinders), summarize, freq = length(cylinders), meanmpg = mean(mpg))



par(mfrow=c(3,2))
d_ply(auto, "cylinders", summarise,
      hist(mpg, xlab = "Millas por galeon", main="Histograma", breaks = 5))



autos <- list(auto, auto)
auto.big <- ldply(autos, I)



mat <- matrix(seq(1,9),3,3)
apply(mat,1,sum)

x <- list(a = 1, b=1:5, c=10:50)
x
lapply(x, FUN = length)
sapply(x, FUN = length)


mapply(sum, 1:5, 1:10, 1:20, 1:100)


x <- 1:25
y <- factor(rep(letters[1:5], each = 5))
y
tapply(x, y, sum)
