#3.4) Arrange Rows with arrange()

#arrange() works similarly to filter() except that instead of selecting
#rows, it changes their order

#1)Exemplo 1
flights
arrange(flights, year, month, day)

#a)Use desc() to reorder by a column in descending order:
arrange(flights, desc(arr_delay))

#2)Exemplo 2 - Missing values are always sorted at the end:
df <- tibble(x = c(5, 2, NA))
arrange(df, x) #colocando a coluna de forma crescente.
arrange(df, desc(x))  #colocando a coluna de forma decrescente.

#Exercícios Página 51

#1)How could you use arrange() to sort all missing values to the
#start? (Hint: use is.na().)

df <- tibble(x = c(5, 2, NA))
arrange(df, desc(is.na(x)))      #Jeito 1
arrange(df, -is.na(x))      #Jeito 2

#2)Sort flights to find the most delayed flights. Find the flights
#that left earliest.
arrange(flights, desc(dep_delay))
arrange(flights, dep_delay)

#3)Sort flights to find the fastest flights.
arrange(flights, (arr_time - dep_time))

#4)Which flights traveled the longest? Which traveled the shortest?
arrange(flights, desc(distance))
arrange(flights, distance)

#Nota: operador pipe %>%

#Exemplo) Vamos calcular a raiz quadrada da soma dos valores de 1 a 4. 
#Primeiro, sem o pipe.

x <- c(1, 2, 3, 4)
sqrt(sum(x))
## [1] 3.162278

# Agora com o pipe.

x %>% sum %>% sqrt
## [1] 3.162278

