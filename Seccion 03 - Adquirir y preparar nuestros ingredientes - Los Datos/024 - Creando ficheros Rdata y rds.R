clientes <- c("Juan Gabriel", "Abel Chiola", "Pedro")
fechas <- as.Date(c("2019-1-1","2018-12-1","2019-8-24"))
pago <- c(215,199.55,40.14)

pedidos <- data.frame(clientes,fechas,pago)
clientes_vip <- c("Juan Gabriel", "Abel Chiola")

save(pedidos, file = "Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/pedidos.Rdata")

saveRDS(pedidos, file = "Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/pedidos.rds")

save(pedidos, clientes_vip, file = "Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/pedidos.Rdata")

remove(pedidos)
