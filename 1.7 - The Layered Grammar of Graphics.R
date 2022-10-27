#1.7 - The Layered Grammar of Graphics

#Exemplo 1)Criar um template de gráfico.
ggplot(data = <DATA>) +
  <GEOM_FUNCTION>(mapping = aes(<MAPPING>), 
                  stat = <STAT>, 
                  position = <POSITION>) +
  <COORDINATE_FUNCTION> +
  <FACET_FUNCTION>


