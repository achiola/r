protein <- read.csv("Seccion 07 - Técnicas de reduccion de datos/protein.csv")

# normalizar y escalar
data <- as.data.frame(scale(protein[,-1]))
data$Country <- protein$Country

rownames(data) <- data$Country

#clustering aglomerativo
#ward.D2
hc <- hclust(dist(data,
                  method = "euclidean"),
             method = "ward.D2")
hc

plot(hc,
     hang = 0.01,
     cex = 0.7)

#single
hc2 <- hclust(dist(data,
                  method = "euclidean"),
             method = "single")
hc2

plot(hc2,
     hang = 0.01,
     cex = 0.7)

#complete
hc3 <- hclust(dist(data,
                   method = "euclidean"),
              method = "complete")
hc3

plot(hc3,
     hang = 0.01,
     cex = 0.7)

#average
hc4 <- hclust(dist(data,
                   method = "euclidean"),
              method = "average")
hc4

plot(hc4,
     hang = 0.01,
     cex = 0.7)

hc4$merge

#90. Las distancias y el método de generación del cluster
d <- dist(data, method = "euclidean")
d
Albania <- data["Albania",-10]
Austria <- data["Austria", -10]
sqrt(sum((Albania - Austria)^2))


d <- dist(data, method = "manhattan")
d
sum(abs(Albania - Austria))



#91. Clusterings divisitivos y cortes en el dendograma
install.packages("cluster")
library(cluster)

dv <- diana(data, metric = "euclidean")
par(mfrow=c(1,2))
plot(dv)
par(mfrow=c(1,1))


#Cutree
#ward.D2
hc <- hclust(dist(data,
                  method = "euclidean"),
             method = "ward.D2")
hc

plot(hc,
     hang = 0.01,
     cex = 0.7)

fit <- cutree(hc, k=4)
table(fit)
rect.hclust(hc, k=4, border = "red")
rect.hclust(hc, k=3, border = "blue")
