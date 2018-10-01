# Basic Stats
x = ceiling(rnorm(10000, mean=60, sd=20))
mean(x)
median(x)
#there is no mode function for mode stats
table(x)
sort(table(x), decreasing=T)

#mode
library(modeest)
mlv(x,method='shorth')

#quantile
quantile(x)
quantile(x,seq(.1,1,by=.1)) #decile
quantile(x,seq(.01,1,by=.01)) #percentile

library(e1071)                    # load e1071 

plot(density(x))    #density plot
e1071::skewness(x)                # apply the skewness 
kurtosis(x)

sd(x); var(x)
cov(women$weight, women$height)
cor(women$height, women$height)

stem(x)

#Freq Table
library(fdth)  #fast way of creating FT
ftable1 = fdt(x)
ftable1
