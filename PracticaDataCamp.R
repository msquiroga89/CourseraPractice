# Si tengo una matrix, puedo crear un vector que sume las cantidades de cada
# columna / fila:
box_office <- c(460.998, 314.4, 290.475, 247.900, 309.306, 165.8)
star_wars_matrix <- matrix(box_office, nrow = 3, byrow = TRUE,
                           dimnames = list(c("A New Hope", "The Empire Strikes Back", "Return of the Jedi"), 
                                           c("US", "non-US")))

View(star_wars_matrix)

# vector que suma: rowSums y colSums
worldwide_vector <- rowSums(star_wars_matrix)

# y puedo sumar ese vector con las sumas a la tabla:
all_wars_matrix <- cbind(star_wars_matrix, worldwide_vector)

# lo mismo se puede hacer con las filas:
all_wars_matrix <- rbind(star_wars_matrix, star_wars_matrix2)

# Para crear una variable factorizada:
# Primero creo el vector:
sex_vector <- c("Male", "Female", "Female", "Male", "Male")

# Después lo convierto en factor:
factor_sex_vector <- factor(sex_vector)

# Si tengo una variable categórica ordinal:
temperature_vector <- c("High", "Low", "High","Low", "Medium")
factor_temperature_vector <- factor(temperature_vector, order = TRUE, 
                                      levels = c("Low", "Medium", "High"))

# Si probamos la función summary(), vemos que si se lo aplicamos a sex_vector
# o a temperature_vector antes de ponerle el factor(), no nos va a tirar los
# estadísticos.
# Importante: factor_sex_vector es un vector categorial NOMINAL, en cambio 
# factor_temperature_vector es ORDINAL y por eso tiene la variable "order".
# Los vectores categoriales ordinales nos permiten seleccionar ítems dentro
# del vector para hacer comparaciones:
tem1 <- factor_temperature_vector[1]
tem2 <- factor_temperature_vector[2]
tem1 > tem2

# Para explorar un dataset:
head(mtcars) # primeras filas
tail(mtcars) # últimas filas
str(mtcars) # estructura general

# Para crear un dataset, primero se deben especificar los vectores (que van a
# ser las columnas). Luego, se lo une con data.frame()
# Definition of vectors
name <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Create a data frame from the vectors
planets_df <- data.frame(name, type, diameter, rotation, rings)

# Para hacer subsetting, podemos usar los [] con los números de filas y de
# columnas, pero también podemos usar los nombres de las columnas:
planets_df[1:5,"diameter"]
# Puedo asignar esta selección a un nombre y usar mean() o summary()

rings_vector <- planets_df$rings
# Para seleccionar todas las columnas de los planetas que tienen anillos (es
# decir, que rings = TRUE):
planets_df[rings_vector,]

# Esto mismo se logra con subset()
# subset(my_df, subset = some_condition). Ej:
subset(planets_df, subset = diameter < 1)

# Si necesito ordenar los elementos de un vector:
a <- c(100, 10, 1000)
order(a)

# Y si quiero reordenarlo:
a[order(a)]

# Volviendo al df planets_df, si quiero recordenarlos según el diámetro de los
# planetas, primero tengo que crear el vector de las posiciones:
positions <- order(planets_df$diameter)
# y después ordeno el df a partir de eso:
planets_df[positions, ]