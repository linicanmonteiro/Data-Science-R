#3.6 - Add New Variables with mutate()

#Objetivo: adicionar variáveis que são funções de uma coluna.
#A função mutate() adiciona colunas no final.

#1)Exemplo 1

flights_sml <- flights %>% select(year:day, 
                                  ends_with('delay'), 
                                  distance, 
                                  air_time)

flights_sml %>% mutate(gain = arr_delay - dep_delay, 
                       speed = distance / air_time * 60)

#Nota: acima inserimos as variáveis 'speed' e 'gain'.

#2)Você pode se referir às colunas que acabou de criar.
flights_sml %>% mutate(gain = arr_delay - dep_delay, 
                       hours = air_time * 60, 
                       gain_per_hour = gain / hours)

#3)Se quiser manter apenas a novas variáveis. Use a função transmute().
flights_sml %>% transmute(gain = arr_delay - dep_delay,
                          hours = air_time / 60, 
                          gain_per_hour = gain / hours)





























