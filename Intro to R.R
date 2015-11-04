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

# R always start indexing with No. 1
# getting the values 
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

# lets get the first value for country and year
gapminder[1, c('country', 'year')]

gapminder[1, ]
gapminder[1:10, ]
gapminder[, c('country', 'year')]
head(gapminder[, c('country', 'year')])

####Selecting data from our vector in differ

#Select row 100 in gapminder
gapminder[100, ]

#Select rows 40-50
gapminder[40:50, c('country', 'continent', 'lifeExp')]

life[c(1:2, 10, (1704 - 5):1704)]
life[c(1:2, 10, 1699:1704)]

life[c(1:2, 10, (length(life)-5):length(life))]

life[c(1:2, 10, 1699:1704)] == life[c(1:2, 10, (length(life)-5):length(life))]


################################################################################

#### ggplot ####

# using the plot function....
plot(gapminder$pop ~ gapminder$year)

# ggplot much more wow than plot
# ggplot comes from grammar of graphics.... -_-
# The data needs to be in a data frame FORMAT....

# aesthetics (aes): tells ggplot where to put the stuff(color, lines, type,)
# geom: actual visualization of the data
# scale: map values to aes, colour, size, shape(shows up legends and axes)
# stat: statistical transformation, summaries of data
# facet: different subsets of the data

# doing a simple scattered plot

install.packages('ggplot2')
library('ggplot2')

# basic scatterplot
ggplot(data = gapminder, aes(x = year, y = lifeExp)) + 
  geom_point()

# adding some colour
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

ggplot(data = gapminder, aes(x = year, y = lifeExp, 
                             by = country, colour = continent)) +
  geom_point() +
  geom_line()

ggplot(data = gapminder, aes(x = year, y = lifeExp, 
                             by = country)) +
  geom_point() +
  geom_line(aes(colour = continent)) #esta es la parte que le da color a las
# líneas


#poner los puntos negros al frente de todo

ggplot(data = gapminder, aes(x = year, y = lifeExp, by
                             = country)) +
   geom_line(aes(colour = continent)) +
  geom_point()

# El orden en que se ponen las capas (layers) afecta el orden de lo que vemos 
# en el plano. Como queriamos ver los puntos encima de todo, ponemos el comando
# de puntos "geom_point" al final para verlos encima de todo.
# Recuerde, va literalmente por capas.


# We're graphing here a factor which is country and a number which is gapPercap

ggplot(data = gapminder, aes(x = year, y = lifeExp, by 
                             = country, colour = (gdpPercap))) +
  geom_point()


# Jillian adicionó la función log para homogenizar los datos

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

# El ejercicio se resuelve poniendo el comando de color después de geom_point...
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
  geom_text(aes(label = year)) +

#
ggplot(data = gapminder, aes(x = year, y = lifeExp)) + 
  geom_point() + 
  geom_text(aes(label = country))

# subset() ayuda por ejemplo a solo graficar algo en particular
# subset (data= subset(blah blah....), ...)

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


####Filtering data#### 

# Lets select the rows that had canada...
filter (gapminder, country == 'Canada')
filter (gapminder, continent == 'Europe')

gapminder[, 'country']

select(gapminder, country)

# Doesn't work because there is no column by the name of Canada
select(gapminder, Canada)
names(gapminder)

head(select(gapminder, starts_with('C')))
# select is ONLY for columns 

args (head)

# args shows you the values of ......


# take this thing and put it into somewhere else

#         % > % this is 'the pipe'

# Lets group all the continents....

group_by(gapminder, continent)

# Now we want to pass this organize data frame into "something" ... 
# Here is where we use that stupid symbol that I could not find in google 
# % > %

group_by(gapminder, continent) %>%
  summarise(mean_life = mean(lifeExp))

# mean_life represents the mean of life

group_by(gapminder, continent) %>%
  summarise(mean(lifeExp))

# summarise will collapse your data into a smaller data to make it easier to
# read it


####Mutate####
# will do whatever you want in every single row of your data. It adds a new 
# column which is the one we wanted to calculate

head(mutate(gapminder, gdp = gdpPercap * pop))

####Transmutate####
# Show just the new data by itself without the rest...

head(transmute(gapminder, gdp = gdpPercap * pop))


####arrange####
# Usualmente arregla los datos de menor a mayor
head(arrange(gapminder, lifeExp))

# Para hacer que los arregle de mayor a menor

head(arrange(gapminder, desc(lifeExp)))

####Pregunta para Jillian####
group_by(gapminder, continent) %>%
  mean(., lifeExp)

# Class exercise

library(gapminder)
library(ggplot2)
library(dplyr)


# For each continent, what country had the smallest population in 1952, 1972 
# and 2002?

