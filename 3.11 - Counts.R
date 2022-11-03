#3.11 - Counts

#You've seen n(), which takes no arguments, and returns the size
#of the current group. To count the number of non-missing values,
#use sum(!is.na(x)). To count the number of distinct
#(unique) values, use n_distinct(x):


#1)Which destinations have the most carriers?
not_cancelled %>%
  group_by(dest) %>%
  summarize(carriers = n_distinct(carrier)) %>%
  arrange(desc(carriers))

#2)Se quiser apenas contar o nº de vôos não cancelados.
not_cancelled %>%
  count(dest)

#3)Contar a distância que cada avião percorreu.
not_cancelled %>% count(tailnum, wt = distance)

#4)Counts and proportions of logical values
#How many flights left before 5am? (these usually
# indicate delayed flights from the previous day)

not_cancelled %>% group_by(year, month, day) %>%
  summarise(n_early = sum(dep_time < 500))

#4.1)# What proportion of flights are delayed by more
# than an hour?

not_cancelled %>% group_by(year, month, day) %>%
  summarise(hour_perc = mean(arr_delay > 60))








