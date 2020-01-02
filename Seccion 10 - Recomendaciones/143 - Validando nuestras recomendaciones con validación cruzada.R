library(recommenderlab)
library(ggplot2)
data("MovieLense")


rating_movies <- MovieLense[
  rowCounts(MovieLense) > 50,
  colCounts(MovieLense) > 100
]

n_folds <- 4
items_to_keep <- 15
rating_threshold <- 3
eval_sets <- evaluationScheme(data = rating_movies,
                              method = "cross-validation",
                              k = n_folds,
                              give = items_to_keep,
                              goodRating = rating_threshold)

size_set <- sapply(eval_sets@runsTrain, 
                   length)
