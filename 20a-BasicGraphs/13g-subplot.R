#subplot
#https://www.programiz.com/r-programming/subplot
#put two or more graphs in a single plot.
par()
#mfrow can be used to specify the number of subplot we need
max.temp <- c(20, 25, 20, 27, 33, 22, 28)
max.temp    # a vector used for plotting


par(mfrow=c(1,2))    # set the plotting area into a 1*2 array

barplot(max.temp, main="Barplot")
pie(max.temp, main="Piechart", radius=1)
#same phenomenon can be achieved with the graphical parameter mfcol.
#only difference between the two is that, mfrow fills in the subplot region row wise while mfcol fills it column wise.

Temperature <- airquality$Temp
Ozone <- airquality$Ozone
#rowfirst
par(mfrow=c(2,2))
#par(mfcol=c(2,2))


hist(Temperature)
boxplot(Temperature, horizontal=TRUE)
hist(Ozone)
boxplot(Ozone, horizontal=TRUE)

#more control using fig
# make labels and margins smaller
par(cex=0.7, mai=c(0.1,0.1,0.2,0.1))

Temperature <- airquality$Temp

# define area for the histogram
par(fig=c(0.1,0.7,0.3,0.9))
hist(Temperature)

# define area for the boxplot
par(fig=c(0.8,1,0,1), new=TRUE)
boxplot(Temperature)

# define area for the stripchart
par(fig=c(0.1,0.67,0.1,0.25), new=TRUE)
stripchart(Temperature, method="jitter")
