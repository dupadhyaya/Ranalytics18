# Getting Started- Basics/Shortcuts in R

# Identify the directory

getwd()

# Setting Up the directory

setwd("D:/R Training/Training")

# List all the objects in directory

dir()

# How to run the code-- Press Control Key and then Press Enter


# "#" is used to comment a particular section in R


# To clear the console--- Press Control and then L Key

# To list the loaded vectors, matrix, datasets etc

ls()

# To Clear the enviornment list or unload the objects

remove(list = ls())

# For Help

?mean

# How to read CSV File

read.csv(file, header = TRUE, sep = ",", quote = "\"",
         dec = ".", fill = TRUE, comment.char = "", ...)

ir<- read.csv(file="iris.csv",header = TRUE,sep = ",")

is <- read.table(file="iris.csv",header = TRUE,sep = ",")

ii <- read.delim(file="iris.csv",header = TRUE,sep = ",")

