#Hitesh Time Series Jul 18
#Hitesh 06 Jul 18

data = read.csv(file.choose())
str(data)
summary(data)
head(data)
range(data$timestamp)
names(data)
nrow(data)
#check for duplicates, select only non-duplicates
data[duplicated(data[c(1,2,3)]),]
subset(data, duplicated(subset(data, select=c(1:3))))  #another method
#No duplicates proceed with data

#Missing Values
anyNA(data)

#make a copy
df= data
#str from time eg
help(strftime)
t = Sys.time()
cat(t,"\n") #1390506463
strftime(t,"%Y-%m-%d %H:%M:%S")
(timeStamp <-  strftime(t,"%Y-%m-%d %H:%M"))
typeof(timeStamp)

# Time from Timestamp
as.POSIXct(1377986400,origin="1970-01-01")
df$timestamp2 = as.POSIXct(df$timestamp ,origin="1970-01-01")

library(lubridate)
library(xts)
names(df)
df.xts = xts(df[1:4], order.by=df$timestamp2)
head(df.xts)

#subset(ts, ts$household_id==1)  #working
apply.daily(df.xts$value,mean)  #daily mean across all household & houseid

#use dplyr
library(dplyr)
hour <- as.POSIXlt(as.POSIXct(df$timestamp ,origin="1970-01-01"))$hour
head(hour,n=100)
head(df);names(df)


hourdf <- df %>%
  group_by(hour=floor_date(timestamp2, "1 hour"), house_id, household_id) %>%
  summarize(sumV=sum(value), meanV = mean(value), sdV = sd(value))

print(tbl_df(hourdf), n=30)
summary(df)
hourdf %>% arrange(hour, house_id, household_id) %>% select(hour, house_id, household_id, sumV,meanV, sdV)  %>% filter(house_id==0) %>% print(n=100)


# Need more ways of grouping and rollmean, rollsd 

ends <- endpoints(df.xts,'hours',2) 
period.apply(df.xts,ends ,sum)


library(TTR)
TTR::rollsd
