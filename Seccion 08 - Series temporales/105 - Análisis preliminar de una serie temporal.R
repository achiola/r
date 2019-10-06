wmt <- read.csv("Seccion 08 - Series temporales/WMT.csv",
                stringsAsFactors = F)
plot(wmt$Adj.Close, type = "l")

#diferencias entre dos dias
d <- diff(wmt$Adj.Close)
head(d)
plot(d, type = "l")

hist(d,
     probability = T,
     breaks = 40,
     ylim = c(0, 0.8),
     main = "Walmart Stock",
     col = "green")
lines(density(d),
      lwd = 3)


#walmart mensual
wmt.m <- read.csv("Seccion 08 - Series temporales/WMT-monthly.csv",
                  stringsAsFactors = F)

wmt.m.ts <- ts(wmt.m$Adj.Close)
d <- diff(as.numeric(wmt.m.ts))
d
wmt.m.return <- d / lag(as.numeric(wmt.m.ts),
                        k = -1)
wmt.m.return
hist(wmt.m.return,
     probability = T,
     col = "blue")
