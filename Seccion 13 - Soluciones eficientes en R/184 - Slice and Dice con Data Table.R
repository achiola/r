auto <- read.csv("Seccion 13 - Soluciones eficientes en R/auto-mpg.csv",
                 stringsAsFactors = F)
auto$cylinders <- factor(auto$cylinders,
                         levels = c(3,4,5,6,8),
                         labels = c("3C","4C","5C","6C","8C"))

library(data.table)

auto.dt <- data.table(auto)
setkeyv(auto.dt,c("cylinders","model_year"))

auto.dt[ , .N, by = cylinders]
auto.dt["3C", .N]


#Agregar y eliminar una columna
auto.dt[,mean_pgm := mean(mpg), by=cylinders]
head(auto.dt)
auto.dt[,mean_pgm := NULL]
head(auto.dt)


# joins
empl <- read.csv("Seccion 13 - Soluciones eficientes en R/employees.csv",
                 stringsAsFactors = F)
head(empl)
dept <- read.csv("Seccion 13 - Soluciones eficientes en R/departments-1.csv",
                 stringsAsFactors = F)
head(dept)


#pasamos a dt
empl.dt <- data.table(empl)
dept.dt <- data.table(dept)

setkey(empl.dt, "DeptId")
#como es la primer columna de la tabla dept no hace falta crear la key
combine <- empl.dt[dept.dt]
head(combine)


# error cuando la cantidad de registros es superior al tamaño de cualquier de los dos dt
dept2 <- read.csv("Seccion 13 - Soluciones eficientes en R/departments-2.csv",
                  stringsAsFactors = F)
dept2.dt <- data.table(dept2)
combine2 <- empl.dt[dept2.dt]
head(combine2)

#inner join
combine2_inner <- empl.dt[dept2.dt, nomatch = 0]

#merge
merge(empl.dt, dept2.dt,
      by = "DeptId") #inner join

merge(empl.dt, dept2.dt,
      by = "DeptId",
      all.x = T) #left join

merge(empl.dt, dept2.dt,
      by = "DeptId",
      all.y = T) #right join

merge(empl.dt, dept2.dt,
      by = "DeptId",
      all = T) #full join




#Simbolos especiales DT[i, j, by]
# .SD = guarda referencia de todas las columna, menos las del by
  #.SDcols = referencias a las columnas de j
# .EACHI = para agrupar por claves
# .N = para contar filas
# .I = las claves (idx)


# sueldo maximo por cada departamento
empl.dt[dept.dt,
        max(.SD),
        by = .EACHI,
        .SDcols = "Salary"]


empl.dt[dept2.dt,
        max(.SD),
        by = .EACHI,
        .SDcols = "Salary"]

#Sueldo promedio por depto
empl.dt[,
        .(AvgSalary = lapply(.SD, mean)),
        by = "DeptId",
        .SDcols = "Salary"]


empl.dt[dept2.dt,
        list(DeptName, AvgSalary = lapply(.SD, mean)),
        by = .EACHI,
        .SDcols = "Salary"]
