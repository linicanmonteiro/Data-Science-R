#Capítulo 1 
#1.2 -Facets

#Objetivo: dividir seu gráfico em categorias.
#Por exemplo: vendas por tipo de refrigerante.

#Código - facet_wrap() - ideal para dados qualitativos.
#Código - facet_grid() - ideal para dados quantitativos.

?facet_wrap
?facet_grid

#a)Exemplo: com cores
ggplot(data = mpg) +
  geom_point(mapping = aes (x = displ, y = hwy, color = class)) +
  facet_wrap(~ class, nrow = 2)

#b)Exemplo: sem cores
ggplot(data = mpg) +
  geom_point(mapping = aes (x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)

#2) Dividir o gráfico com combinação de duas variáveis.
#Usamos a função face_grid.
ggplot(mpg, aes(displ, hwy)) +
  geom_point(color = "red") +
  facet_grid(drv ~ cyl)

#3) Colocar apenas uma terceira variável no gráfico. Neste caso, 'cyl'
ggplot(mpg, aes(displ, hwy)) +
  geom_point(color = "red") +
  facet_grid(. ~ cyl)

####################################################
#Exercícios - Página 41
####################################################

#1)What happens if you facet on a continuous variable?
library(tidyverse)
mpg
ggplot(mpg, aes(displ, y = hwy )) +
  geom_point(color = "green") +
  facet_wrap(~ displ, nrow = 2)

#Resp: mostramos o consumo de combusítvel por milhas rodadas. De aoordo com o 
#tamanho do motor.

#2) What do the empty cells in a plot with facet_grid(drv ~ cyl)
#mean? How do they relate to this plot?

#cty - city miles per gallon
#cyl - number of cylinders
#drv - f = front-wheel drive, r = rear wheel drive, 4 = 4wd

ggplot(data = mpg) +
  geom_point(mapping = aes(x = drv, y = cyl)) +
  facet_grid(drv ~ cyl)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = drv, y = cyl))

#3)What plots does the following code make? What does . do?

#displ - engine displacement, in litres;
#hwy - highway miles per gallon
#drv - f = front-wheel drive, r = rear wheel drive, 4 = 4wd

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .) #Acrescentamos o eixo y.

#Resp: mostra os gráfico dividido por tração nas rodas traseiras, dianteiras ou
# 4 rodas.

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_grid(. ~ cyl) #Acrescentamos o eixo x. cyl - nº de cilindros

#4) Take the first faceted plot in this section.
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(~ class, nrow = 2)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

#What are the advantages to using faceting instead of the color
#aesthetic? What are the disadvantages? How might the balance
#change if you had a larger dataset?

#Resp: Facet é melhor para visualizar individualmente classe de dados.
# com base de dados maiores, é melhor vizualizar os dados com cores.

#5)Read ?facet_wrap. What does nrow do? What does ncol do?
#What other options control the layout of the individual panels?
#Why doesn't facet_grid() have nrow and ncol variables?
?facet_wrap

#nrow, ncol:    Number of rows and columns.

#scales:should Scales be fixed ("fixed", the default), free ("free"), or free in one 
# dimension ("free_x", "free_y").

#shrink:If TRUE, will shrink scales to fit output of statistics, not raw data.
#If FALSE, will be range of raw data before statistical summary.



