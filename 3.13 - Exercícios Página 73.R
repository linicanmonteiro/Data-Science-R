#Exercícios - Página 72

library(nycflights13)
library(magrittr)
library(nycflights13)
library(dplyr) 

#2)Come up with another approach that will give you the same
#output as not_cancelled %>% count(dest) and not_cancel
#led %>% count(tailnum, wt = distance) (without using count()).

not_cancelled <- flights %>% filter(!is.na(dep_delay), !is.na(arr_delay))

#a)Primeira Expressão
not_cancelled %>% count(dest)

#solução 1 - podemos combinar a função 'group_by' e 'summarize'.
not_cancelled %>% group_by(dest) %>%
  summarize(n = length(dest))

#solução 2 - An alternative method for getting the number of observations in a data 
#frame is the function n()..

not_cancelled %>% group_by(dest) %>%
  summarise(n = n())

#b)Segunda Expressão
not_cancelled %>% count(tailnum, wt = distance)

#Solução 1
not_cancelled %>% group_by(tailnum) %>%
  tally(distance)

#Solução 2
not_cancelled %>% group_by(tailnum) %>%
  summarise(n = sum(distance))

#3)Our definition of cancelled flights (is.na(dep_delay) |
#is.na(arr_delay) ) is slightly suboptimal. Why? Which is the
#most important column?
  
#So the most important column is arr_delay, which indicates 
#the amount of delay in arrival.  
  
flights %>% filter(!is.na(dep_delay), !is.na(arr_delay)) %>%
  select(dep_time, arr_time, sched_arr_time, dep_delay, arr_delay)
  
#4)Look at the number of cancelled flights per day. Is there a pattern?
#Is the proportion of cancelled flights related to the average delay?  

daily <- flights %>% group_by(year, month, day)
per_day <- daily %>% summarize(flights = n())

#a)Vôos cancelados por dia.
cancelled_per_day <- 
  flights %>%
  mutate(cancelled = (is.na(arr_delay) | is.na(dep_delay))) %>%
  group_by(year, month, day) %>%
  summarise(
    cancelled_num = sum(cancelled),
    flights_num = n()
  )

#b)Plotar os vôos flight_num contra cancelled_num
library('tidyverse')

ggplot(cancelled_per_day) +
  geom_point(mapping = aes(x = flights_num, y = cancelled_num))

#c)Extrair a relação entre vôos cancelados e quantidade de vôos.
cancelled_and_delays <-
  flights %>%
  mutate(cancelled = (is.na(arr_delay) | is.na(dep_delay))) %>%
  group_by(year, month, day) %>%
  summarise(
    cancelled_prop = mean(cancelled),
    avg_dep_delay = mean(dep_delay, na.rm = TRUE),
    avg_arr_delay = mean(arr_delay, na.rm = TRUE)
  ) %>%
  ungroup()

#d)Plote um grágico da relação.
ggplot(cancelled_and_delays) +
  geom_point(mapping = aes(x = avg_dep_delay, y = cancelled_prop))

#5)Which carrier has the worst delays? Challenge: can you disentangle
#the effects of bad airports versus bad carriers? Why/why
#not? (Hint: think about flights %>% group_by(carrier,dest) %>% summarize(n()).)

#a)Colocar de maneira decrescente o atraso de vôos.
flights %>%
  group_by(carrier) %>%
  summarise(arr_delay = mean(arr_delay, na.rm = TRUE)) %>%
  arrange(desc(arr_delay))

filter(airlines, carrier == 'F9')

#b)airports versus bad carriers - Second Part  

#Resp: devemos separar o efeito das companhias aéreas com os aeroportos.

flights %>% 
  filter(!is.na(arr_delay)) %>%

#Total delay by carrier within each origin, dest
  group_by(origin, dest, carrier) %>% 
  summarise(arr_delay = sum(arr_delay),
            flights = n()
            ) %>%
  
#Total Delay Within each origin test
  group_by(origin, dest) %>% 
  mutate(arr_delay_total = sum(arr_delay), 
         flights_total = sum(flights)
         ) %>%

#average delay of each carrier - avarage delay of other carriers
ungroup() %>%
  mutate(
    arr_delay_others = (arr_delay_total - arr_delay) / (flights_total - flights),
    arr_delay_mean = arr_delay / flights,
    arr_delay_diff = arr_delay_mean - arr_delay_others
  ) %>%
#Remove Na values (when there is only one carrier)
  filter(is.finite(arr_delay_diff)) %>%

#Average Over all airports it flies to
  group_by(carrier) %>%
  summarise(arr_delay_diff = mean(arr_delay_diff)) %>%
  arrange(desc(arr_delay_diff))

#6)For each plane, count the number of flights before the first delay
#of greater than 1 hour
install.packages("lubridate")
library(lubridate)

flights %>%
  mutate(dep_date = lubridate::make_datetime(year, month, day)) %>%
  group_by(tailnum) %>%
  arrange(dep_date) %>%
  filter(!cumany(arr_delay>60)) %>%
  tally(sort = TRUE)
  
#6) What does the sort argument to count() do? When might you
#use it?  
  
#Resp:The `sort` argument to `count()` sorts by descending order of `n`. 
#This is useful because often the most common group is the most important.  
  





  
  
  