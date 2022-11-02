#2.1 - Coding Basics

#help - maneiras de pedir ajuda ao R
?function
??`function-class`
#Pressionar F1 ao lado da função.

#1) R - Calculadora
1 / 200 * 30
(59 + 73 + 2) / 3

#a)Função seno
?sin
sin(pi / 2)

#b)Criar Objetos no R
x <- 3 * 4
this_is_a_really_long_name <- 2.5
r_rock <- 2 ^ 3
y <- "Hello World"
w <- seq(from = 1, to = 10, length.out = 5)
(z <- seq(1, 10, length.out = 4))

#b.1)Remover um objeto do R.
rm(z)

#c)Consultar um objeto criado.
x
this_is_a_really_long_name
r_rock

#2)Callings Functions - function_name(arg1 = val1, arg2 = val2, ...)

#a)Criar uma sequência.
seq(from = 1, to  = 10, by = 1)

#Exercícios - Página 40

#1)Why does this code not work?

#Resp: o nome do objeto não digitado corretamente.

#2)Tweak each of the following R commands so that they run correctly:

#a)Importar biblioteca "tidyverse".
library(tidyverse)

#b)Fazer um graph
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

#b.1)Problema de pontos sobrepostos no gráfico acima. Solução:
ggplot(data = mpg) +
  geom_point(aes(x = displ, y = hwy), 
             position = "jitter")

#Nota: position = "jitter" soluciona o problema.

#c) Digite o comando abaixo - filtrar para carros com cyl = 8
filter(mpg, cyl == 8)

#d) Digite o comando abaixo - filtrar para carros com carat > 3.
filter(diamonds, carat > 3)

#3)Press Alt-Shift-K. What happens? How can you get to the same
#place using the menus?

#Resp: Alt-Shift-k - atalho que mostra todos os atalhos do R.

