# xts  - create object and export data

library(xts)

#create matrix : 1 col for 1 share
(stockprices = matrix(c(100,103, 105, 205, 210, 207, 530, 500, 535), ncol=3, byrow = F))
stockprices

(cdtindex = c('25-09-2018', '27-09-2018', '28-09-2018'))

#convert to date format
(dtindex = as.Date(cdtindex, format="%d-%m-%Y"))
#now we have index + matrix for xts object

(ts_xts = xts(x=stockprices, order.by=dtindex))
#this series is not continuous can have missing dates

ts_xts
colnames(ts_xts) = c("SBI", "ICICI", 'HDFC')
ts_xts
#-----
#matrix data extract
coredata(ts_xts)
#extract dates
index(ts_xts)


#write to csv file
write.zoo(ts_xts, "./data/zoodata.csv")