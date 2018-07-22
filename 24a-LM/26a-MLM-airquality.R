# Linear Regression - Data set - Air Quality


data(airquality)# to call the data
attach(airquality)
head(airquality,10)# to see first 10 rows
#attach () function makes the data available to the R search path.

#Summary function gives you the range, quartiles, median and mean for numerical variables and table with frequencies for categorical variable.
summary(airquality)

#Data visualization 
#boxplot to visualize the daily temperature for month 5, 6, 7, 8 and 9.
month5=subset(airquality,Month=5)
month6=subset(airquality,Month=6)
month7=subset(airquality,Month=7)
month8=subset(airquality,Month=8)
month9=subset(airquality,Month=9)

par(mfrow = c(1,2))  # 3 rows and 2 columns
boxplot((month5$Temp~airquality$Day),main='Month 5',col=rainbow(3))
boxplot((month6$Temp~airquality$Day),main='Month 6',col=rainbow(3))
boxplot((month7$Temp~airquality$Day),main='Month 7',col=rainbow(3))
boxplot((month8$Temp~airquality$Day),main='Month 8',col=rainbow(3))
boxplot((month9$Temp~airquality$Day),main='Month 9',col=rainbow(3))

par(mfrow = c(1,1))                                                                
#histogram to see the distribution of temperature data.
hist(airquality$Temp,col=rainbow(2))

#scatter plot to see if there is a linear pattern between the ‘temperature rise’ and other variables.
                                                                
plot(airquality$Temp ~ airquality$Day + airquality$Solar.R + airquality$Wind + airquality$Ozone, col='blue')
                      
#It seems that solar.R , Ozone, and wind have a linear pattern with temperature. Solar and Ozone have a positive relationship and wind has a negative one.  I use Co-plot to see the effect of wind and solar radiations combined on Temperature

head(airquality[,c('Ozone','Solar.R', 'Wind')])
coplot(Ozone ~ Solar.R | Wind, panel=panel.smooth, airquality, col= 'green')

# Data Cleaning ----
#Missing Values
sapply(airquality,function(x){sum(is.na(x))})

#Impute Missing Values
airquality$Ozone[is.na(airquality$Ozone)]=mean(airquality$Ozone,na.rm=T)

airquality$Solar.R[is.na(airquality$Solar.R)]=mean(airquality$Solar.R,na.rm=T)

sapply(airquality,function(x){sum(is.na(x))})

#Correlation
library(corrplot)

o=corrplot(cor(airquality),method='number') 
# this method can be changed try using method=’circle’
corrplot(cor(airquality),method='circle') 

#Model
Model_lm1=lm(Temp~.,data=airquality)
summary(Model_lm1)
AIC(Model_lm1)

#Best Model based on AIC
Model_lm_best=step(Model_lm1)
summary(Model_lm_best)
plot(Model_lm_best,col='blue')


# VIF
library(fmsb)
Model_lm1=lm(Temp~ Ozone+Solar.R+Month,data=airquality)
VIF(lm(Month ~ Ozone+Solar.R,data=airquality))
VIF(lm(Ozone ~ Solar.R+Month, data=airquality))
VIF(lm(Solar.R ~ Ozone +Month, data=airquality))
#As a general rule, VIF < 5 is acceptable (VIF = 1 means there is no multicollinearity), and VIF > 5 is not acceptable and we need to check our model.

#In our example, VIF < 5 and hence there is no need of any additional verification needed.