str(gapminder)

gapminder %>% 
  filter(year %in% c(1952, 1972, 2002)) %>%
  group_by(continent, year) %>% 
  slice(which.min(pop))


# Create a graph of the total population of each continent over time

gapminder %>%
  group_by(continent) %>%
  summarise(total_pop = sum(pop)) %>%
  ggplot(data = ., aes(x = continent, y = total_pop)) + 
  geom_bar(stat = "identity")


# Calculate the mean gdpPercap for each country

gapminder %>% 
  group_by(country) %>%
  summarise(mean_gdpPercap = mean(gdpPercap))


# Calculate the mean gdp for each coutnry

gapminder %>% 
  mutate(gdp = gdpPercap * pop) %>%
  group_by(country) %>%
  summarise(mean_gdp = mean(gdp))

####dplyr review####

library(gapminder)
library(ggplot2)
library(dplyr)

# Calculate the mean gdpPercap for each country

gapminder %>% 
  group_by(country) %>%
  summarise(mean_gdpPercap = mean(gdpPercap))

# sumarise take data form multiple roads and collapse it into one

# Calculate the mean gdp for each coutnry

# Make a list of what we need
# by country
# get gdp
# mean gdp
gapminder %>% 
  mutate(gdp = gdpPercap * pop) %>%
  group_by(country) %>%
  summarise(mean_gdp = mean(gdp))


# Create a graph of the total population of each continent over time

total_pop_df <-
gapminder %>%
  group_by(continent, year) %>%
  summarise(total_pop = sum(pop))
  
ggplot(data = total_pop_df, aes(x = year, y = total_pop, colour = continent)) + 
  geom_point()

# For each continent, what country had the smallest population in 1952, 1972 
# and 2002?
# IN %in% helps you to compare items


# print the info from gapminde as a data frame
# To start with, lets list the steps to follow 
# by continent
# subset ->in 1952, 1972, 2002
# minimum population


gapminder <- tbl_df(gapminder)

gapminder%>%
  filter(year %in% c(1952, 1972, 2002))%>%
  group_by(continent, year)%>%
  slice(which.min(pop))%>%
  select(country, year, pop)


# this is how things used to be done...
filter by year 2002
group by continent
mean population

mean(group_by((filter(gapminder, year == 2002)),
              continent)$pop)

  
# with gapminder

gapminder %>%
  filter(year == 2002) %>%
# group_by(continent)
    summarise(mean(pop))



####df####
gap_df <- as_data_frame(gapminder)
str(gap_df)
gap_tbl <- tbl_df(gapminder)
gap_tbl
str(gap_tbl)

# Extra questions
# 1) How many contries are there on each continent?

gapminder

# 2) What countries have the best and worst life expectancies in each continent


####01/10/15####

# Warm up

# 1) What do I mean when I say indexing?

# When calling up a specific object in some position


# 2) Get the 5th and last element of the vector

meow <- c(1, 2, 3, 4, 10, 11, 12)

meow [c(5, 7)]

# when the vector is larger and not so easy to see like this one:

meow [c(5, length(meow))]

# 3) What does str() do
# Gives you info from the data set

#### Function review ####

function (arg1, arg2, arg3,...)

mean(x, trim = 0, na.rm = FALSE)

#### Objects in R - Vectors ####

#Atomic vectors:
  logical
  integer
  Double(numeric)
  character

# Creating a double vector
  
dbl_vec <- c(1.2, 1.3, 1.4, 2.5)
str(dbl_vec)
typeof(dbl_vec)

# Creating an integer vector (numeric, but discrete)
int_vec <- c(1, 2, 3, 4) # this just produces a double vector 
typeof(int_vec)

int_vec <- c(1L, 2L, 3L, 4L)
typeof(int_vec)

# now it's an integer

# logical vector
log_vec <- c(TRUE, FALSE, TRUE)
typeof(log_vec)
log_vec

# Character Vector

chr_vec <-c("a", "b", "c")
chr_vec
typeof(chr_vec)

# Coercion

# 12
# 1
# .
# 9
z <- read.csv(text = "value\n12\n1\n.\n9")
str(z)
typeof(z)
typeof(z[[1]])
as.double(z)
as.double(z[[1]])
as.character(z)
as.character(z[[1]])
as.double(as.character(z[[1]]))
?read.csv

# setting stringAsFactors = FALSE means that no character columns will be put 
# into R as factors

z <- read.csv(text = "value\n12\n1\n.\n9",
              stringsAsFactors = FALSE)
typeof(z[[1]])

as.double(z[[1]])

#### Objects in R 2! ####

# 2 dimensional structures
# matrix

