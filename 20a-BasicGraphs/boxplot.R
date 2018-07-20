# Box Plots

# Boxplot of MPG by Car Cylinders 
boxplot(mpg~cyl,data=mtcars, main="Car Milage Data", 
        xlab="Number of Cylinders", ylab="Miles Per Gallon")

# Notched Boxplot of Tooth Growth Against 2 Crossed Factors
# boxes colored for ease of interpretation 
boxplot(len~supp*dose, data=ToothGrowth, notch=TRUE, 
        col=(c("gold","darkgreen")),
        main="Tooth Growth", xlab="Suppliment and Dose")
#In the notched boxplot, if two boxes' notches do not overlap this is ‘strong evidence’ their medians differ (

# Notched Boxplot of Tooth Growth Against 2 Crossed Factors
# boxes colored for ease of interpretation 
boxplot(len~supp*dose, data=ToothGrowth, notch=TRUE, 
        col=(c("gold","darkgreen")),
        main="Tooth Growth", xlab="Suppliment and Dose")








# BoxPlot 3 -------------
data    <- c(0.4, 0.7, 0.75, 0.82, 0.9)
data
endaxis <- c(0, 1)  # endpoints of axis
datamm  <- c(min(data), max(data))
boxplot(data, horizontal = TRUE, range = 0, ylim = endaxis,
        axes = FALSE, col = "grey", add = FALSE)
arrows(endaxis, 1,  datamm, 1,  code = 1, angle = 90, length = 0.1)
valuelabels <- c(endaxis[1], round(fivenum(data)[2], digits = 2) ,
                 round(fivenum(data)[4], digits = 2), endaxis[2]  ) 

# Boxplot 4 ----------

boxplot(data)
abline(h = min(data), col = "Blue")
mtext(4,at = min(data), text='Min' , las=2)

abline(h = max(data), col = "Yellow")
text(x=1.2, y=max(data), labels= 'Max', col='Yellow')

abline(h = median(data), col = "Green")
text(x=.8, y=median(data), labels= 'Median', col='Green')

abline(h = mean(data), col = "Violet")
text(x=.8, y=mean(data), labels= 'Mean', col='Violet')

abline(h = quantile(data, c(0.25, 0.75)), col = "Red")
text(x=1.5, y=quantile(data, c(0.25, 0.75)), 
     labels= c('1QR','3QR'), col='Red')

boxplot(data)
axis(4, at=summary(data), labels = names(summary(data)), 
     las=2, line = -3, cex.lab=.5,col="blue")
text(x=1.25, y=summary(data), labels = summary(data), col='red', cex=.5)

text(x=1, y=c(min(data)-.01, max(data)+.01), 
     labels = c('Outliers - Low', 'Outliers - High'), col='red', cex=.5)

