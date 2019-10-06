s <- read.csv("Seccion 08 - Series temporales/ts-example.csv")

s.ts <- ts(s)
class(s.ts)
head(s.ts)
plot(s.ts)

#Anual
s.ts.a <- ts(s, 
             start = 2001)

s.ts.a
plot(s.ts.a)

#mensual
s.ts.m <- ts(s, 
             start = c(2001,1),
             frequency = 12)

s.ts.m
plot(s.ts.m)


#quarter
s.ts.q <- ts(s, 
             start = 2001,
             frequency = 4)

s.ts.q
plot(s.ts.q)


# Cuando empieza o termina una ts
start(s.ts.m)
end(s.ts.m)
frequency(s.ts.m)


#### mas de un dato en un misma serie temporal
prices <- read.csv("Seccion 08 - Series temporales/prices.csv")
head(prices)

prices.ts <- ts(prices, 
                start = c(1980,1),
                frequency = 12)
prices.ts
plot(prices.ts)

plot(prices.ts,
     plot.type = "single",
     col = 1:2)
legend("topleft",
       colnames(prices.ts),
       col = 1:2,
       lty = 1)


## 107. La descomposición de una serie temporal
####STL
flour.l <- log(prices.ts[,1])
flour.stl <- stl(flour.l,
                 s.window = "period")
plot(flour.stl)
flour.stl


##gasolie
gas.l <- log(prices.ts[,2])
gas.stl <- stl(gas.l,
               s.window = "period")
plot(gas.stl)

######decompose
flour.dec <- decompose(flour.l)
plot(flour.dec)

#gasoline
gas.dec <- decompose(gas.l)
plot(gas.dec)


gas.season.adjusted <- prices[,2] - gas.dec$seasonal
plot(gas.season.adjusted)


