#3.1) - Data Transformation with dplyr
Sys.setenv(LANGUAGE = "en")

#Instalar o Pacote dplyr
install.packages("dplyr")
install.packages("nycflights13")
library(nycflights13)

#Puxar a biblioteca necess?ria
install.packages("tidyverse")
library("tidyverse")

#Puxar os dados de v?o em NY.
nycflights13::flights

#1)Filter - permite filtrar os dados de um data.frame. O primeiro argumento ?
#o nome do dataframe. J? o segundo e os demais s?o as express?es que filtram
#o dataframe.

#a)Filtrar o m?s janeiro e dia 1?.
filter(nycflights13::flights, month == 1, day == 1)

#b)Criando um objeto do filtro acima.
jan1 <- filter(nycflights13::flights, month == 1)

#c)Filtrar o m?s dezembro e dia 25.
dec25 <- filter(nycflights13::flights, month == 12, day == 25)

#Nota: j? aparece direto a tabela.
(dec25 <- filter(nycflights13::flights, month == 12, day == 25))


