m <- matrix(seq(1,16),4,4)
m

####minimo 
##fila
apply(m, 1, min)
#columna
apply(m, 2, min)


####producto
##fila
apply(m, 1, prod)
#columna
apply(m, 2, prod)


#aplicar tanto a filas como columnas
apply(m, c(1,2), function(x){x^2})


#parametros de una fx
apply(m, 1, quantile, probs = c(0.40, 0.60, 0.80))


## operaciones especificas de matrices
colSums(m)
rowSums(m)
colMeans(m)


#Operaciones con array
array3D <- array(seq(1,32), dim = c(4,4,2))
array3D
apply(array3D, 3, sum)
apply(array3D, c(1,2), sum)
apply(array3D, c(1,3), min)
