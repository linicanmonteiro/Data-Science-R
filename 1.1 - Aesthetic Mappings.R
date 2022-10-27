#Capítulo 1 - Visulização de Dados: ggplot2 - tipo de gráficos.

#1) Fazer a o download da biblioteca

#a) Instalar o pacote tidyverse
install.packages("tidyverse")

#b) Rodar a biblioteca de gráficos
library(tidyverse)

#2) Mpg - pesquisa consumo de combustível dos carros.
mpg

#a) Rode um gráfico com a base dados anterior.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy) )  

#Comentário - pelo gráfico gerado acima, percebemos que há uma relação negativa
# entre engine size (disply) e eficiência energética. Em outras palavras, carros
# com maiores maiores motores usam mais energia.

# Página 6

#3) Exercícios

#a) Run ggplot(data = mpg). What do you see?
ggplot(data = mpg)

#Resp: vejo uma página em branco. É necessário acrescentar as abiscissas e
# ordenadas.

#b) How many rows are in mtcars? How many columns?

#Resp:

#c) What does the drv variable describe? Read the help for ?mpg to
#find out.
?mpg

#Resp: fwd - tração dianteira; rwd - traseira; 4wd = tração nas 4 rodas.

#d) Make a scatterplot of hwy versus cyl.
ggplot(data = mpg) +
  geom_point(mapping = aes(x = hwy, y = cyl)  )

#e) What happens if you make a scatterplot of class versus drv?
#Why is the plot not useful?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = class, y = drv)  )

#Resp: não há nenhuma relação matemática entre as variáveis. 

#4) Mudar as cores do gráfico para revelar o tipo de cada carro.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

#5) Mudar o tamanho dos pontos relacionados a modelo de carros.
# Dica: não é interessante editar variáveis discretas (modelo do carro)
# desta maneira.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

#6) Gráfico que controla a transparência do modelo.

#6.a) Transparência dos pontos de classe do carro.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

#6.b) Formato dos pontos (triângulo, estrela e afins)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

#Dica: The shape palette can deal with a maximum of 6 discrete values because more
#than 6 becomes difficult to discriminate; you have 7. Consider specifying
#shapes manually if you must have them.

#7) Mudar cor dos pontos do gráfico:
library(tidyverse)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

###############################################################
# Exercícios - Página 12
###############################################################

#1) What's gone wrong with this code? Why are the points not blue?

#Resp: o argumento 'color' deve estar fora do 'mapping'. Ou seja:
library(tidyverse)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
  
#2) Which variables in mpg are categorical? Which variables are
#continuous?
?mpg
mpg
# Resp 1: as váriaveis de categoria são Model Name; Year; Trans; Drv; Class;
# Resp 2: Através dos dados apresentados nas tabelas.

#3) Map a continuous variable to color, size, and shape. How do
#these aesthetics behave differently for categorical versus continuous
#variables?

#3.1: Gráfico de variáveis Discretas.

#Shape
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))
  
#Cor
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

#Size
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

#3.2: Gráfico de variáveis contínuas.

#Shape
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = hwy))

#Cor
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = hwy))

#Size
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = hwy))

#4) What happens if you map the same variable to multiple aesthetics?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = hwy, color = hwy))

#5) What does the stroke aesthetic do? What shapes does it work
#with?
ggplot(mpg, aes(displ, hwy)) +
  geom_point(shape = 21, color = "blue", fill = "white", size = 5, stroke = 5 )
  
ggplot(mpg, aes(displ, hwy)) +
  geom_point(shape = 21, color = "blue", fill = "white", size = 5, stroke = 1 )

#6) What happens if you map an aesthetic to something other than
#a variable name, like aes(color = displ < 5)?

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))
  
#Resp: 'displ' com valores menores que 5 (True) recebem azul.
#Já valores menores que 5 (False) recebem valor vermelho.

