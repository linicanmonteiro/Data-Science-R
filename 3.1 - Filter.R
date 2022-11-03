#3.1) - Data Transformation with dplyr
Sys.setenv(LANGUAGE = "en")

#Instalar o Pacote dplyr
install.packages("dplyr")
install.packages("nycflights13")
library(nycflights13)

#Puxar a biblioteca necessária
install.packages("tidyverse")
library("tidyverse")

#Puxar os dados de vôo em NY.
nycflights13::flights

#1)Filter - permite filtrar os dados de um data.frame. O primeiro argumento é
#o nome do dataframe. Já o segundo e os demais são as expressões que filtram
#o dataframe.

#a)Filtrar o mês janeiro e dia 1º.
filter(nycflights13::flights, month == 1, day == 1)

#b)Criando um objeto do filtro acima.
jan1 <- filter(nycflights13::flights, month == 1)

#c)Filtrar o mês dezembro e dia 25.
dec25 <- filter(nycflights13::flights, month == 12, day == 25)

#Nota: já aparece direto a tabela.
(dec25 <- filter(nycflights13::flights, month == 12, day == 25))


