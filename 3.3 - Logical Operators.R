#3.3 - Logical Operators

Sys.setenv(LANGUAGE = "en")

#a) & - 'and'
#b) ! - 'not'
#c) | - 'or'
#d) != - 'Not Equal'

install.packages("dplyr")
install.packages("nycflights13")
nycflights13::flights
library("tidyverse")
install.packages('tidyverse')


#1)Exemplo 1 The following code finds all flights that departed in November or
#December:

#a) Jeito 1
a <- filter(nycflights13::flights, month == 11 | month == 12 )

#b) Jeito 2
nov_dec <- filter(flights, month %in% c(11, 12))

#2)Encontrar vôos que não estejam atrasados, por mais de 2 horas, seja na 
#partida ou chegada.

#a)Jeito 1
filter(flights, !(arr_delay > 120 | dep_delay > 120))

#b)Jeito 2
filter(flights, arr_delay <= 120, dep_delay <= 120)

#3)Saber se algum valor está faltando:
is.na(x)

#Nota: no caso, falta atribuir alguma valor para variável "x".

#4) Caso queira presenvar os valores que faltam, exemplo:

df <- tibble(x = c(1, NA, 3))

#a)Filtrar Valores de x maiores do que 1.
filter(df, x > 1)

#b)Filtrar valores "NA" ou x > 1.
filter(df, is.na(x) | x > 1)

#Exercícios - Página 49

#1) Find all flights that:

#a)Had an arrival delay of two or more hours;
filter(flights, arr_delay >= 120)

#b)Flew to Houston;
filter(flights, dest == "IAH" | dest == "HOU")
filter(flights, dest %in% c('IAH', 'HOU'))

#c)Were operated by United, American, or Delta
filter(flights, carrier == 'UA' | carrier == 'AA' | carrier == 'DL')
filter(flights, carrier %in% c('UA', 'AA', 'DL'))

#d)Departed in summer (July, August, and September)
filter(flights, month >= 7 & month <= 9)
filter(flights, month %in% c(7, 8, 9))

#e)Arrived more than two hours late, but didn't leave late
filter(flights, arr_delay > 120, dep_delay <= 0)
filter(flights, arr_delay > 120 & dep_delay <= 0)

#f)Were delayed by at least an hour, but made up over 30 minutes in flight
filter(flights, dep_delay >= 60, dep_delay-arr_delay > 30)
filter(flights, dep_delay >= 60 & dep_delay-arr_delay > 30)

#g)Departed between midnight and 6 a.m. (inclusiv
filter(flights, dep_time <=600 | dep_time == 2400)

#2) Another useful dplyr filtering helper is between().

filter(flights, between(month, 7, 9))
filter(flights, !between(dep_time, 601, 2359))

#Between is a shorter, faster way of testing two inequalities at once: 
#it tests if its first argument is greater than or equal to its second, 
#and less than or equal to its third.

#3)How many flights have a missing dep_time? What other variables
#are missing? What might these rows represent?
summary(flights)

#Nota: dep_time tem 8255 missings. dep_delay tem 8255 missings.
#arr_time tem 8713. arr_delay tem 9430. air_time tem 9430.









