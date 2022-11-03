#3.8 - Grouped Summaries with summarize()

#The last key verb is summarize(). It collapses a data frame to a single
#row:

summarize(flights, delay = mean(dep_delay, na.rm = TRUE))

#1)Exemplo 1 - organizar a média de atraso por dia.
by_day <- group_by(flights, year, month, day)
summarize(by_day, delay = mean(dep_delay, na.rm = TRUE))


#2)Combining Multiple Operations with the Pipe

#Exemplo 1) Combinar a relação entre distância e atraso.
by_dest <- group_by(flights, dest)
delay <- summarize(by_dest,
                   count = n(),
                   dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE))

delay <- filter(delay, count > 20, dest != "HNL")

#a)Criar um gráfico da Realidade Acima.
library(tidyverse)
ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)


#Exemplo 2) Mesmo análise acima, usando o operador %>%
delays <- flights %>% group_by(dest) %>% 
  summarize(count = n(), 
            dist = mean(distance, na.rm = T),
            delay = mean(arr_delay, na.rm = T)) %>%
  filter(count > 20, dest != 'HNL')
  
#3)Missing Values - pegando os exemplos anteriores.
flights %>% group_by(year, month, day) %>% 
  summarize(mean = mean(dep_delay))

#Nota:That's because aggregation functions obey the usual rule of missing 
#values: if there's any missing value in the input, the output will be a 
#missing value.

flights %>% group_by(year, month, day) %>%
  summarize(mean = mean(dep_delay, na.rm = T))

#Nota caso acima, 'Missing Values' representa vôos cancelados.
#Inicialmente, vamos remover os vôos cancelados.

#4)Outro Método de Excluir os dados cancelados.
not_cancelled <- flights %>%
  filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>% group_by(year, month, day) %>%
  summarize(mean = mean(dep_delay))




































