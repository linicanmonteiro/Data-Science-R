#1.6 - Coordinate Systems
library(tidyverse)

#1)coord_flip() - esta função troca o eixo x pelo y. Ela é interessante 
#se você quiser criar gráficos boxplot horizontais.

#Exemplo 1)
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot()

#Exemplo 2) Mudar os eixos do gráfico anterior.
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot() +
  coord_flip()

#2)coord_quickmap() - está relacionada a organização de mapas.
#Mapa - Nova Zelândia - SEM a função coord_quickmap() 

#a)Instale o pacote 'maps'
install.packages("mapdata")

#b)Crie uma variável chamada 'nz'
nz <- map_data("nz")

#c)Crie um gráfico do mapa da Nova Zelândia.
ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", color = "black")

#Gráfico da Nova Zelândia - Outro - sem o argumento 'long'
#Mapa - Nova Zelândia - COM a função coord_quickmap()
ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", color = "black") +
  coord_quickmap()
  
#4)coord_polar
bar <- ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut),
    show.legend = F,
    width = 1) +
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

#a)coord_flip()
bar + coord_flip()

#b)coord_polar()
bar + coord_polar()

#Exercícios - Página 33

#1)Turn a stacked bar chart into a pie chart using coord_polar().
#a)Bar Chart
?factor
ggplot(data = mpg, aes(x = factor(1), fill = drv)) +
  geom_bar()

#b)Adicionar o coord_polar(theta = "y") - assim criamos um gráfico de Pizza.
ggplot(data = mpg, aes(x = factor(1), fill = drv)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y")

#Nota: The argument theta = "y" maps y to the angle of each section. If 
#coord_polar() is specified without theta = "y", then the resulting plot 
#is called a bulls-eye chart.

#c)Bull-Eye Chart
ggplot(data = mpg, aes(x = factor(1), fill = drv)) +
  geom_bar(width = 1) +
  coord_polar()


#2)What does labs() do? Read the documentation.

#Resp: labs() serve para modificar nome de eixos (x e y), legendas, títulos e 
#subtítulos de gráficos.
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot() +
  coord_flip() +
  labs(
    y = "Highway MPG",
    x = "Class",
    title = "Highway MPG by car class",
    subtitle = "1999-2008",
    caption = "Source: http://fueleconomy.gov"
  )

#The xlab(), ylab(), and x- and y-scale functions 
#can add axis titles. The ggtitle() function adds plot titles.

#3)What's the difference between coord_quickmap() and coord_map()?
?coord_map
?coord_quickmap

#Resp: The coord_map() function uses map projections to project the 
#three-dimensional Earth onto a two-dimensional plane. By default, 
#coord_map() uses the Mercator projection. This projection is applied 
#to all the geoms in the plot. The coord_quickmap() function uses an 
#approximate but faster map projection. This approximation ignores the 
#curvature of Earth and adjusts the map for the latitude/longitude ratio. 
#The coord_quickmap() project is faster than coord_map() both because the 
#projection is computationally easier, and unlike coord_map(), the coordinates 
#of the individual geoms do not need to be transformed.

#4)What does the following plot tell you about the relationship
#between city and highway mpg? Why is coord_fixed() important?
#What does geom_abline() do?

#a)Com reta de 45º
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() +
  geom_abline() +
  coord_fixed()
  
#Nota 1 - coord_fixed() garante que a linha produzida por geom_abline possui
#ângulo de 45°. 

#b)Sem reta de 45º
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() +
  geom_abline()
  
#Nota: cty - city miles per gallon; hwy - highway miles per gallon;
