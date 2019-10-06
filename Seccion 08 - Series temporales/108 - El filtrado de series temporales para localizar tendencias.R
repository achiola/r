s <- read.csv("Seccion 08 - Series temporales/ts-example.csv")


# filtro de 1 dia por semana = 7
n <- 7
weights.local <- rep(1/7,n)


#bilateral
s.fil.1 <- filter(s$sales, 
                  filter = weights.local,
                  sides = 2)
plot(s$sales,
     type = "l")
lines(s.fil.1,
      col = "blue",
      lwd = 3)


#unilateral (los anteriores o de la izquierda)
s.fil.2 <- filter(s$sales, 
                  filter = weights.local,
                  sides = 1)
lines(s.fil.2,
      col = "red",
      lwd = 3)
