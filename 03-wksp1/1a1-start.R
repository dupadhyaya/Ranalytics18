#initial commands

# assign
x1 = 3 #press control + enter to run the line
x2 <- 3 # same 
#which is better
x1
x2
y
ls() #variables in env
women

?AirPassengers
data() # datasets available for use

library()  # libraries currently loaded

?mean  #help
help(mean)
??mean  #search through other sources
x=0:10
x
x <- c(0:10, 50)
x
xm <- mean(x)
xm
mean(x, trim = 0.10)
x=c(1,1,1,1,5,5,5,5,7,7)
mean(x)
mean(x, trim=.3)
x=c(1,5,5)
mean(x)
c(mean(x), mean(x, trim = 0.10))

1:10
1:10000000
x=c(1,34,5)
x
?c
version #version of R

Sys.Date() # todays date

getwd()  # working directory

methods(class='matrix')  #methods available for a class of object

plot(10:100) #basic command to plot
plot(women)
