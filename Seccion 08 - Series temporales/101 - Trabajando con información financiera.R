APPL <- read.csv("Seccion 08 - Series temporales/AAPL.csv", stringsAsFactors = F)
AMZN <- read.csv("Seccion 08 - Series temporales/AMZN.csv", stringsAsFactors = F)
FB <- read.csv("Seccion 08 - Series temporales/FB.csv", stringsAsFactors = F)
GOOG <- read.csv("Seccion 08 - Series temporales/GOOG.csv", stringsAsFactors = F)

AMZN <- AMZN[AMZN$Date>='2008-01-01',]
APPL <- APPL[APPL$Date>='2008-01-01',]
GOOG <- GOOG[GOOG$Date>='2008-01-01',]

str(APPL)
APPL$Date <- as.Date(APPL$Date)
AMZN$Date <- as.Date(AMZN$Date)
FB$Date <- as.Date(FB$Date)
GOOG$Date <- as.Date(GOOG$Date)

library(ggplot2)
ggplot(APPL, aes(Date, Close)) +
  geom_line(aes(color="Apple")) +
  geom_line(data = AMZN, aes(color = "Amazon")) +
  geom_line(data = FB, aes(color = "Facebook")) +
  geom_line(data = GOOG, aes(color = "Google")) +
  labs(color = "Legend") +
  scale_color_manual("", breaks = c("Apple","Amazon","Facebook","Google"),
                     values = c("gray", "yellow","blue", "red")) +
  ggtitle("Comparaciones de cierre de stocks") +
  theme(plot.title = element_text(lineheight = 0.7, face = "bold"))



### 102. Datos en tiempo real con quantmod
install.packages("quantmod")

library(quantmod)

#Cargar datos en tiempo real
getSymbols("AAPL")
barChart(AAPL)
chartSeries(AAPL, TA = NULL)
chartSeries(AAPL[,4], TA = "addMACD()")

getSymbols("NFLX")
barChart(NFLX)
chartSeries(NFLX, TA = NULL)
chartSeries(NFLX[,4], TA = "addMACD()")
