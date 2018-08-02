# Skewness
#measure of symmetry. As a rule, negative skewness indicates 
#that the mean of the data values is less than the median, and the data distribution is left-skewed. Positive skewness would indicate that the mean of the data values is larger than the median, 
#and the data distribution is right-skewed.



set.seed(1234)
(marks = ceiling(rnorm(100,50,20)))
x=marks
library(e1071)                    # load e1071 
hist(x)
plot(density(x))
e1071::skewness(x)  #0.5884632  +vely 

# Mean Median Mode
(m1 = mean(x))
(m2 = median(x))
(m3 = modeest::mlv(x,  method = "mfv"))  # this is not atomic value
#str(m3)
centraltendency= c(MEAN= m1,MEDIAN= m2,MODE= m3$M)
sort(centraltendency)

# Other Packages
library(moments)
moments::skewness(x) #0.5974018



library(e1071)                    # load e1071 
duration = faithful$eruptions     # eruption durations 
skewness(duration)                # apply the skewness function 

library(fBasics) # skewness part of timeDate package
timeDate::skewness(x)
?skewness # see where all help is available
timeDate::skewness(x, na.rm = FALSE, method = c("moment", "fisher"))

# Psych Package
library(psych)
psych::describe(x)
psych::describeBy(mtcars,group= mtcars$am)


# Skewness of multiple Columns
?colSkewness
timeSeries::colSkewness(mtcars, na.rm = FALSE)



# Generate Various Directions
N <- 10000
x <- rnbinom(N, 10, .5)
hist(x, 
     xlim=c(min(x),max(x)), probability=T, nclass=max(x)-min(x)+1, 
     col='lightblue', xlab=' ', ylab=' ', axes=F,
     main='Positive Skewed')
lines(density(x,bw=1), col='red', lwd=3)
skewness(x)


ndata = rbeta(10000,5,2)
pdata =  rbeta(10000,2,5)
data = rbeta(10000,5,5)
head(ndata); head(data) ; head(ndata)
hist(pdata)
hist(data)
hist(ndata)

skewness(ndata)
skewness(data)
skewness(pdata)

# all 3 together
timeSeries::colSkewness(cbind(ndata,data,pdata), na.rm = FALSE)

library(asbio)
asbio::skew(x)

exp<-rexp(10000)
exp
skew(exp)
kurt(exp)
