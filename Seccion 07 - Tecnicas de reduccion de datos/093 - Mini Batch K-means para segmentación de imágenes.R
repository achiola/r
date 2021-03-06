install.packages("OpenImageR")
install.packages("ClusterR")

library(OpenImageR)
library(ClusterR)

img <- readImage("Seccion 07 - Tecnicas de reduccion de datos/bird.jpg")
img.resize <- resizeImage(img, 350, 350, method = "bilinear")

imageShow(img.resize)

img.vector <- apply(img.resize , 3, as.vector)
dim(img.vector)


kmmb <- MiniBatchKmeans(img.vector,
                        clusters = 5,
                        batch_size = 20,
                        num_init = 5,
                        max_iters = 100,
                        init_fraction = 0.2,
                        initializer = "kmeans++",
                        early_stop_iter = 10,
                        verbose = F)

prmb <- predict_MBatchKMeans(img.vector,
                             kmmb$centroids)

get.cent.mb <- kmmb$centroids

new.img <- get.cent.mb[prmb,]

dim(new.img) <- c(nrow(img.resize), ncol(img.resize), 3)

imageShow(new.img)


######## Generalizacion, con imagen de bodegon
img.name = "Seccion 07 - Tecnicas de reduccion de datos/bodegon.jpg"

img <- readImage(img.name)

#img.resize <- resizeImage(img, 350, 350, method = "bilinear")

imageShow(img)

img.vector <- apply(img , 3, as.vector)
dim(img.vector)


kmmb <- MiniBatchKmeans(img.vector,
                        clusters = 6,
                        batch_size = 20,
                        num_init = 5,
                        max_iters = 100,
                        init_fraction = 0.2,
                        initializer = "kmeans++",
                        early_stop_iter = 10,
                        verbose = F)

prmb <- predict_MBatchKMeans(img.vector,
                             kmmb$centroids)

get.cent.mb <- kmmb$centroids

new.img <- get.cent.mb[prmb,]

dim(new.img) <- c(nrow(img), ncol(img), 3)

imageShow(new.img)



######## imagen del mu�eco
img.name = "Seccion 07 - Tecnicas de reduccion de datos/jb.jpg"

img <- readImage(img.name)

#img.resize <- resizeImage(img, 350, 350, method = "bilinear")

imageShow(img)

img.vector <- apply(img , 3, as.vector)
dim(img.vector)


kmmb <- MiniBatchKmeans(img.vector,
                        clusters = 6,
                        batch_size = 20,
                        num_init = 5,
                        max_iters = 100,
                        init_fraction = 0.2,
                        initializer = "kmeans++",
                        early_stop_iter = 10,
                        verbose = F)

prmb <- predict_MBatchKMeans(img.vector,
                             kmmb$centroids)

get.cent.mb <- kmmb$centroids

new.img <- get.cent.mb[prmb,]

dim(new.img) <- c(nrow(img), ncol(img), 3)

imageShow(new.img)
