#3.6 - Add New Variables with mutate()

#Objetivo: adicionar vari?veis que s?o fun??es de uma coluna.
#A fun??o mutate() adiciona colunas no final.

#1)Exemplo 1

flights_sml <- flights %>% select(year:day, 
                                  ends_with('delay'), 
                                  distance, 
                                  air_time)

flights_sml %>% mutate(gain = arr_delay - dep_delay, 
                       speed = distance / air_time * 60)

#Nota: acima inserimos as vari?veis 'speed' e 'gain'.

#2)Voc? pode se referir ?s colunas que acabou de criar.
flights_sml %>% mutate(gain = arr_delay - dep_delay, 
                       hours = air_time * 60, 
                       gain_per_hour = gain / hours)

#3)Se quiser manter apenas a novas vari?veis. Use a fun??o transmute().
flights_sml %>% transmute(gain = arr_delay - dep_delay,
                          hours = air_time / 60, 
                          gain_per_hour = gain / hours)





























