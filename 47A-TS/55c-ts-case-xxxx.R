#Analytics Vidya Case
#06 Jul 18


summary(rollmean2)
#ts range : 1377986400 1380578340
rawdata = expand.grid(c(0,1), c(0,1,2), c(1377986400:1380578340))
nrow(rawdata)
value1 = runif(15551646,10,50)
head(value1)

rollmean1 = rollmean(value1,k=60, fill=NA, align='right')
rollsum1 = rollsum(value1,k=60, fill=NA, align='right')
rollsd # not avl
library(TTR)
rollsd1 = runSD(value1,n = 60, sample = FALSE, cumulative = FALSE) 
du1 = cbind(rawdata, value1, rollmean1, rollsd1, rollmean1 + rollsd1)
du2 = cbind(rawdata, value1, rollsd1)
head(du2,n=62)
head(du2)
names(du1) = c('house_id','household_id', 'timestamp', 'value', 'rollmean', 'rollsd', 'checkvalue')
names(du2) = c('house_id','household_id', 'timestamp', 'value','rollsd')

head(du2)
du1$alert = ifelse(du1$value > du1$checkvalue,1,0)
head(du1, n=70)


#Time Series Data
du2ts = xts(du2, order.by= as.POSIXct(du2$timestamp ,origin="1970-01-01"))
du2ts
endpoints(du1ts, on = 'minute') 
endpoints(du1ts, on = 'minute', k=2) 
# Calculate the minute endpoints
ep <- endpoints(du1ts, on = "minute")

# Now calculate the weekly mean and display the results
period.apply(du1[, "value"], INDEX = ep, FUN = mean)
period.apply(du1[, "value"], INDEX = ep, FUN = sd)

rollapply(du1$value, width=60, FUN = sd)
periodicity(du1ts)

du1
#build decision tree
library(rpart)
library(rpart.plot)