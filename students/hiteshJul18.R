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
data2= subset(data, !duplicated(subset(data, select=c(1:3))))
nrow(data2)
#No duplicates proceed with data
aggregate(data$value, by=list(data$house_id), FUN=mean)
aggregate(data$value, by=list(data$house_id, data$household_id), FUN=mean)
# this is what we dont need

#make a copy
df= data2
#str from time eg
help(strftime)
t = Sys.time()
cat(t,"\n") #1390506463
strftime(t,"%Y-%m-%d %H:%M:%S")
(timeStamp <-  strftime(t,"%Y-%m-%d %H:%M"))
typeof(timeStamp)

# Time from Timstamp
as.POSIXct(1377986400,origin="1970-01-01")
df$timestamp2 = as.POSIXct(df$timestamp ,origin="1970-01-01")
head(df)

library(lubridate)
library(xts)
names(df)
df.xts = xts(df[1:4], order.by=df$timestamp2)
head(df.xts)
#subset(ts, ts$household_id==1)  #working
str(ts)
aggregate(ts$value, by=list(ts$house_id,ts$household_id), FUN=mean)
apply.daily(ts,mean)  #daily mean across all household & houseid
?apply.daily

library(highfrequency)
aggregatets(ts, FUN="previoustick", on="minutes", k=1, weights=NULL,
            dropna=FALSE)

names(ts)
aggregate(ts, by=list(ts$house_id), FUN = sum, sd,
          regular = NULL, frequency = NULL, coredata = TRUE)



# Cumulative average for last 60 min for each household and house id.
# then compare
