repos <- getOption("repos")
repos

repos["mxnet"] <- "https://s3.amazonaws.com/mxnet-r"
repos
options(repos = repos)

install.packages("mxnet")
install.packages("jpeg")
install.packages("png")
install.packages("Rtools")

library(devtools)
devtools::install_github("rich-iannone/DiagrammeR")