a <- matrix(1:6, ncol = 3, nrow = 2)
a
str(a)
a[, 3]
length (a)
dim (a)
nrow(a)
ncol (a)

x <- c('a', 'b', 'c', 'd', 'e', 'f')

a <- matrix(x, ncol =3, nrow = 2)
a

x <- c(x, 1, 2, 3)
x

# data.frames
library(gapminder)
str(gapminder)
library(dplyr)

#### 13/10/15 ####
# In the gapminder data, every continent is sampled every 5 years
# Group bby coutries

# 1. How many countries are there on each continent?, 
# 2. What countries have the best and worst life expectancies in each continent?
# 3. Which country experienced  the sharpest 5 year drop in life expectancy 
# (sharpest drop between data points)?

# diff es la resta
# arrange 
# 3
gapminder %>%
  group_by (country) %>%
  arrange (year) %>% #sort by year...
  mutate(diff = lifeExp - lead(lifeExp)) %>% # lead function ti get previous row value
  group_by(continent) %>% 
  slice(which.min(diff)) # which.min helps you find minimum value

#### for loops ####
# Iterations...
# 
# nchar gives you de length 

animals <- c("cat", "dog", "ponies", "koi", "chickens", "moose")
for (animal in animals) {
  len <- nchar(animal)
  print(len)
}

# What is happening in the for loop is :
# len <- nchar(animal) animals [1]
# print("cat")
# len <- nchar(animal) animals [2]
# print("dog")
# len <- nchar(animal) animals [3]
# print("ponies")
# len <- nchar(animal) animals [4]
# print("koi")
# ......

# instead of going direclty through animals, we're gonna do this in numbers


# 
for (i in 1:6){
  len <- nchar(animals[i])
  print(len)
}

# calculate the square of the values from 1-10

# Not necessary to create a vector
# numbers <- c("1","2", "3", "4", "5", "6", "7 ", "8", "9", "10")

for (i in 1:10) { 
  sq <- i^2
  print(sq)
} 

# Creating an empty vector
sq <- vector(length = 10)
for (i in 1:10){
  sq [i] <- i^2
}
# it's like doing sq [1] = 1^2
# sq [2] = 2^2
# sq [3] = 3^2

# Calculate the cumulative sum of the values 1-10
sa <- vector (length = 1)
for (i in 1:10){
  sa [i] <- i+i
}
# no sirvió así. Ahora Jillian nos muestra cómo...

# 1 + 2 + 3 + 4 +..... 10
# 1st loop
# 1 + 2
# i + (i+1) -> c_sum <- c(3)

# 2nd loop
# 3 + 3
# i =2 
# c_sum [1] = 3
# c_sum [1] + i+1

c_sum <- 0
for (i in 1:10){
  browser() # allows you to check steps in the loop. N allows you to go next line
  c_sum <- c_sum + i
  print(c_sum)
}
# Use Q to exit the browser
# c_sum <- c_sum + 1

# Nesting
library('gapminder')
print(gapminder)

x <- 1:10
y <- "cat"
mixed_list <- list(x, y, head(gapminder)) # Whe jillian says nested, it means 
# something like this,... you have lists in a list.
print(mixed_list)

#### 20/10/15 ####

# for loops

# 1) create matrix
mat <- matrix(1:100, nrow = 10, ncol = 10)

# 2) Print each value of the matrix
for (i in 1:100){
  print(i)}
# Multiply each value in this matrix by 7 and store it in a 10 x 10 matrix



# 3 a) Print these values as part of a string that looks something like 'n = 16'

# sed.seed cuando se crean simulaciones para que los números salgan todos
# iguales

set.seed(1)
x <- round(runif(min = 10, max = 100, n = 15))

# a
for (i in x){
  print (paste (i))
}

#### Paste #### 
# creates a vector into a string
# created a vector tha has an n = 15 and values that range between 10 and 100

# Now, modify this loop to store these strings in a new vector called counts.

