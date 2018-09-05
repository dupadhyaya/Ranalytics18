#-----------------------------------------Time Series Forecasting---------------------------------------#



#Analytical Problem: To forecast the Sales (in thoushand units) of a Automobile company for the next 36 months

#----------------------------------Preparing the environment--------------------------------------------#

list.of.packages <- c("forecast", "ggplot2","MASS","caTools","sqldf","tseries")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, repos="http://cran.rstudio.com/")
library(forecast)
library(tseries)

#-----------------------------Setting the working directory-------------------------------------------#

Path<-"C:/Ganesha_Accenture/Ganesha_IVY/R/Gan_B01/03Data"
setwd(Path)
getwd()

data<-read.csv("./data/Sales.csv",header = TRUE)
#data = read.csv(file.choose())
head(data)
TSdata=data#To create a backup of original data


#-------Exploring the data-------------------#
head(TSdata)#
dim(TSdata)#We have 144 time series points (at a date level) and 2 vars(Date, Sales)
str(TSdata)
summary(TSdata)
colSums(is.na(TSdata))
names(TSdata)[c(1:2)]=c("Date","Sales")


#--Transformation of the date data into time series----------#

TSdata=ts(TSdata[,2],start=c(2003,1),frequency=12)
start(TSdata)
end(TSdata)
frequency(TSdata)
StructTS(TSdata)
TSdata

#2003,1 is the start date and 12 is the frequency of the time series (monthly series)
str(TSdata)


#--------------------->plotting the sales 
plot(TSdata,ylab="Sales", xlab="Year",main="Sales between 2003-2014",col="grey")
abline(reg = lm(TSdata~time(TSdata)))
cycle(TSdata)
plot(aggregate(TSdata,FUN=mean))
#This plot displays the year on year trend in the sales from 2003 

#Data has both a trend and drift, i.e. time invariant mean and variance 



#--------------->Differencing the data to remove trend and drift


plot(log10(TSdata),ylab="log(Sales)",xlab="Year",main="log(Sales) between 2003-2014",col="grey")
##Differencing the data to remove trend
plot(diff(TSdata,differences = 1),ylab="Diff(Sales)",xlab="Year",main="Diff(Sales) between 2003-2014",col="grey")
#The differenced data continues to have unequal variance 


#--------------->Differencing+Log transformation the data to remove trend and unequal variance


plot(diff(log10(TSdata),differences = 1),ylab="Diff(Sales)",xlab="Year",main="Diff(Log(Sales)) between 2003-2014",col="grey")

#So, with Log10 and 1 order of differencing makes the series stationary

#----------------->Checking the stationarity of transformed data using the Augmented Dickey-Fuller Test(ADF)

LDTSdata=diff(log10(TSdata),differences = 1)
require(forecast)
adf.test(LDTSdata,alternative="stationary")

#Since, the p-value <0.05, hence, we reject the Ho: Series is Non-Stationary 

kpss.test(LDTSdata)
#creating the ACF and PACF plot
par(mfrow=c(1,2))
acf(diff(log10(TSdata)),main="ACF plot")#ACF PLOT -- Moving Average or q
pacf(diff(log10(TSdata)),main="PACF plot")#PACF PLOT -- Auto Regressive or p
#Running the ARIMA model
ARIMAFit=arima((log10(TSdata)),c(1,1,0))


summary(ARIMAFit)
#Running the ARIMA model-R, gives the best model fit 
require(forecast)
ARIMAFit1=auto.arima(log10(TSdata),approximation=TRUE,trace=TRUE)
?auto.arima
?arima
summary(ARIMAFit1)
ARIMAFit1$residuals
#Predicting the future values
pred=predict(ARIMAFit1,n.ahead=36)
pred

#n.ahead is the no. of time series, we want to predict

##########################################3
##Ploting the observed data and forecasted data together
par(mfrow=c(1,1))
plot(TSdata,type="l",xlim=c(2004,2018),ylim=c(1,1600),xlab="Year",ylab="Sales")
lines(10^(pred$pred),col="red")

###############################################
#plotting the +-2 standard error to range of expected error
plot(TSdata,type="l",xlim=c(2004,2018),ylim=c(1,1600),xlab = "Year",ylab = "Sales")
lines(10^(pred$pred),col="red")
lines(10^(pred$pred+2*pred$se),col="blue")
lines(10^(pred$pred-2*pred$se),col="black")
## then forecast the result
pred = predict(ARIMAFit1, n.ahead = 36)
write.csv(pred,"predict.csv")

## then do the exponential since you had used log earlier.
normal_result=10^pred$pred ## you get the desired result. 
write.csv(normal_result,"finalpredict.csv", row.names = FALSE)
plot(normal_result)

#-------------------------------End of the model-----------------------------------#
