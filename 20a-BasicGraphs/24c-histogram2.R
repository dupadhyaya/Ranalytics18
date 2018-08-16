# Histogram2
#https://www.programiz.com/r-programming/histogram
str(airquality)
airquality$Temp
Temperature = airquality$Temp
hist(Temperature)
# 9 cells equally spaced; Height of cell = no of observations falling in the cell
# main title, xlab, ylab, xlim, ylim, col, freq
# histogram with added parameters

hist(Temperature,
     main="Maximum daily temperature ",
     xlab="Temperature in deg F",
     xlim=c(50,100),
     col="darkmagenta",
     freq=FALSE
)
# yaxis labeled density instead of freq. total area =1
# return value of hist()
h = hist(Temperature)
h
#breaks-places where the breaks occur,
#counts-the number of observations falling in that cell,
#density-the density of cells, mids-the midpoints of cells,
#xname-the x argument name and
#equidist-a logical value indicating if the breaks are equally spaced or not.
#
h <- hist(Temperature,ylim=c(0,40))
text(h$mids,h$counts,labels=h$counts, adj=c(0.5, -0.5))

#Define no of breaks
hist(Temperature, breaks=4, main="With breaks=4")
hist(Temperature, breaks=20, main="With breaks=20")

#With manual Breaks
hist(Temperature,
     main="Maximum daily temperature",
     xlab="Temperature in degrees Fahrenheit",
     xlim=c(50,100),
     col="chocolate",
     border="brown",
     breaks=c(55,60,70,75,80,100)
)

