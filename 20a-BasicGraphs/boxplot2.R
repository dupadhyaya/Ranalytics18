# Box Plot2
#his function takes in any number of numeric vectors, 
#drawing a boxplot for each vector
#
str(airquality)
boxplot(airquality$Ozone)
#median is more dispersed. We can also notice two outliers at the higher extreme.
#Additional Para - main, xlab, ylab, col, horiz=T, notch=T
boxplot(airquality$Ozone,
        main = "Mean ozone in parts per billion ",
        xlab = "Parts Per Billion",
        ylab = "Ozone",
        col = "orange",
        border = "brown",
        horizontal = TRUE,
        notch = TRUE
)

#Return Value of boxplot
b <- boxplot(airquality$Ozone)
b
#n-the number of observation the boxplot is drawn with (notice that NA's are not taken into account)
#conf-upper/lower extremes of the notch, out-value of the outliers
#group-a vector of the same length as out whose elements indicate to which group the outlier belongs and
#names-a vector of names for the group

#Multiple Box Plots
#Ozone, Temp
ozone = airquality$Ozone
temp = airquality$Temp
#generate normal distribution with the same mean and standard deviation and plot them side by side for comparison.
ozone_norm <- rnorm(200,mean=mean(ozone, na.rm=TRUE), sd=sd(ozone, na.rm=TRUE))
temp_norm <- rnorm(200,mean=mean(temp, na.rm=TRUE), sd=sd(temp, na.rm=TRUE))
boxplot(ozone, ozone_norm, temp, temp_norm,
        main = "Multiple boxplots for comparision",
        at = c(1,2,4,5),
        names = c("ozone", "normal", "temp", "normal"),
        las = 2,
        col = c("orange","red"),
        border = "brown",
        horizontal = TRUE,
        notch = TRUE
)

#Boxplot with Formula
boxplot(Temp~Month,
        data=airquality,
        main="Different boxplots for each month",
        xlab="Month Number",
        ylab="Degree Fahrenheit",
        col="orange",
        border="brown"
)
#month number 7 (July) is relatively hotter than the rest.
#