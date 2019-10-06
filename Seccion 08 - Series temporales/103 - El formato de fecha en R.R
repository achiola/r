#EPOCH: 1 de enero 1970

#Hoy
Sys.Date()

#Año con dos digitos
as.Date("1/1/80", format="%m/%d/%y")

#Año con cuatro digitos
as.Date("1/1/1980", format="%m/%d/%Y")

#por defecto sume
#   yyyy-mm-dd
# o yyyy/mm/dd
as.Date("2018-01-06")
unaFecha <- as.Date("2018-01-31")
as.Date("2018-20-31")

#fecha a numero
as.numeric(unaFecha)
as.numeric(Sys.Date())

#otros formatos
as.Date("Enero 8, 1975", format = "%b %d, %Y")

#Casting
dt <- 2019
class(dt) <- "Date"
dt

#dias desde un punto dado
as.Date(10, origin = as.Date("2019-01-01"))

#Componentes de las fechas
dt <- as.Date("Enero 8, 1975", format = "%b %d, %Y")
format(dt, "%Y")
format(dt, "%b")
format(dt, "%B")
as.numeric(format(dt, "%Y"))
months(dt)
weekdays(dt)
quarters(dt)
julian(dt)
julian(dt, origin = as.Date("00/01/01"))

#### 104. Operaciones y secuencias de fechas
dt <-  as.Date("01/01/2001", format = "%m/%d/%Y")

dt+100
dt-100

dt2 <-  as.Date("01/02/2001", format = "%m/%d/%Y")
dt2 - dt
dt - dt2
dt - dt
as.numeric(dt2 - dt)
dt < dt2

#secuencias
seq(dt, dt+365, "month")
seq(dt, dt+15, "day")

seq(dt, dt+365, "10 days")

seq(from =  dt, by = "10 days", length.out = 10)
