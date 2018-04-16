# Time Series

# Create Time Series data of Finance Sales
sales = c(18, 33, 41, 7, 34, 35, 24, 25, 24, 21, 25, 20,
          22, 31, 40, 29, 25, 21, 22, 54, 31, 25, 26, 35)
length(sales)
#?ts  - help
#No of obsv per unit time
(tsales2a = ts(sales, start=1, end=12)) #only first 12 considered
(tsales2b = ts(sales, start=1, end=6)) #only first 6
(tsales2c = ts(sales, start=1, end=24)) #all 24
(tsales2d = ts(sales, start=1, end=12, frequency = 1))
#(tsales2e = ts(sales, start=1, end=12, frequency = 2))

#Specify data periods in start and end
#specify only start dates & freq
(tsales3a = ts(sales, start=c(2017, 1), frequency=12)) # years 2017 to 2018, 24 values, monthwise
?ts
#Specify start and end date periods
(tsales3b = ts(sales, start=c(2016,4), end=12) ) #error start and end to be of same format
(tsales3b = ts(sales, start=c(2016), end=c(2018))) # default freq=1 once a year 1st 3 values becomes year sales value

(tsales3c = ts(sales, start=c(2016,4), end=c(2018,4), frequency=24)) # period diveded into 24 equal intervals

# Daily Sales Data
sales2 = ceiling(runif(365, 50,100))
sales2
(dailyTSdata <- ts(sales2, start=c(2017,1), frequency=365))
plot(dailyTSdata)
start(dailyTSdata)
end(dailyTSdata)
#Weekly Sales Data  52 weeks in a year
sales3 = ceiling(runif(52, 50,100))
(weeklyTSdata <- ts(sales3, start=c(2017,3), frequency=52))
weeklyTSdata
plot(weeklyTSdata)
start(weeklyTSdata); end(weeklyTSdata) ;frequency(weeklyTSdata)

?ts
#Yearly Sales Data : 2000 to 2017 
seq(1,10,2)
?seq
seq(1,20, along.with = c(1:5))
seq(1,20, along.with = sales)

(values= trunc(seq(1,20, along.with = c(2000:2017))))
(sales4 = floor(rnorm(values, mean=50, sd=10)) ) #pick up length from values
(yearlyTSdata <- ts(sales4, start=c(2000), end=c(2017)))
plot(yearlyTSdata)
start(yearlyTSdata); end(yearlyTSdata) ;frequency(yearlyTSdata)

#diff and lag & window in ts
tsales3c
tsales = tsales3c
tsales
range(tsales)
diff(tsales)
diff(tsales,lag=1)
diff(tsales,lag=2)
cycle(tsales)

tsales
#subset Time Series with range of dates
(tsales.subset = window(tsales, start=c(2003, 5), end=c(2004, 6))) #error due to range period incorrect
tsales
(tsales.subset = window(tsales, start=c(2016, 5), end=c(2016, 8))) 
#5th month of 2016 to 8th month of 2016
#Another TS with different freq



#dataset---- 
#available for TS Analysis - understand them, they are used for TS analysis
AirPassengers  #passengers travel data - seasonal data
plot(AirPassengers)
class(AirPassengers)
JohnsonJohnson  #stock price prediction
nhtemp  # temp variations
Nile  # river level variations
sunspots  #Temp of sun spots variations
ds = list(AirPassengers,JohnsonJohnson,nhtemp,Nile,sunspots)
sapply(ds, class)  # check type of class of each dataset


# Move to doing TS analysis - 
# other packages zoo, xts




