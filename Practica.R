x <- -4
class(x)

x <- c(4, "a", TRUE)
class(x)

x <- c(1, 3, 5)
y <- c(3, 2, 10)
rbind(x, y)

x <- list(2, "a", "b", TRUE)
x[[1]]

x <- 1:4
y <- 2
x+y

x <- c(17, 14, 4, 5, 13, 12, 10)
x[x>10] <-  4

# Extract the first two rows:
print(hw1_data[1:2, ])

# Extract the last 2 rows:
n <- nrow(hw1_data)
print(hw1_data[(n - 2 + 1):n, ])

# Value of Ozone in 47th row
print(hw1_data[47, 1])

# Sum of NA in Ozone
miss <-  is.na(hw1_data[,"Ozone"])
sum(miss)

# Mean of Ozone, remove NA
summary(hw1_data$Ozone, na.omit())

# Extract the subset of rows of the data frame where Ozone values are above 31 
# and Temp values are above 90. What is the mean of Solar.R in this subset?
extract <- subset(hw1_data, Ozone > 31 & Temp > 90)
mean(extract$Solar.R)
extract2 <- subset(hw1_data, Month == 6)
mean(extract2$Temp)
extract3 <- subset(hw1_data, Month == 5)
summary(extract3)

# Práctica con Swirl
library(swirl)
packageVersion("swirl")
install_from_swirl("R Programming")

ls() # Ver los objetos en mi workspace
list.files() dir() # Ver los archivos en mi WD
args() # sobre nombre de función para ver qué argumentos puede tomar
dir.create() # para crear un directorio en el actual WD (adentro nombre del
# nuevo directorio)
setwd() # entre los ("") el nombre del directorio
file.create() # entre ("") el nombre del nuevo archivo
file.exists() # entre  ("") el nombre del archivo cuya existencia queremos 
# comprobar
file.info() # entre ("") el nombre del archivo cuyos datos queremos ver
file.rename() # primero "from", después "to"
file.copy() # primero "from", después "nuevo nombre"
file.path() # chequear directorio de "nombre de archivo"
seq(0, 10, by=0.5) # genera secuencia del 1 al 10 con un incremento de 0.5
my_seq <- seq(5, 10, length=30) # secuencia del 5 al 10 de 30 dígitos (sin 
# importar el tipo de incremento)
length(my_seq) # para chequear la cantidad de ítems en ese elemento
# Si quiero generar una secuencia de la misma cantidad de ítems pero no sé
# cuantos tiene, puedo hacer:
1:length(my_seq)
seq(along.with = my_seq)
seq_along(my_seq)

# Si quiero hacer un vector que contenga 40 ceros:
rep(0, times=40)

# Si quiero hacer un vector que contenga 10 repeticiones de 0, 1, 2:
rep(c(0, 1, 2), times=10)

# Si quiero que mi vector tenga 10 veces el 0, 10 el 1 y 10 el 2:
rep(c(0, 1, 2), each = 10)

# Si tengo un vector de palabras y quiero unirlas en un vector único:
my_char(c("My", "name", "is"))
paste(my_char, collapse = " ") # el espacio es para indicar el símbolo de unión

# Para agregar otro ítem:
c(my_char, "Macarena")

# Para unificar dos vectores:
paste(c(1:3), c("X", "Y", "Z"), sep="")
paste(LETTERS, 1:4, sep="-") # si un vector es más largo que el otro, el más
# corto se recicla

# Para generar una muestra aleatoria de 100 elementos a partir de dos grupos
# de elementos, y, x:
my_data <- sample(C(y, z), 100)
my_na <- is.na(my_data) # para saber dónde están los NA
sum(my_na) # para contarlo, porque TRUE es 1.

# Subsetting
# Si quiero seleccionar los primeros diez elementos de un vector, lo pongo
# entre corchetes
x[1:10]

# Si me interesa crear un vector que contenga los elementos que no son NA,
# puedo usar la función is.na() pero con la negación (!).
y <- x[!is.na(x)]

#' Puedo usar los operadores lógicos >, <, ==, |, para generar un vector lógico
#' de TRUEs y FALSEs, y además utilizar eso para generar un subset, por ejemplo
#' de todos los valores positivos de y:
y[y > 0]

# También se pueden combinar las condiciones:
x[!is.na(x) & x > 0]

# Y se puede hacer subsetting a partir de un vector de posiciones:
x[c(3, 5, 7)]

# Y también por la negativa:
x[c(-2, -10)]
x[-c(2, 10)]

#' A la hora de crear un vector con nombres de variables, puedo hacerlo directa-
#' mente o puedo primero hacer el vector y después agregarle los nombres.
vect <- c(foo = 11, bar = 2, norf = NA)
vect2 <- c(11, 2, NA)
names(vect2) <- c("foo", "bar", "norf")

# Puedo chequear identidad:
identical(vect, vect2)

# Podemos hacer subsetting de un vector a partir del nombre, y va a devolver
# el contenido, y también podemos hacer un vector con los nombres:
vect["bar"]
vect[c("foo", "bar")]

# Matrices and dataframes
# A la hora de crear un vector que contenga por ejemplo los números del 1 al 20,
# no necesito usar c()
my_vector <- 1:20

# Con la función dim() puedo chequear las dimensiones. Como es un vector, el 
# resultado va a ser NULL, por lo que podemos usar lenght():
dim(my_vector)
length(my_vector)

# Puedo usar la función dim() para darle el atributo dimensión a mi vector:
dim(my_vector) <- c(4, 5)

# Para chequear, puedo usar de nuevo dim() o attributes(), y class() para 
# confirmar que ahora es una matriz.
dim(my_vector)
attributes(my_vector)
class(my_vector)

# Puedo crear la matriz directamente con la función matrix():
my_matrix2 <- matrix(data = 1:20, nrow = 4, ncol = 5)

# Si quisiera agregar una columna nueva de información, por ejemplo el nombre
# de los pacientes, primero armo un vector con los nombres y después se lo
# sumo a la matrix con cbind():
patients <- c("Bill", "Gina", "Kelly", "Sean")
cbind(patients, my_matrix)
# Atención: como las matrices solo aceptan un tipo de datos, esta operación
# fuerza a que los números sean considerados como caracteres. La solución es
# convertirlo a un dataframe:
my_data <- data.frame(patients, my_matrix)

# Si quiero agregar ahora una fila que contenga los nombres de las columnas,
# armo primero un vector con los nombres y después uso la función "colnames":
cnames <- c("patient", "age", "weight", "bp", "rating", "test")
colnames(my_data) <- cnames