#ggplot2 with mtcars
#(https://rpubs.com/BillB/217355)

library(ggplot2)
ggplot(mtcars, aes(mpg)) + geom_histogram(binwidth = 4) + xlab('Miles per Gallon') + ylab('Number of Cars') +   ggtitle('Distribution of Cars by Mileage')

ggplot(mtcars, aes(cyl)) +  geom_histogram(binwidth=1) + xlab('Cylinders') + ylab('Number of Cars') +   ggtitle('Distribution of Cars by Cylinders')

ggplot(mtcars, aes(hp)) +  geom_histogram(binwidth=20) + xlab('horsepower') + ylab('Number of Cars') +  ggtitle('Distribution of Cars by Horsepower')
#HP vs MPG
ggplot(mtcars, aes(hp, mpg)) + geom_point() 
#with prediction line  
ggplot(mtcars, aes(hp, mpg)) + geom_point() +
  geom_smooth(method = "lm", se = T) +
  ylab("Miles per Gallon") +
  xlab("No. of Horsepower") +
  ggtitle("Impact of Number of Horsepower on MPG")

#apply smoothing since mpg unlikely to hit zero
ggplot(mtcars, aes(hp, mpg)) +
  stat_smooth() + geom_point() +
  ylab("Miles per Gallon") +
  xlab ("No. of Horsepower") +
  ggtitle("Impact of Number of Horsepower on MPG")

qplot(cyl, mpg, data = mtcars, colour = cyl, geom = "point",     
      ylab = "Miles per Gallon", xlab = "No. of Cylinders",
      main = "Impact of Number of Cylinders on MPG") 

#lm----
#linear regression to fit the data to a line. We use geom_smooth with the linear model method.
ggplot(mtcars, aes(cyl, mpg)) + geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  ylab("Miles per Gallon") + xlab("No. of Cylinders") +
  ggtitle("Impact of Number of Cylinders on MPG")
