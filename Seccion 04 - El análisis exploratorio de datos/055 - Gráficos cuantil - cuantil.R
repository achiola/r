# Creamos una secuencia
s <- seq(0.01, 0.99, 0.01)

qn <- qnorm(s)
qn
df <- data.frame(p = s, q = qn)


sample <- rnorm(200)
quantile(sample, probs = s)

#qqnorm
trees
qqnorm(trees$Height)


#qqplot
randu
#tiene dist. uniforme
n <- length(randu$x)
y <- qunif(ppoints(n))
qqplot(y, randu$x)

# que pasaria si... 
y_normal <- qnorm(ppoints(n))
qqplot(y_normal, randu$x)


chi3 <- qchisq(ppoints(30), df = 3)
n30 <- qnorm(ppoints(30))

qqplot(n30,chi3)


cauchy <- qcauchy(ppoints(30))
qqplot(n30,cauchy)


# Veamos que son todas estas distribuciones
x <- seq(-3, 3, 0.01)
par(mfrow=c(3,2))
plot(x, dnorm(x)) # Dist. normal
plot(x, pnorm(x)) # Dist. normal acumulativa

plot(x, dchisq(x, df = 3)) # Dist. chisq
plot(x, pchisq(x, df = 3)) # Dist. chisq acumulativa

plot(x, dcauchy(x)) # Dist. cauchy
plot(x, pcauchy(x)) # Dist. cauchy acumulada
