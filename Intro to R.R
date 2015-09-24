# equal to
2 == 2
3 == 3

# no equal to 
2 != 2
2 != 3

#Greater /less than
# Operators es el termino que se debe utilizar para encontrar las funciones en 
# google que pueede hacer R 
2 < 3
2 > 3
2 < 2
2 <= 3

################################################################################

# Exercise
# What happens if you see this in your console? How to fix it?
1+
# Hit esc or 
  
# What happens when you try and run
#exp(0.5) = e(1/2)  
e^(1/4) 
#Assign e a value

################################################################################

#Syntax

# function (arg1, arg2, arg3,..)
# por ejemplo:
# mean (x, trim = 0, na.rm = FALSE)
# trim will remove the outlayers
# na.rm -> do you want me to remove all the na before calculating the mean? 
#When set to false it won't remove the values.

################################################################################

# Help files

# logical value means true or false

################################################################################

#Gapminder

install.packages('gapminder')
library(gapminder)
# require also helps bring up passages but don't mind
gapminder

# Tools to look at your data
# str() structure helps you look at the structure of your data

str(gapminder)
# obs are rows and variables are column 


################################################################################

#Continuing with gapminder.....

#Load gapminder from up there ^

head(gapminder) #see first 6 
tail(gapminder) #see last 6
View(gapminder)

dim(gapminder) #gives you the dimensions of the data row X column

#Lets look at a single vector from gapminder

gapminder$lifeExp

life <- gapminder$lifeExp #assign to life so I dont have to type this every time

head(life)
length(life)
dim(length) # no dimension? Would have expected 1704 X 1

 
str(life) # they are numbers so whats up?
is.data.frame(life) # ask if life is data frame
is.vector(life) # ask if its a vector

#R always start indexing with No. 1
#getting the values 
life [1]
life [2]
life [3]
life [1704]

#getting more than one value in a section
life[1:2]
life[1:10]
life[1694:1704]

# obteniendo mas de una valor

life[c(1,2)]
life[c(1, 2, 3, 100, 700)] # Obteniendo valores específicos

#back to gapminder the  data.frame
gapminder[1, 1]

names(gapminder)

gapminder[1, 'country'] #this is a string.

#lets get the first value for country and year
gapminder[1, c('country', 'year')]

gapminder[1, ]
gapminder[1:10, ]
gapminder[, c('country', 'year')]
################################################################################

#Select row 100 in gapminder
gapminder[100, ]

#Select rows 40-50
gapminder[40:50, c('country', 'continent', 'lifeExp')]

life[c(1:2, 10, (1704 - 5):1704)]
life[c(1:2, 10, 1699:1704)]

life[c(1:2, 10, (length(life)-5):length(life))]

life[c(1:2, 10, 1699:1704)] == life[c(1:2, 10, (length(life)-5):length(life))]


################################################################################

ggplot

#using the plot function....
plot(gapminder$pop ~ gapminder$year)

#ggplot much more wow than plot
#ggplot from comes from grammar of graphics.... -_-
#The data need to be in a data frame FORMAT....

#aesthetic(aes): tells ggplot where to put the stuff(color, lines, type,)
#geom: actual visualization of the data
#scale: map values to aes, colour, size, shape(shows up legends and axes)
#stat: statistical transformation, summaries of data
#facet: diiferent subsets of the data

#doing a simple scattered plot

install.packages('ggplot2')
library('ggplot2')

#basic scatterplot
ggplot(data = gapminder, aes(x = year, y = lifeExp)) + 
  geom_point()

#adding some colour
ggplot(data = gapminder, aes(x = year, y = lifeExp, 
                             colour = continent)) + 
  geom_point()

####Layering####
ggplot(data = gapminder, aes(x = year, y = lifeExp, 
                             colour = continent)) + 
  geom_point()

ggplot(data = gapminder, aes(x = year, y = lifeExp, 
                             by = country, colour = continent)) + 
  geom_line()


#assign everything to "P" so we can also graph the dots

p <- ggplot(data = gapminder, aes(x = year, y = lifeExp, 
                                  by = country, colour = continent)) + 
  geom_line()

p + geom_point()

#### hashtag #### 
# si pongo 4 hashtags a cada lado del titulo


#### 22/09/15####

#Repaso de ggplot

library(gapminder)

library(ggplot2)
ggplot(data = gapminder, aes(x+ year, y = lifeExp)) + 
  geom_point()

p <- ggplot(data = gapminder, aes(x+ year, y = lifeExp))
p + geom_point()

p + geom_point(aes(colour = continent))

ggplot(data = gapminder, aes(x = year, y = lifeExp, by
= country, colour = continent)) +
  geom_point() +
  geom_line()

ggplot(data = gapminder, aes(x = year, y = lifeExp, by
= country)) +
  geom_point() +
  geom_line(aes(colour = continent))


