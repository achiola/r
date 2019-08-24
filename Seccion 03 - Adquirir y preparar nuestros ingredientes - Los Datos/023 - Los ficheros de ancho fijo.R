# ancho fijo sin cabecera
students_fwf <- read.fwf("Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/student-fwf.txt",
                         widths = c(4, 15, 20, 15, 4),
                         col.names = c("id", "nombre", "email","carrera","año"))

# ancho fijo conbecera y saltando dos filas
students_fwf_header <-  read.fwf("Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/student-fwf-header.txt",
                                 widths = c(4, 15, 20, 15, 4),
                                 header = TRUE, sep = "\t",
                                 skip = 2)

# ancho fijo sin cabecera e ignorando una columna
students_fwf <- read.fwf("Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/student-fwf.txt",
                         widths = c(4, 15, -20, 15, 4),
                         col.names = c("id", "nombre","carrera","año"))
