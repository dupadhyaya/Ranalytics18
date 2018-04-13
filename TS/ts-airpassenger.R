# Time Series Case Study
#https://rpubs.com/emb90/137525
# Data Set - AirPassengers
options(digits=2)
# TS data components : Level + Irregular + Seasonal
#stl(x, s.window, t.window = ) # command to do decomp
stl(AirPassengers, s.window = 'periodic')
#no cyclic here - only seasonal, trend, irregual
#s.window - specifies seasonal effects to be identical across years
#can handle on additive models

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
LogAirPassengers = log(AirPassengers)  # make it additive
# YA = T + S + I  : 
#YM= T * S * I  : take log of this
# log(YM) = log(T) + log(S) +log(I)
plot(LogAirPassengers)  #stabilises variation due to multiplication
#looks like additive
(m1 = matrix(1:2, nrow=1, byrow = F))
layout(m1)
plot(AirPassengers); plot(LogAirPassengers)

#STL
fit = stl(LogAirPassengers, s.window = 'periodic' )
plot(fit)
fit$time.series  #decompose the data into S, T, R/I 
#this was after taking log : so take antilog
#toprow = actual data with all series
head(exp(fit$time.series),n=20)
# df= exp(fit$time.series)
# names(df) = c('S','T','I')
# head(AirPassengers)
# head(cbind(AirPassengers, df))

#Seasonal components constrainted to be same across years if our plot
(m2 = matrix(1:2, nrow=2, byrow = T))
layout(m2)
monthplot(AirPassengers) #Avg of each month
#trend increasing for each month, highest passengers in Jul
seasonplot(AirPassengers)


#Decompose
AP.decompM <- decompose(AirPassengers, type = "multiplicative")
plot(AP.decompM)


# Forecast # adjsut for multiplicative model
fit2b = ets(AirPassengers, model='MAM')
fit2b
(f2b=forecast(fit2b, 12))
head(f2b)$mean

#fit2c = hw(AirPassengers, seasonal='multiplicative')
#head(f2c)$mean
