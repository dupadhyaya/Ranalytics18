# Outlier Analysis
#outlier not predicted well in by fitted regression model

marks1 = c(1:80, 100)
marks2 = c(1:80,100, 1000)
summary(marks1)
summary(marks2)

par(mfrow=c(1,2))  # multiple frames per row
boxplot(marks1)
(q1= quantile(marks1, c(.0,.25,.50,.75,1)))
abline(h=q1, col=1:6)
text(1, q1+2, labels=c('min','1Q','median','3Q','max'), col=1:5)
title(main='Marks1')

boxplot(marks2)
(q2= quantile(marks2, c(.0,.25,.50,.75,1)))
abline(h=q2, col=1:6)
text(1, q2+2, labels=c('min','1Q','median','3Q','max'), col=1:5)
title(main='Marks2')

mean(marks1); mean(marks2)  # diff in means due to outlier
; mean(marks2, trim=.1)# trim extreme values
median(marks1); median(marks2)  # not much diff

# when you have large values how to identify outlier rows
#Identify---
set.seed(482)
(y = c(rnorm(100,50,10), 150, 170,200))
boxplot(y)
identify(rep(1, length(y)), y, labels = seq_along(y))
y[c(101,102,103)]

# How do outlier effect Regressions : Identify them

names(mtcars)
mtcarslm = lm(mpg ~ wt + cyl + hp + am + gear, data=mtcars)
boxplot(mtcars)
mtv1 = c('hp', 'disp')  # few variables only
boxplot(mtcars[mtv1])
boxplot(mtcars[c(-mtv1)])
ix= match(mtv1,names(mtcars))
boxplot(mtcars[,-ix])
?match
library(car)
car::outlierTest(mtcarslm)

car::influencePlot(mtcarslm)



#Extras -----
library(outliers)
set.seed(1234)
x = rnorm(10)
chisq.out.test(x)
chisq.out.test(x,opposite=TRUE)

car::outlierTest(fit, labels=names(rstud))
car::outlierTest(lm(prestige~income+education, data=Duncan))

#car::avPlots(mtcarslm, ask=F, id.method='identify')

library(outliers)
#https://cran.r-project.org/web/packages/outliers/outliers.pdf
set.seed(1234)
y=rnorm(100)
outlier(y)
outlier(y,opposite=TRUE)
y=rm.outlier(y, fill = FALSE, median = FALSE, opposite = FALSE)
rm.outlier(y, fill = FALSE, median = FALSE, opposite = FALSE)
#scores(y, type = c("z"), prob = NA, lim = NA)

set.seed(1234)
y=rnorm(100)
dim(y) <- c(20,5) # convert to matrix
y
outlier(y) #in each column
outlier(y,opposite=TRUE)
apply(y, c(2), range)
boxplot(y)
scores(y, type = c("z", "t", "chisq", "iqr", "mad"), prob = NA, lim = NA)



#Univariate
url <- "http://rstatistics.net/wp-content/uploads/2015/09/ozone.csv"  
# alternate source:  https://raw.githubusercontent.com/selva86/datasets/master/ozone.csv
inputData <- read.csv(url)  # import data
outlier_values <- boxplot.stats(inputData$pressure_height)$out  
outlier_values
boxplot(inputData$pressure_height, main="Pressure Height", boxwex=0.1)
mtext(paste("Outliers: ", paste(outlier_values, collapse=", ")), cex=0.6)





fit2 = lm(weight ~ height + I(height^2), data=women)
par(mfrow=c(2,2)) ;plot(fit2)
par(mfrow=c(1,1)) ; plot(fit2, which=4)
?plot
fit3 = lm(weight ~ height + I(height^2), data=women[-c(13,15),])
fit3
par(mfrow=c(1,1)) ; plot(fit3, which=4)



#Bivariate
url <- "http://rstatistics.net/wp-content/uploads/2015/09/ozone.csv"
ozone <- read.csv(url)
# For categorical variable
boxplot(ozone_reading ~ Month, data=ozone, main="Ozone reading across months")  # clear pattern is noticeable.
boxplot(ozone_reading ~ Day_of_week, data=ozone, main="Ozone reading for days of week")  # this may not be significant, as day of week variable is a subset of the month var.





x <- ozone$pressure_height
qnt <- quantile(x, probs=c(.25, .75), na.rm = T)
caps <- quantile(x, probs=c(.05, .95), na.rm = T)
H <- 1.5 * IQR(x, na.rm = T)
x[x < (qnt[1] - H)] <- caps[1]
x[x > (qnt[2] + H)] <- caps[2]



#----

library(DMwR)
sampledata = mtcars[1:3]
outlier.scores = lofactor(sampledata, k=2)
outlier.scores
plot(density(outlier.scores))
order(outlier.scores, decreasing=T)[1:5]  # rownows
sampledata[c(6,4,25,3,28),]

marks = c(1:80,100, 1000)
marks2 = c(1:80, 100)
marks
boxplot(marks2)
summary(marks)
boxplot(marks)
outlier.scores2 = lofactor(marks,1)
outlier.scores2
plot(density(outlier.scores2))
order(outlier.scores2, decreasing=T)[1:2]  # rownows
marks[c(82,81)]
marks
