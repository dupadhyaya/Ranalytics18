#Datasets

?datasets                     # Using R's built in data sets
data()

library(help=datasets)

data(mtcars)                 
cars <- mtcars  
levels(mtcars$gear)

# Viewing data set
mtcars    #Console Window         
View(mtcars)#new tab                 
head(mtcars,10) #top 10 records
head(mtcars) # top 6
tail(mtcars)  # last 6                 

str(mtcars)   #structure of dataset                 

names(mtcars) # column names of DF

