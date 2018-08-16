#Multiple Plots
#https://stackoverflow.com/questions/2564258/plot-two-graphs-in-same-plot-in-r

x= rnorm(100, 50,10)
y= rnorm(100, 70, 15)
x1= runif(100, 50,100)
x2= runif(100, 70, 120)
y1 = runif(100, 100,200)
y2 = runif(100, 100,200)


#plot
#plot(first thing to plot)
#plot(Second thing to plotm, add=T)


#same x coord
matplot(x, cbind(y1,y2),type="l",col=c("red","green"),lty=c(1,1))


#Diff x coordinates
x1  <- seq(-2, 2, 0.05)
x2  <- seq(-3, 3, 0.05)
y1 <- pnorm(x1)
y2 <- pnorm(x2,1,1)

plot(x1,y1,ylim=range(c(y1,y2)),xlim=range(c(x1,x2)), type="l",col="red")
lines(x2,y2,col="green")


#next to each other
par(mfrow=c(1,2))
plot(x)
plot(y) 
par(mfrow=c(1,1))


#
plot(x1, y1,col='red')
points(x2,y2,col='blue')
lines(x2,y2,col='green')


#----
kx = matrix( c(21,50,80,41), nrow=2 )
x
y = matrix( c(1,2,1,2), nrow=2 )
y
plot(x, y, col=c("red","blue"))

#ggplot
require(ggplot2)
df= data.frame(x, y1,y2)

ggplot(df, aes(x,y1)) +                    # basic graphical object
  geom_line(colour="red")   # first layer

ggplot(df, aes(x)) +                    # basic graphical object
  geom_line(aes(y=y1), colour="red") +  # first layer
  geom_line(aes(y=y2), colour="green")  # second layer
