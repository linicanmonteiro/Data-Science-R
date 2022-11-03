#3.9 - Count()

install.packages("tidyverse")
install.packages("tibble")
library(tibble)
library(tidyverse)

#Objetivo: usar a base de dados Lahman para verificar a habilidade
#do batedor de baseball.

#1)Plotar o gráfico da habilidade do Batedor.

#a)Convert to a tibble so it prints nicely

#Nota: ba - batting average; ab - opportunities to hit the ball;

batting <- as_tibble(Lahman::Batting)

batters <- batting %>%
  group_by(playerID) %>%
  summarize(
    ba = sum(H, na.rm = TRUE) / sum(AB, na.rm = TRUE),
    ab = sum(AB, na.rm = TRUE)
  )

batters %>%
  filter(ab > 100) %>%
  ggplot(mapping = aes(x = ab, y = ba)) +
  geom_point() +
  geom_smooth(se = FALSE)

#As above, the variation in our aggregate decreases as we get
#more data points.

#There's a positive correlation between skill (ba) and opportunities
#to hit the ball (ab). This is because teams control who gets to
#play, and obviously they'll pick their best players.

#2)Verificando os batedores que tiveram sorte.
batters %>% arrange(desc(ba))








