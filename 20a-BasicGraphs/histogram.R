#Histogram

#Histograms
#You can create histograms with the function hist(x) where x is a numeric vector of values to be plotted. The option freq=FALSE plots probability densities instead of frequencies. The option breaks= controls the number of bins.
?hist
hist(x, breaks = "Sturges",
     freq = NULL, probability = !freq,
     include.lowest = TRUE, right = TRUE,
     density = NULL, angle = 45, col = NULL, border = NULL,
     main = paste("Histogram of" , xname),
     xlim = range(breaks), ylim = NULL,
     xlab = xname, ylab,
     axes = TRUE, plot = TRUE, labels = FALSE,
     nclass = NULL, warn.unused = TRUE, ...)
# Simple Histogram
hist(mtcars$mpg)

# Colored Histogram with Different Number of Bins
hist(mtcars$mpg, breaks=12, col="red")
# 12 bars
hist(mtcars$mpg, breaks=7, xlim=c(10,40), ylim=c(0,10) ,
     col=rainbow(7), labels=T, 
     main=paste('Histogram of MPG'))

# Add a Normal Curve 
x <- mtcars$mpg 
h<-hist(x, breaks=10, col="lightblue",  xlab="Miles per Gallon", 
   xaxt='n', labels=T , main="Histogram with Normal Curve") 
x
axis(1, at=h$mids,labels=h$mids,line=.25, col.axis="red", cex.axis=0.7, las=1)
# add a title for the x axis 
mtext("Interval of 2 mpg", side=1, line=2, 
      cex.lab=1,las=1, col="blue", at=30)
# another mtext
mtext("Interval of 2 mpg", side=1, line=4, at=17,
      cex.lab=1,las=1, col="green")

xfit<-seq(min(x),max(x),length=40) 
xfit
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x)) 
yfit
h$breaks ; h$mids ; h$counts; 
h$mids[1:2] ; length(x); diff(h$mids[1:2]); diff(h$mids[1:2]) * length(x)
yfit <- yfit*diff(h$mids[1:2])*length(x) 
yfit
lines(xfit, yfit, col="blue", lwd=2)

# Air Passengers
str(AirPassengers)
head(AirPassengers)
hist(AirPassengers)
hist(AirPassengers, main="Histogram for Air Passengers", 
     xlab="Passengers", border="blue", col="green", 
     xlim=c(100,700),las=2, breaks=5)
hist(AirPassengers, breaks=c(100, 300, 500, 700))
hist(AirPassengers, breaks=c(100, seq(200,700, 150))) # Prob automatically
#start at 100 on the x-axis, and from values 200 to 700, make the bins 150 wide

hist(AirPassengers, main="Histogram for Air Passengers", 
     xlab="Passengers",border="blue", col="green", 
     xlim=c(100,700), las=1,breaks=5,prob = TRUE)
lines(density(AirPassengers)) 
#Get a density curve to go along with your AirPassengers histogram
hist.info = hist(AirPassengers)
summary(hist.info)
hist.info
hist(AirPassengers, freq=F)
hist2 = hist(AirPassengers, plot=F)
hist2$density
sum(hist2$density)
sum(hist2$density * diff(hist2$breaks))
#curve(dnorm(AirPassengers, mean=mean(AirPassengers), sd=sd(AirPassengers)),
#add=TRUE, col='darkblue', lwd=2)

# Faithfull--------------
colors = c("red", "yellow", "green", "violet", "orange", 
           "blue", "pink", "cyan") 
hist(faithful$eruptions    # apply the hist function 
       ,right=FALSE    # intervals closed on the left 
       ,col=colors     # set the color palette 
       ,main="Old Faithful Eruptions" # the main title 
       ,xlab="Duration minutes")       # x-axis label




# Kernel Density Plot
d <- density(mtcars$mpg) # returns the density data 
plot(d) # plots the results

# Filled Density Plot
d <- density(mtcars$mpg)
plot(d, main="Kernel Density of Miles Per Gallon")
polygon(d, col="red", border="blue")

# Compare MPG distributions for cars with 
# 4,6, or 8 cylinders
library(sm)
attach(mtcars)

# create value labels 
cyl.f <- factor(cyl, levels= c(4,6,8),
                labels = c("4 cylinder", "6 cylinder", "8 cylinder")) 

# plot densities 
sm.density.compare(mpg, cyl, xlab="Miles Per Gallon")
title(main="MPG Distribution by Car Cylinders")

# add legend via mouse click
colfill<-c(2:(2+length(levels(cyl.f)))) 
legend(locator(1), levels(cyl.f), fill=colfill)

