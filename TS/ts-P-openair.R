# Package - openair

library(openair)

# load example data from package
data(mydata)
# trend plot for nox
TheilSen(mydata, pollutant = "nox")

timeAverage(mydata)
head(mydata)
print(tbl_df(mydata), n=100)

mydata %>% tbl_df %>% print(n=40)


## daily average values
daily <- timeAverage(mydata, avg.time = "day")
head(daily)
## daily average values ensuring at least 75 % data capture
## i.e. at least 18 valid hours
# NOT RUN {
daily <- timeAverage(mydata, avg.time = "day", data.thresh = 75)
# }
head(daily)
## 2-weekly averages
# NOT RUN {
fortnight <- timeAverage(mydata, avg.time = "2 week")
# }
head(fortnight)

hour <- timeAverage(mydata, avg.time = "hour")
head(hour)


#----
head(df)
df$date = df$timestamp2
hour2 <- timeAverage(df, avg.time = "hour")
head(hour2)
