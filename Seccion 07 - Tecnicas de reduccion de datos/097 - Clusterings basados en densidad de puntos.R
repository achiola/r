library(fpc)
library(factoextra)
data("multishapes", package = "factoextra")

dataPoints <- multishapes[,1:2]
plot(dataPoints)

km <- kmeans(dataPoints, 5)
fviz_cluster(km, dataPoints)

dsFit <- dbscan(dataPoints,
                eps = 0.15,
                MinPts = 5)
dsFit
fviz_cluster(dsFit, 
             dataPoints,
             geom = "point")


#98. Clusterings basados en modelos
install.packages("mclust")
library(mclust)

mclust <- Mclust(dataPoints)

plot(mclust)

summary(mclust)
