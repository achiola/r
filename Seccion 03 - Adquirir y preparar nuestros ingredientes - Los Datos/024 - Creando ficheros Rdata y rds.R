clientes <- c("Juan Gabriel", "Abel Chiola", "Pedro")
fechas <- as.Date(c("2019-1-1","2018-12-1","2019-8-24"))
pago <- c(215,199.55,40.14)

pedidos <- data.frame(clientes,fechas,pago)
clientes_vip <- c("Juan Gabriel", "Abel Chiola")

save(pedidos, file = "Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/pedidos.Rdata")

saveRDS(pedidos, file = "Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/pedidos.rds")

save(pedidos, clientes_vip, file = "Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/pedidos.Rdata")

remove(pedidos)


# 25. Cargando ficheros Rdata y rds
#limpiamos las variables 

#Cargamos el Rdata
load("Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/pedidos.Rdata")

#Cargamos el rds (no guarda la variable, solo los datos, y solo puede guarda un solo objeto)
orders <- readRDS("Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/pedidos.rds")


# Datasets que vienen con R
data(iris)
data(cars)


# Guardar todos los objetos de la session
save.image(file = "Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/alldata.Rdata")

#Otra forma de guardar variables
primes <- c(2, 3, 5, 7, 11, 13)
pow2 <- c(2, 4, 8, 16, 32, 64, 128)
save(list = c("primes", "pow2"), file = "Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/primes_and_pow2.Rdata")

# Cuando cargamos una variable y esta ya existe, por defecto no avisa si lo hacemos con load
# con attach si nos avisa
attach("Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/primes_and_pow2.Rdata")


# Si queremos ver todos los dataset que vienen, lo podemos hacer con el paquete datasets
data()
