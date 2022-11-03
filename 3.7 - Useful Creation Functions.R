#3.7 - Useful Creation Functions

#Operadores Matemáticos.

#a) %/% - divisão inteira.
25 %/% 4

#b) / - divisão exata.
25 / 4

#c)%% - Resto da divisão.
25 %% 4

#1)Exemplo 1)
flights %>% transmute(dep_time, 
                      hour = dep_time %/% 100, 
                      minute = dep_time %% 100)

#2) funções Offset - lead() and lag() allow you to refer to leading or lagging 
#values. Abaixo, temos um exemplo.
x <- 1:10
x <- c(1:10)

#a)Achar o Lag e Lead
lag(x)
lead(x)

#b)Cumulative and rolling aggregates.

cumsum(x)     #Somas Cumulativas

cummean(x)    #Somas das Médias

cumprod(x)   #Somas dos Produtos

cummin(x)    #Soma cumulativas do mínimos.

cummax(x)    #Soma cumulativas do Máximos.

#3) Ordenamento de variáveis.
y <- c(1, 2, 2, NA, 3, 4)

min_rank(y)

min_rank(desc(y))

row_number(y)

percent_rank(y)

cume_dist(y)

#Exercícios - Página 58

#1)Currently dep_time and sched_dep_time are convenient to look
#at, but hard to compute with because they're not really continuous
#numbers. Convert them to a more convenient representation
#of number of minutes since midnight.


#a)Maneira Linican de Fazer.
fly_h_m <- flights %>% select(dep_time, sched_dep_time)
fly_h_m %>% mutate(dep_time_h = dep_time %/% 100, 
                   dep_time_min = dep_time %% 100, 
                   sched_dep_time_h = sched_dep_time %/% 100, 
                   sched_dep_time_min = sched_dep_time %% 100)
  

#b)with integer division.
flights %>% mutate(dep_time = (dep_time %/% 100) * 60 + (dep_time %% 100), 
            sched_dep_time = (sched_dep_time %/% 100) * 60 + (sched_dep_time %% 100)) 


#2)Compare air_time with arr_time - dep_time. What do you
#expect to see? What do you see? What do you need to do to fix
#it?

flights %>% select(air_time)
flights %>% 
  mutate(dep_time = (dep_time %/% 100) * 60 + (dep_time %% 100),
    sched_dep_time = (sched_dep_time %/% 100) * 60 + (sched_dep_time %% 100),
    arr_time = (arr_time %/% 100) * 60 + (arr_time %% 100),
    sched_arr_time = (sched_arr_time %/% 100) * 60 + (sched_arr_time %% 100)) %>%
  transmute((arr_time - dep_time) %% (60*24) - air_time)

#3)Compare dep_time, sched_dep_time, and dep_delay. How
#would you expect those three numbers to be related?

flights %>% select(c('dep_time', 'sched_dep_time', 'dep_delay'))

#Nota: o 'dep_delay' é resultado da subtração entre dep_time e sched_dep_time.

#4)Find the 10 most delayed flights using a ranking function. How
#do you want to handle ties? Carefully read the documentation
#for min_rank().
g <- filter(flights, min_rank(desc(dep_delay))<=10)
q <- flights %>% top_n(n = 10, wt = dep_delay)


#5)What does 1:3 + 1:10 return? Why?
1:3 + 1:10

#Nota: ocorre um erro.

#6)What trigonometric functions does R provide?

#cos(x), sin(x), tan(x), acos(x), asin(x), atan(x), atan2(y,x). 
#Except atan2(y,x), all functions take radians as argument, not degrees.









