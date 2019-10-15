install.packages("recommenderlab")
library(recommenderlab)

data(MovieLense)

head(MovieLense)

rating_movies <- MovieLense[rowCounts(MovieLense) > 50,
                            colCounts(MovieLense) > 100]
t.id <- sample(x = c(T,F),
               size = nrow(rating_movies),
               replace = T,
               prob = c(0.8, 0.2))

data_train <- rating_movies[t.id,]
data_test <- rating_movies[!t.id,]


### 131. Los datos de las peliculas y las matrices sparsed
#solo guarda las no nulas
rating_movies@data
rating_movies@data[1,1]
rating_movies@data[1,] # todas las peliculas valoradas por un usuario
rating_movies@data[,1] # todas las valorazaciones hechas por el primer usuario
head(rownames(rating_movies))
head(colnames(rating_movies))


### 132. Sistemas de filtrado colaborativo basado en ítems
### IBCF

ibcf <- Recommender(data = data_train,
                    method = "IBCF",
                    parameter = list(k = 30))
ibcf.mod <- getModel(ibcf)

ibcf.mod

#numero de comendaciones
n_rec <- 10
ibcf.pred <- predict(object = ibcf,
                     newdata = data_test,
                     n = n_rec)
 
ibcf.pred

ibcf.rec.matrix <- sapply(ibcf.pred@items, function(x){colnames(rating_movies)[x]})

View(ibcf.rec.matrix[,1:3])


### 133. Sistemas de filtrado colaborativo basado en usuarios
### UBCF
ubcf <- Recommender(data = data_train,
                    method = "UBCF")
ubcf.mod <- getModel(ubcf)
ubcf.mod
ubcf.pred <- predict(object = ubcf,
                     newdata = data_test,
                     n = n_rec)
ubcf.pred
ubcf.rec.matrix <- sapply(ubcf.pred@items, 
                          function(x){colnames(rating_movies)[x]})
View(ubcf.rec.matrix[,1:3])
 

#### 134. Representando la matriz de valoraciones
recommeder_models <- recommenderRegistry$get_entries(dataType = "realRatingMatrix")
names(recommeder_models)

image(MovieLense,
      main = "Mapa de calor de la matriz de valoraciones")

min_n_movies <- quantile(rowCounts(MovieLense), 0.99)
min_n_users <- quantile(colCounts(MovieLense), 0.99)

image(MovieLense[rowCounts(MovieLense)>min_n_movies,
                 colCounts(MovieLense)>min_n_users])

min_n_rmovies <- quantile(rowCounts(rating_movies), 0.98)
min_n_rusers <- quantile(colCounts(rating_movies), 0.98)

image(rating_movies[rowCounts(rating_movies)>min_n_rmovies,
                    colCounts(rating_movies)>min_n_rusers])


### 135. Filtrado colaborativo para datos binarios
# tranformamos en binaria la matriz de peliculas (solo para no cargar otro df)
rating_movies_viewed <- binarize(rating_movies,
                                 minRating = 1)
t.id <- sample(x = c(T, F),
               size = nrow(rating_movies_viewed),
               replace = T,
               prob = c(0.8, 0.2))

b_data_train <- rating_movies_viewed[t.id,]
b_data_test <- rating_movies_viewed[!t.id,]
b_model <- Recommender(data = b_data_train,
                       method = "IBCF",
                       parameter = list(method = "Jaccard"))
b_details <- getModel(b_model)
b_details
b_pred <- predict(object = b_model,
                  newdata = b_data_test,
                  n = n_rec)

b_rec_matrix <- sapply(b_pred@items, function(x){colnames(rating_movies)[x]})
View(b_rec_matrix[,1:4])
