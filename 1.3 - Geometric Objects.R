#1.3 - Geometric Objects

#geom_smooth - inserir uma linha de regress?o com o intervalo de confian?a.

#Exemplo 1)
library(tidyverse)
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

#Nota: aqui geom_smooth separa o gr?fico em tr?s tipos de carro. Tra??o traseira, 
#dianteira e nas quatro rodas.

#Exemplo 2)
ggplot(mpg, aes(displ, hwy)) +
  geom_smooth()

#Exemplo 3)
ggplot(data = mpg) +
  geom_smooth(aes(x = displ, y = hwy, group = drv))

#Exemplo 4) - Sem legenda
ggplot(mpg, aes(displ, hwy, color = drv)) +
  geom_smooth(show.legend = F)

#Exemplo 5) - Com Legenda
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv),
              show.legend = T)

#Exemplo 6) - Misturar as fun??es geom_point e geom_smooth
ggplot(mpg, aes(displ, hwy, color = drv)) +
  geom_point() +
  geom_smooth()

#Exemplo 7)
ggplot(mpg, aes(displ, hwy)) +
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()

#Exemplo 8) - Inserir na linha de regress?o apenas o subconjunto de carros
#subcompactos.
ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(
    data = filter(mpg, class == "subcompact")
  )

#Exerc?cios - P?gina 20 do PDF.

#1) What geom would you use to draw a line chart? A boxplot? A
#histogram? An area chart?

#a)Line Chart - Gr?fico de Linha
ggplot(mpg, aes(displ, hwy)) +
  geom_line(color = "blue", lwd = 1.5)

#lwd - espessura da linha do gr?fico.  

#b)BoxPlot
ggplot(mpg, aes(displ, hwy)) +
  geom_boxplot(color = "red")

#b.1) BoxPlot 2
ggplot(mtcars) +
  geom_boxplot(aes(x = as.factor(cyl), y = mpg))

#c) Histograma 1
ggplot(data = mpg) + 
  geom_histogram(aes(x = displ), binwidth = 1)
  
#binwidth - espessura da linha do histograma.

#c.1)Histograma 2

ggplot(data = mpg) + 
  geom_histogram(aes(x = displ), bins = 60)

#d)Gr?fico de ?rea - do n?vel do rio huron.

#Criar um data frame
x <- data.frame(Year = 1875:1972, Level = as.vector(LakeHuron))

#Lakehuron - n?vel do rio Huron.

#Criar um gr?fico.
ggplot(x, aes(Year, Level)) +
  geom_area()

#2)Run this code in your head and predict what the output will look like. 
#Then, run the code in R and check your predictions. 

#a)Gr?fico sem o intervalo de confian?a.
ggplot(mpg, aes(displ, hwy, color = drv)) +
  geom_point() + geom_smooth(se = F )

#b)Gr?fico com o intervalo de confian?a.
ggplot(mpg, aes(displ, hwy, color = drv)) +
  geom_point() + geom_smooth(se = T )

#3)What does show.legend = FALSE do? What happens if you remove it?
#Why do you think I used it earlier in the chapter?

#Resp: o argumento show.legend = F retira as legendas do gr?fico. 
#Ele fornece uma plotagem mais limpa quando fica claro que o 
#agrupamento ? feito em uma vari?vel espec?fica.

#4)What does the se argument to geom_smooth() do?
#Resp: Remove o intervalo de confian?a.

#5)Will these two graphs look different? Why/why not?

#a)Gr?fico 1
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() + geom_smooth()

#b)Gr?fico 2
ggplot() + 
  geom_point(data = mpg, mapping = aes(displ, hwy)) +
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

#N?o h? diferente na formata??o dos dois gr?ficos aprensetados acima.

#6) Criar os gr?ficos propostos.

#a)
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(se = F)

#b) 
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(aes(group = drv), se = F)

#c)
ggplot(mpg, aes(displ, hwy, color = drv)) +
  geom_smooth(se = F) +
  geom_point()

#d)
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(aes(color = drv), show.legend = T) +
  geom_smooth(se = F)

#e)
ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = drv)) +
  geom_smooth(aes(linetype = drv), se = F)

#f)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))
  




