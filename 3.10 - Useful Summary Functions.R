#3.10 - Useful Summary Functions

library(nycflights13)
library(magrittr)
library(nycflights13)
library(dplyr)

#1)Measures of location

#a)mean(x)
#b)median(x)

install.packages('magrittr')
install.packages('nycflights13')

#a)Vôos não cancelados.
not_cancelled <- flights %>% filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>% group_by(year, month, day) %>% 
  summarise(
    #Average delay:
    avg_delay1 = mean(arr_delay),
    #avarage positive delay:
    avg_delay2 = mean(arr_delay[arr_delay > 0])
  )

#2)Measures of Spread

#a)sd(x) - Desvio padrão
#b)IQR(x) - interquartile range
#c)mad(x) - median absolute deviation

#2.1) Exemplo 1 - Why is distance to some destinations more variable
# than to others?

not_cancelled %>% group_by(dest) %>%
  summarise(distance_sd = sd(distance)) %>%
  arrange(desc(distance_sd))

#3)Measures of rank min(x), quantile(x, 0.25), max(x)

#3.1) Exemplo 1 - When do the first and last flights leave each day?
not_cancelled %>% group_by(year, month, day) %>%
  summarise(
    first = min(dep_time),
    last = max(dep_time)
  )

#4)Measures of Position. first(x), last(x) e nth(x, 2)

#4.1)Exemplo - realizar o 3.1 através de outro método.

not_cancelled %>% group_by(year, month, day) %>%
  summarize(
    first_dep = first(dep_time),
    last_dep = last(dep_time)
  )

#5)These functions are complementary to filtering on ranks. Filtering
#gives you all variables, with each observation in a separate
#row:

not_cancelled %>% group_by(year, month, day) %>%
  mutate(r = min_rank(desc(dep_time))) %>%
  filter(r %in% range(r))






