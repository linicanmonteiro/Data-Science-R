#1.3 - Geometric Objects

#geom_smooth - inserir uma linha de regressão com o intervalo de confiança.

#Exemplo 1)
library(tidyverse)
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

#Nota: aqui geom_smooth separa o gráfico em três tipos de carro. Tração traseira, 
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

#Exemplo 6) - Misturar as funções geom_point e geom_smooth
ggplot(mpg, aes(displ, hwy, color = drv)) +
  geom_point() +
  geom_smooth()

#Exemplo 7)
ggplot(mpg, aes(displ, hwy)) +
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()

#Exemplo 8) - Inserir na linha de regressão apenas o subconjunto de carros
#subcompactos.
ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(
    data = filter(mpg, class == "subcompact")
  )

#Exercícios - Página 20 do PDF.

#1) What geom would you use to draw a line chart? A boxplot? A
#histogram? An area chart?

#a)Line Chart - Gráfico de Linha
ggplot(mpg, aes(displ, hwy)) +
  geom_line(color = "blue", lwd = 1.5)

#lwd - espessura da linha do gráfico.  

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

#d)Gráfico de área - do nível do rio huron.

#Criar um data frame
x <- data.frame(Year = 1875:1972, Level = as.vector(LakeHuron))

#Lakehuron - nível do rio Huron.

#Criar um gráfico.
ggplot(x, aes(Year, Level)) +
  geom_area()

#2)Run this code in your head and predict what the output will look like. 
#Then, run the code in R and check your predictions. 

#a)Gráfico sem o intervalo de confiança.
ggplot(mpg, aes(displ, hwy, color = drv)) +
  geom_point() + geom_smooth(se = F )

#b)Gráfico com o intervalo de confiança.
ggplot(mpg, aes(displ, hwy, color = drv)) +
  geom_point() + geom_smooth(se = T )

#3)What does show.legend = FALSE do? What happens if you remove it?
#Why do you think I used it earlier in the chapter?

#Resp: o argumento show.legend = F retira as legendas do gráfico. 
#Ele fornece uma plotagem mais limpa quando fica claro que o 
#agrupamento é feito em uma variável específica.

#4)What does the se argument to geom_smooth() do?
#Resp: Remove o intervalo de confiança.

#5)Will these two graphs look different? Why/why not?

#a)Gráfico 1
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() + geom_smooth()

#b)Gráfico 2
ggplot() + 
  geom_point(data = mpg, mapping = aes(displ, hwy)) +
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

#Não há diferente na formatação dos dois gráficos aprensetados acima.

#6) Criar os gráficos propostos.

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
  




