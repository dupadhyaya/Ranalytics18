#initial commands

# assign
x1 = 3 #press control + enter to run the line
x2 <- 3 # same 
#which is better
x1
x2

ls() #variables in env

data() # datasets available for use

library()  # libraries currently loaded

?mean  #help
help(mean)
??mean  #search through other sources 
1:10000000
x <- c(0:10, 50)
x
xm <- mean(x)
xm
mean(x, trim=.10)
(x=1:10)


version() #version of R

Sys.Date() # todays date

getwd()  # working directory

methods(class='matrix')  #methods available for a class of object

plot(1:10) #basic command to plot

