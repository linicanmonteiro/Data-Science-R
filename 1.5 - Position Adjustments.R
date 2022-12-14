#1.5 - Position Adjustments

#1) Graph Bar 1 - dentro da barra, cor de chumbo; em volta da barra, colorido.
library(tidyverse)
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, color = cut))

#2) Graph Bar 2 - todo colorido.
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut ))


#3)Graph Bar 3 - cada ret?ngulo colorido representa a combina??o entre
#clarity e cut.
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))

#4) Identity Position

#a) Identity Position
ggplot(data = diamonds, 
       mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity")
  
#Nota: gr?fico ruim. Alfa pequeno deixa os ret?ngulos transparentes. Sobrepondo as
#demais barras.

#b) Identity Position - Outro Exemplo.
ggplot(data = diamonds, mapping = aes(x = cut, color = clarity)) + 
  geom_bar(fill = NA, position = "identity")
  
#Nota: o argumento 'fill' ? sobre preenchimento da barra.

#args - esse argumento mostra os argumentos de qualquer fun??o. Exemplo:
#args(geom_bar).

#5) Position = "fill"  - funciona como sobreposi??o de barras. Cada barra ter?
#o mesmo peso. Ajuda a comparar propor??es entre os grupos.
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), 
           position = "fill")

#6) Position = "dodge" places overlapping objects directly beside
#one another.
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), 
           position = "dodge")

#7)Problema de sobreposi??o de pontos. Resolvemos com a "jitter" position.
ggplot(data = mpg) +
  geom_point(aes(x = displ, y = hwy), 
             position = "jitter")

#Exerc?cios - P?gina 31

#1)What is the problem with this plot? How could you improve it?
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point()

#Resp: muitos pontos dos gr?ficos podem estar sobrepostos.
#Consertamos esse problema adicionando o argumento 'jitter'.
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() +
  geom_jitter()

#2)What parameters to geom_jitter() control the amount of jittering?

#Resp: primeiro pedimos ajuda. Os par?metros s?o: width e height.
?geom_jitter

#3)Compare and contrast geom_jitter() with geom_count().

#a)geom_count()` is another variant of `geom_point()` and controls 
#the size of each dot based on the frequency of observations in a specifiy 
#coordinate. It can help to contrast with `geom_jitter()` in understanding the data.

#4)What's the default position adjustment for geom_boxplot()?
#Create a visualization of the mpg dataset that demonstrates it.

#Resp: no geom_boxplot() o default de position ? o dodge2.

#Exemplo:
ggplot(data = mpg, mapping = aes(x = class, y = displ)) + 
  geom_boxplot(aes(colour = drv))

