counts <- vector (length = length(x)
                  for (i in x){
                    counts[i] <- (paste (i))
# counts [34]


#### FUNctions ####
                    
# What is a function
# function(arg1, arg2, arg3)
# 3 parts
# 1) Name of function
# 2) Arguments (inputs)
# 3) body (code)

myFun <- function(args){
  code
  return(something) #sometimes
}

# Take a vector x, and get the difference between the max and min values

x <- 2:200
max(x) - min(x)

# Make this into a function!
  
max_minus_min <- function(x){
    dif <- max(x) - min(x)
    return(dif)
  }

max_minus_min(2:200) 

# because the vector x is 2:200, you can also just use x)
# Should return 198
max_minus_min(x) 


max_minus_min(gapminder$lifeExp) 
# Yes, lifeExp is a vector
max_minus_min(gapminder$country)
# No, country is a factor (cant do max/min)
max_minus_min(gapminder)
# Ha dont be silly thats crazy

max_minus_min(gapminder[,c('lifeExp', 'gdpPercap', 'pop')])


# always code defensively!
max_minus_min <- function(x){
    stopifnot(is.numeric(x))
      dif <- max(x) - min(x)
    return(dif)
  }

# EXERCISE: Write a function that squares a value

square <- function(x) {
  stopifnot(is.numeric(x))
  sq <- x^2
  return(sq)
}

square(2)

# Otra forma de hacerlo sería

sqnum <- function(x){x^2
}
sqnum(3)

# Es crucial en el caso de abajo, recordar que le tengo que decir al programa 
# que me devuelva (return) el resultado con la función que se encarga de elevar
# todo al cuadrado
quare <- function(x){
  sq <- x^2
  return(sq)
  }

quare(2)




# EXERCISE: Write a funtion that will take any number and raise it to any power


power <- function (x,y){
  pw <- x^y
  return(pw)
}

power(2,4)



#### 29/10/15 ####

# Break large problmes into small ones. 
# http://r.jillian.io/pages/discrete_population_exercise.html
# Nt=Nt−1+r∗Nt−1∗(1−Nt−1/K)

N_1 = 1 
k = 1000
r = 1

# N_2 = N_1 + r*N_1 (1 - N_1/k)
# N_3 = N_2 + r*N_2 (1 - N_2/k)
# N_4 = N_3 + r*N_3 (1 - N_3/k)


dgrowth <- function(k, r, ninit, ngen = 100){
  N <- vector(length = ngen)
  N[1] <- ninit
  for (gen in 2:ngen){
    N[gen] = N[gen-1] + r * N[gen-1]*(1-N[gen-1]/k)
  }
  return(N)
}

dgrowth(ninit = 1, k = 1000, r = 1, ngen =100)


# Another way to do it

N_1 = 1
r = 1
k = 1000
ngen = 100

# Let's start with the for loop first

N <- rep(NA, 100)
N[1]
#                          N = c(_, _, _, _, _,)
#                                [1][2] 
# for (i in 2:100){
# N [2] = N[1] + r*N[1] (1 - N[1]/k)
# N[i] = N[i-1] + r * N[i-1]*(1-N[i-1]/k)
}


# en la función necesito darle los valores a r, k, ngen, nint
# dgrowth <- function(r, k, ngen, ninit){
#                    (r = 1, k = 1000, ngen = 100, ninit =1)
# N <- rep(x = NA, times = ngen)
# N[1] <- init
# for (i in 2:ngen){
# N[i] = N[i-1] + r * N[i-1]*(1-N[i-1]/k)
# }
# return(N)
}



# 3a
# Make a quick plot of how population increases with time.

# First, let’s make a data frame where we bind one column of time values 
# with our vector/column of population size at time step t (calcuated using 
# our handy function). This time let’s look at 100 time steps.

ngen = 100
pop_100 <- dgrowth(ninit = 1, k = 1000, r = 1, ngen =100)
time_100 <- 1:100
pop_df <- data.frame(time_100, pop_100)
ggplot(data = pop_df, aes(x = time_100, y = pop_100)) +
  geom_line()


# rbind. Check what it does. It binds things.

ninit = 1
ngen = 100
r = seq(from = 0.7, to = 3, by = 0.1)
k =100


dgrowth(ninit, ngen, r, k)


r_vals = seq(from = 0.7, to = 3, by = 0.1)

pops <- data.frame(r= 0.6, t = 1:ngen, n = dgrowth(ninit = 1, r = 0.6, 
                                                   ngen = 100, k = 1000))

print(pops)

# Now, for the for loop
# r is going to chenge because we told it to change
# popr keeps track of the value of r each time 

for(r in r_vals){
N <- dgrowth(ninit = ninit, k = k, ngen = ngen, r = r)
popr <- data.frame(r = r, t = 1:ngen, N = N)
pops <- rbind(pops, popr)
}


ggplot(data = pops, aes(x = t, y = N)) +
         geom_line() +
         facet_wrap(~r)


#### 03/11/15 ####

# From "some code for today"

library(tidyr)
library(dplyr)
library(gapminder)  
gap <- 
  filter(gapminder, grepl("^N", country)) %>% 
  filter(year %in% c(1952, 1977, 2007)) %>% 
  slice(1:9) %>% 
  select(-continent, -gdpPercap, -pop) %>% 
  mutate(lifeExp = round(lifeExp))

life_exps <- spread(gap, key = year, value = lifeExp)

life_exps
