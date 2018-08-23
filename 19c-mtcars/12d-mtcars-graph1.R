#mtcars graphs

head(mtcars)

#plot - scatter
plot(mtcars$mpg)
plot(x=mtcars$wt,y=mtcars$mpg,pch=17,cex=2,col='red' )

#histogram
hist(mtcars$mpg)
hist(mtcars$mpg, breaks=5, col=1:5)

#----
cars_auto = subset(mtcars, am == 0)
cars_manu = subset(mtcars, am == 1)
par(mfrow = c(2, 1)) #2 row,1 col
hist(cars_auto$mpg, main = "Distribution mpg - automatic transmission", xlab = "mpg")

abline(v = mean(cars_auto$mpg), col = "red")
hist(cars_manu$mpg, main = "Distribution mpg - manual transmission", xlab = "mpg")
abline(v = mean(cars_manu$mpg), col = "red")
par(mfrow=c(1,1))


#pie----
t1=table(mtcars$cyl)
pie(t1)

#barplot
(count1 = table(mtcars$cyl))
barplot(count1, col=2:4)

# Grouped Bar Plot
(counts <- table(mtcars$vs, mtcars$gear))
barplot(counts)
barplot(counts, beside=T,col=1:2)

barplot(counts, main="Car Distribution by Gears and VS",
        xlab="Number of Gears", col=c("darkblue","red"),
        legend = rownames(counts), beside=TRUE)

#boxplot
boxplot(mtcars$mpg)

boxplot(mpg ~ cyl, data=mtcars, col=5:7)
boxplot(mpg~cyl*am, data=mtcars, notch=TRUE, 
        col=(c("gold","darkgreen")),
        main="MT Cars", xlab="cyl & transmission")
#4.1 = cyl=4, am=1



#line chart
plot(mtcars$wt, mtcars$mpg, type='b')
df=mtcars[order(mtcars$wt),]
plot(df$wt, df$mpg[cyl==4], type='b', col='red', lwd=2)
lines(df$wt, df$hp, type='b', col='green')



# Basic Scatterplot Matrix
pairs(~mpg+disp+drat+wt,data=mtcars, 
      main="Simple Scatterplot Matrix")


# 3D Scatterplot
library(scatterplot3d)
scatterplot3d(mtcars$wt,mtcars$disp,mtcars$mpg, main="3D Scatterplot")


library(vioplot)
x1 <- mtcars$mpg[mtcars$cyl==4]
x2 <- mtcars$mpg[mtcars$cyl==6]
x3 <- mtcars$mpg[mtcars$cyl==8]
vioplot(x1, x2, x3, names=c("4 cyl", "6 cyl", "8 cyl"), 
        col="gold")
title("Violin Plots of Miles Per Gallon")


#dotplot----
dotchart(mtcars$mpg,labels=row.names(mtcars),cex=.7,
         main="Gas Milage for Car Models", 
         xlab="Miles Per Gallon")

#correllogram----
library(corrplot)
res=cor(mtcars)
res
corrplot(res, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45)

library(corrgram)
cor(mtcars[1:5])
corrgram(mtcars[1:5], order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt)



library("PerformanceAnalytics")
my_data <- mtcars[, c(1,3,4,5,6,7)]
chart.Correlation(my_data, histogram=TRUE, pch=19)


#heatmap-----
# Get some colors
col<- colorRampPalette(c("blue", "white", "red"))(20)
heatmap(x = res, col = col, symm = TRUE)

#level plot

z <- cor(mtcars)
require(lattice)  #install first
levelplot(z)





#https://rstudio-pubs-static.s3.amazonaws.com/45786_b5e54c2d3c824f51abd2d559506cf81f.html
