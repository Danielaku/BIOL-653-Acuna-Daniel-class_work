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



