# Time Series Case Study - Decomposition

#https://rpubs.com/emb90/137525
# Data Set - AirPassengers
x=c(9.23221232,5.3430000)
x
options(digits=2)
x

?AirPassengers
head(AirPassengers)
AirPassengers
str(AirPassengers)
class(AirPassengers)

#The decomposition of time series is a statistical task that deconstructs a time series into several components, each representing one of the underlying categories of patterns
# TS data components : Level + Irregular + Seasonal

#stl(x, s.window, t.window = ) # command to do decomp
stl(AirPassengers, s.window = 'periodic') # seasons to be considered periodic ie not changing over time
# save it in an object

plot(AirPassengers) # Pattern of data : see increasing seasonal values suggesting multiplicative Model
#no cyclic here - only seasonal, trend, irregual
#s.window - specifies seasonal effects to be identical across years
#can handle on additive models

stl1 = stl(AirPassengers, s.window = 'periodic')
plot(stl1) # actual data, seasonal, long term trends, remainder/ irregular

class(stl1)

stl1$time.series
#(df = stl1$time.series)
#df = as.data.frame(df)
#write.csv(df, './data/airpsng.csv')


#Additive Model Y = Trend + Seasonal + Irregular
#sales increase by 300 qty in month of Nov
#Multiplicative Model Y = Trend * Seasonal * Irregular
#sales increase by 10% in month of Nov


#dataset
AirPassengers
class(AirPassengers)

# Plot
plot(AirPassengers)
#variability increases with level. at low values of passengers variations are less, at later years seasonal variations seem to be more -> Multiplicative model suggested

#stabilise the plot
LogAirPassengers = log(AirPassengers)  # make it additive because stl handles only additive models

# YA = T + S + I  : 
#YM= T * S * I  : take log of this
# log(YM) = log(T) + log(S) +log(I)

plot(LogAirPassengers)  #stabilises variation due to multiplication
#looks like additive : no increase of seasonsal component now over years

(m1 = matrix(1:2, nrow=1, byrow = F))
layout(m1)
plot(AirPassengers); plot(LogAirPassengers)  # see again the change


#STL
fit = stl(LogAirPassengers, s.window = 'periodic' )
#Seasonal components constrainted to be same across years : periodic

plot(fit)
fit$time.series  #decompose the data into S, T, R/I 

#december of all months same value for seasonal
#this was after taking log : so take antilog
#toprow = actual data with all series
exp(fit$time.series)

head(exp(fit$time.series),n=20)  # first 20 values see them

# df= exp(fit$time.series)
# names(df) = c('S','T','I')
# head(AirPassengers)
# head(cbind(AirPassengers, df))

#Various Plots - Monthwise, quarter, 
layout(matrix(1,nrow=1))
#Avg of each month
monthplot(AirPassengers) #max traffic in Jun/ Jul across years
monthplot(fit, choice='seasonal') # less in winters, more in summers
monthplot(fit, choice='trend')  #slight increase from Jan to Dec
#trend increasing for each month, highest passengers in Jul
monthplot(fit, choice='remainder') # irregular components

# see combined plots
(m2 = matrix(1:3, nrow=3, byrow = T))
layout(m2)  # change layout of plots
monthplot(fit, choice='seasonal')
monthplot(fit, choice='trend')
monthplot(fit, choice='remainder')


# Practise with different methods - Self Practise

#Decompose another way
AP.decompM = decompose(AirPassengers, type = "multiplicative")
plot(AP.decompM)

library(forecast)
# Forecast # adjust for multiplicative model
fit2b = ets(AirPassengers, model='MAM')
fit2b
(f2b=forecast(fit2b, 12))
head(f2b)$mean