#poner los puntos negros al frente de todo
ggplot(data = gapminder, aes(x = year, y = lifeExp, by
                             = country)) +
   geom_line(aes(colour = continent)) +
  geom_point()

# El orden en que se ponen las capas (layers) afecta el orden de lo que vemos 
# en el plano. COmo queriamos ver los puntos encima de todo, ponemos el comando
# de puntos "geom_point" al final para verlos encima de todo.
# Recuerde, va literalmente por capas.


# We're graphing here a factor which is country and a number which is gapPercap
ggplot(data = gapminder, aes(x = year, y = lifeExp, by 
                             = country, colour = log(gdpPercap))) +
  geom_point()

ggplot(data = gapminder, aes(x = year, y = lifeExp, by 
                             = country, colour = continent)) +
  geom_point()

# Los colores en las gráficas son diferentes porque se están utilizando dos 
# tipos diferentes de datos que son de diferente naturaleza.....

#Cómo abrir multiples ventanas de plots en Rstudio
?dev.new()
dev.new()

dev.list()
dev.set(2)
dev.cur()
dev.list(2)

str(gapminder)

# Ejercicio para intentar cambiar el color de gradientes de azul a otro que yo
# quiera. Mirando cheat sheet podría ser más fácil...

ggplot(data = gapminder, aes(x = year, y = lifeExp, by = country,
                             colour = log(gdpPercap))) +
  geom_point() + 
  scale_colour_gradientn(colours = topo.colors(20))

# El ejercicio se resuelve poniendo el comando de color AL FINAL....
# Escribir colour en ggplot2 ayuda a evitar el problema que se encuentra
# cuando solo se escribe color o colour. Escribir siempre COLOUR a excepción
# del final, donde dice topo...


# Facets allows us to put multiple panels
ggplot(data = gapminder, aes(x = year, y = lifeExp, colour = log(gdpPercap))) +
  geom_point() + 
  facet_wrap(~ continent)


#Jitter spreads/staggers the points
ggplot(data = gapminder, aes(x = year, y = lifeExp, colour = log(gdpPercap))) +
  geom_jitter()
  
# transparency of the points using Alpha
ggplot(data = gapminder, aes(x = year, y = lifeExp)) + 
  geom_point(alpha = 0.3)
  
# para poner el año
ggplot(data = gapminder, aes(x = year, y = lifeExp)) + 
  geom_point() + 
  geom_text(aes(label = year))

#
ggplot(data = gapminder, aes(x = year, y = lifeExp)) + 
  geom_point() + 
  geom_text(aes(label = country))

# subset() ayuda por ejemplo a solo graficar algo en particular
subste(data= subset(blah blah....), ...)

#### 24/09/15 ####

# Today we'll be working with 
# Split-Apply-Combine
# Dplyr is specific to data frames

# Split-apply-combine

# Clearing your work space
rm(list = ls())

# Load packages we need
library(gapminder)
library(dplyr)
library(ggplot2)

str(gapminder)

filter (gapminder, country == 'Canada')
# we selected the rows that had canada...

gapminder[, 'country']

select(gapminder, country)

# Doesn't work because there is no column by the name of Canada
select(gapminder, Canada)
names(gapminder)

head(select(gapminder, starts_with('C')))
# select is ONLY for columns 

args (head)

# args shows you the values of ......

# % > % this is 'the pipe'
# take this thing and put it into somewhere else

group_by(gapminder, continent)
# we group all the continents....
# we want to pass this organize this data frame into "something" ... 

group_by(gapminder, continent) %>%
  summarise(mean_life = mean(lifeExp))

# mean_life represents the mean of life

group_by(gapminder, continent) %>%
  summarise(mean(lifeExp))

# summarise will collapse your data into a smaller data to make it easier to
# read it


# Mutate will do whatever you want in every single row of your data. It adds
# a new column which is the one we wanted to calculate


head(mutate(gapminder, gdp = gdpPercap * pop))



# Show just the new data by itself without the rest...
head(transmute(gapminder, gdp = gdpPercap * pop))



# arrange

head(arrange(gapminder, lifeExp))

# to make the gdp in an asc/des way

head(arrange(gapminder, desc(lifeExp)))



group_by(gapminder, continent) %>%
  mean(., lifeExp)

# Class exercise

# For each continent, what country had the smallest population in 1952, 1972 
# and 2002?

str(gapminder)

gapminder[, 'year']

select(gapminder, year[])

# Doesn't work because there is no column by the name of Canada
select(gapminder, Canada)
names(gapminder)

head(select(gapminder, starts_with('C')))
# select is ONLY for columns 












# Create a graph of the total population of each continent over time

# Calculate the mean gdpPercap for each country

# Calculate the mena gdp for each coutnry