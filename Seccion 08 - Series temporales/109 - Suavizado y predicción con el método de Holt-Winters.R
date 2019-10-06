inf <- read.csv("Seccion 08 - Series temporales/infy-monthly.csv")

inf.ts <- ts(inf$Adj.Close, 
             start = c(1999, 3),
             frequency = 12)
plot(inf.ts)
inf.hw <- HoltWinters(inf.ts)
inf.hw
plot(inf.hw,
     col = "blue",
     col.predicted = "red")


install.packages("forecast")
library(forecast)
inf.forecast <- forecast(inf.hw, 
                         h = 24)

plot(inf.forecast)
