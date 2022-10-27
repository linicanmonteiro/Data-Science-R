#1.4 - Statistical Transformations

#Exemplo 1) - Gráfico de Barras.
library(tidyverse)
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))

#Nota: argumento x = cut significa dividir x de acordo com intervalo
#o qual pertence.

#Exemplo 2) - realizar o exemplo anterior através de outro método.
ggplot(data = diamonds) +
  stat_count(mapping = aes(x = cut))

#Exemplo 3)
?tribble
w = tribble(~a, ~b,
            "bar_1", 20,
            "bar_2", 30,
            "bar_3", 40)

#Nota: a variável w alimentará o nosso gráfico de barras.

ggplot(data = w) +
  geom_bar(mapping = aes(x = a, y = b), stat = "identity")

#Exemplo 4) - montar um gráfico de barras com o eixo y sendo a proporção.
ggplot(data = diamonds) +
  stat_count(mapping = aes(x = cut, y = ..prop.., group = 1))

#Exemplo 5) - stat_summary - mostra os valores de y para cada x.
ggplot(data = diamonds) +
  stat_summary(mapping = aes(x = cut, y = depth),
               fun.ymin = min,
               fun.ymax = max,
               fun.y = median)

#Exercícios - Página 26

#1)What is the default geom associated with stat_summary()?
#How could you rewrite the previous plot to use that geom function
#instead of the stat function?

#Resp: stat_summary está associado com o geom_pointrange

ggplot(data = diamonds) +
  geom_pointrange(aes(cut, depth, ymin = depth, ymax = depth ))

#2)What does geom_col() do? How is it different to geom_bar()?

#a)geom_col() - plota os dados de maneira crua. Sem alteração.
#a)geom_bar() - cria duas variáveis. count e prop. Coloca o count no eixo y.

#3)Most geoms and stats come in pairs that are almost always used
#in concert. Read through the documentation and make a list of
#all the pairs. What do they have in common?


#4)What variables does stat_smooth() compute? What parameters
#control its behavior?

#it computes the formula y ~ x, and is controlled by method which determines 
#the type of line to fit, and se which shows / hides the confidence interval.

#5)In our proportion bar chart, we need to set group = 1. Why? 
#In other words what is the problem with these two graphs?

#a)Gráfico 1
ggplot(data = diamonds) +
  geom_bar(aes(x = cut, y = ..prop..))

#b)Gráfico 2

ggplot(diamonds, aes(cut, y = ..prop..)) +
  geom_bar(aes(fill = color))

#Resp: inserir o group = 1 garante que a proporção é calculada do total de
#diamantes.

#Gráficos Corretos do problema anterior.

#a)Gráfico 1
ggplot(data = diamonds) +
  geom_bar(aes(x = cut, y = ..prop.., group = 1))

#b)Gráfico 2

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = ..count../sum(..count..), fill = color))

#Quando o gráfico é colorido, como é o caso acima, devemos calcular a prop
#manualmente.
