#3.12 - Grouping by Multiple Variables

#1) Exemplo - quantidade de vôos por dia.

daily <- flights %>% group_by(year, month, day)

per_day <- daily %>% summarise(flights = n())

#2) Exemplo - quantidade de vôos por mês.
per_month <- summarise(per_day, flights = sum(flights))

#3) Exemplo - quantidade de vôos por ano.
per_year <- summarise(per_month, flights = sum(flights))

#Be careful when progressively rolling up summaries: it's OK for
#sums and counts, but you need to think about weighting means and
#variances, and it's not possible to do it exactly for rank-based statistics
#like the median.

#Conceito de Desagrupar - Ungrouping

#If you need to remove grouping, and return to operations on
#ungrouped data, use ungroup().

daily %>% ungroup() %>% summarise(flights = n())












































