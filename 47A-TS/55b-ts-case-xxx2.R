# Aggregating TS

data = read.csv(file.choose())
str(data)
head(data)
names(data)
nrow(data)
df= data

df$timestamp2 = as.POSIXct(df$timestamp ,origin="1970-01-01")
head(df)

library(zoo)
library(xts)
ts1 = xts(df[1:3], order.by=df$timestamp2)
class(ts1)

ts1

# use dplyr
library(dplyr)
hourly_summary <- df %>% mutate(hour = as.Date(timestamp2, format="%Y-%m-%d %H")) %>% group_by(house_id, household_id) %>% summarise(hoursum=sum(value),hourlsd = sd(value), hourmean=mean(value))

hourly_summary
class(hourly_summary)
df %>% group_by(house_id, household_id, as.Date(timestamp2, format="%Y-%m-%d") )
aggregate(value ~ house_id + household_id, data=df, FUN=sum)

Data$hour <- as.POSIXlt(dates)$hour  # extract hour of the day

