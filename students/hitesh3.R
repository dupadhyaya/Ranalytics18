#hitesh - 11 Jun 18

df1 = read.csv(file.choose())
df2 = read.csv(file.choose())
#Test and filter outliers.
#Understand price fluctuations accounting the seasonal effect
#Detect seasonality type (multiplicative or additive) for each cluster of APMC and commodities
#De-seasonalise prices for each commodity and APMC according to the detected seasonality type
#Compare prices in APMC/Mandi with MSP(Minimum Support Price)- raw and deseasonalised
#Flag set of APMC/mandis and commodities with highest price fluctuation across different commodities in each relevant season, and year.
#Data: https://drive.google.com/drive/u/0/folders/0B-zoMsiXW40gZlNtNnlINEszRTg
# Variable description:
# msprice- Minimum Support Price
# arrivals_in_qtl- Quantity arrival in market (in quintal)
# min_price- Minimum price charged per quintal
# max_price- Maximum price charged per quintal
# modal_price- Mode (Average) price charged per quintal

# Submissions:Final cleaned file(s). 
# if the files are shared using GitHub with well versioned log)
# Documentation around the methodology, analysis, and final results that you want to share with the
# Government of Maharashtra. Do use graphs and charts to substantiate your analysis


#Outliers
#(https://stackoverflow.com/questions/16089572/how-to-detect-outliers-in-the-columns-of-a-dataframe-in-r)
  
#(https://eurekastatistics.com/using-mahalanobis-distance-to-find-outliers/)
#(http://www.questionflow.org/2017/12/26/combined-outlier-detection-with-dplyr-and-ruler/)
#(http://rischanlab.github.io/Outlier.html#Outlier_Detection_in_R)
#(https://www.math.csi.cuny.edu/Statistics/R/simpleR/printable/simpleR.pdf)
#(https://cran.r-project.org/web/packages/mvoutlier/mvoutlier.pdf)

#Modify this code
quantiles<-tapply(var1,names,quantile)
minq <- sapply(names, function(x) quantiles[[x]]["25%"])
maxq <- sapply(names, function(x) quantiles[[x]]["75%"])
var1[var1<minq | var1>maxq] <- NA
#----


str(df1)
head(df1)
outlier_values <- boxplot.stats(df1$msprice)$out  
outlier_values
boxplot(df1$msprice)
#no outliers

# for df2 - you will have split DF based in factor columns and then find outliers
# see links above




#Seasonality
names(df2)
#Detect seasonality type (multiplicative or additive) for each cluster of APMC and commodities
summary(df2)
df2$APMC = factor(df2$APMC)
df2$Commodity = factor(df2$Commodity)
summary(df2)
length(unique(df2$APMC))
length(unique(df2$Commodity))
head(df2)

dim(df2)
#Create a Time Series Format data from Year and Month

splt.by <- c('APMC','Commodity')
X1= split(df2, df2[,splt.by] )
X1[[1]]
lapply(X1, length)



X2 = split(df2, df2[,c('Commodity')])
X2[[1]]
lapply(X2, length)

X3 = split(df2, df2[,c('APMC')])
X3[[1]]
head(lapply(X3, length))


#(https://stackoverflow.com/questions/29046311/how-to-convert-data-frame-into-time-series-in-r)
#Convert to time series
X2[[1]]


head(df2, n=20)
names(df2)
df2a = df2[,c('date','Commodity','modal_price')]
head(df2a,n=20)
df2a[order(df2a$Commodity),][1:25,]
class(df2a$date)  #character

library(xts)
stocks <- xts(df[,-1], order.by=as.Date(df[,1], "%m/%d/%Y"))
as.Date('2015-04-01',format='%Y-%m-%d')

#(https://www.displayr.com/r-date-conversion/)
library(lubridate)
parse_date_time("July/1998", orders = c("bdy", "bY"))
parse_date_time('2015-04',orders=c('Ym'))

#(https://www.earthdatascience.org/courses/earth-analytics/time-series-data/summarize-time-series-by-month-in-r/)

library(zoo)

df2a$ym <- as.yearmon(df2a$date)
head(df2a$ym) # look at it
names(df2a)
plot(modal_price ~ ym, df2a) # plot it

#or you could create a zoo object:
  
dfz <- zoo(df2a$modal_price, df2a$ym)  #error since index values are not unique
#head(z) # look at it
#plot(z) # plot it

# convert your data to xts object
library(xts)
data.xts <- xts(df2a$modal_price,
                     as.POSIXct(df2a$ym))
library(rts)
# aggregate by ..
ep <- endpoints(data.xts,'years') # extract the end index on each year period
ep
ndvi.y <- period.apply(data.xts,ep,mean) # apply the mean function on each year
ndvi.y

epm <- endpoints(data.xts,'month') # month period
epm
ndvi.m <- period.apply(data.xts,epm,mean) # apply the mean function on each month
ndvi.m
dataTS = ndvi.m

library(ts)
#now use this for TS Analysis
stl(AirPassengers, s.window = 'periodic') # seasons to be considered periodic ie not changing over time
stl(dataTS, s.window = 'periodic')  #less period
dataTS
plot(dataTS)
#(https://stackoverflow.com/questions/12330581/too-few-periods-for-decompose) read this
#data less for extraction of seasonal componenet
monthplot(dataTS)
?stl
stl(dataTS, s.window = 4)  #less period
