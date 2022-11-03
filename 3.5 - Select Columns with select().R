#3.5) Select Columns with select()

#1)Exemplo 1 - Select columns by name.
select(flights, year, day, month)

#2)Exemplo 2 - Select all columns between year and day (inclusive)
select(flights, year:day)

#3)Select all columns except those from year to day (inclusive)
select(flights, -(year:day))

#4)Renomear variáveis.
rename(flights, tail_num = tailnum)

#5)Mover Colunas p/ o início do data.frame.
select(flights, time_hour, air_time, everything())

#Exercícios - Página 54

#1)Brainstorm as many ways as possible to select dep_time,
#dep_delay, arr_time, and arr_delay from flights.

#a)Maneira Padrão.
select(flights, dep_time, dep_delay, arr_time, arr_delay)
select(flights, c(dep_time, dep_delay, arr_time, arr_delay))
flights %>% select(dep_time, dep_delay, arr_time, arr_delay)
flights %>% select(dep_time, dep_delay, arr_time, arr_delay)

#b)Métodos sofisticados.
flights %>% select(dep_time:arr_delay, -c(contains('sched')))

flights %>% select(ends_with('time'), ends_with('delay')) %>%
  select(-c(starts_with('sched'), starts_with('air')))

flights %>% select(contains('dep'), contains('arr'), -contains('sched'), -carrier)

flights %>% select(matches("^dep|arr_delay|time$"))
flights %>% select(matches("^dep|^arr"))
flights %>% select(matches("^dep|^arr.*time$|delay$"))
flights %>% select(matches("^dep|^arr_time$|delay$"))

#2)What happens if you include the name of a variable multiple
#times in a select() call?

flights %>% select(arr_delay, arr_delay, arr_delay)

#Resp: vai mostrar a coluna apenas uma vez. Independente da quantidade de 
#repetições que temos na função.

#3)What does the one_of() function do? Why might it be helpful
#in conjunction with this vector?
?one_of
vars <- c(
  "year", "month", "day", "dep_delay", "arr_delay"
)

#Nota:It returns all the variables you ask for, for example ones stored in a vector.

flights %>% select(one_of(vars))

#4)Does the result of running the following code surprise you?
#How do the select helpers deal with case by default? How can
#you change that default?

select(flights, contains("TIME"))
select(flights, contains("TIME", ignore.case = FALSE))

#Resp: não surpreende, pois o programa pega todas as variáveis que contém a
#a palavra "time" em sua composição.

#Nota:The default helper functions are insensitive to case. This can be 
#changes by setting `ignore.case=FALSE`.

















