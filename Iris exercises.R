# Exercise 1

# Load data set iris

data("iris")
iris
str(iris)
# Create a single vector called width.
iris$Sepal.Width
width <- gapminder$lifeExp
# Obtain the 100th value in the width vector
width [100]
#Obtain last value of width vector
# There are 2 ways
# First way is to check the str of the iris data set. I know there are a total 
# of 150 rows, so I can do this:
width [150]
# the other way is to check the last values in the data set:
tail(width)
# the tail option shows me the last 6 values in my vector

# Select rows 10 to 20, with all columns in the iris dataset.
iris[10:20, ]

# Select rows 10 to 20 with only the Species, Petal.Width and Petal.Length. 
names(iris)

iris[10:20, c('Species', 'Petal.Width', 'Petal.Length')]

# Select rows 1 to 10, 20, and 100 in the iris dataset.

iris[c(1:10, 20, 100), ]

# Select the first value in the Sepal.Length column of the iris dataset. 

iris$Sepal.Length[1]
