# RFM 2

library(didrooRFM)
#part 1
TransNo = c('10','11','12','13')
CustomerID = c('Cust1','Cust2', 'Cust3','Cust2')
DateofPurch = as.Date(c('2010-11-1','2008-3-25','2017-3-25', '2016-3-25'))
Amount = c(1000,500, 600, 700)
customerData = data.frame(TransNo,CustomerID,DateofPurch,Amount)
customerData

rfm1 = findRFM(customerData)
rfm1$FinalScore
rfm1[5:16]
options(dplyr.width = Inf)
rfm1
findRFM(customerData, recencyWeight = 3, frequencyWeight = 12,
        monetoryWeight = 2)
#
#
#
#Part2



data(customerdata)
#customerdat - "TransNo","CustomerID","DateofPurch","Amount"
TransNo = 10001:20000
head(sales1)
customerdata = cbind(TransNo, sales1)
head(customerdata)
str(customerdata)
#customerdat - "TransNo","CustomerID","DateofPurch","Amount"
names(customerdata)
customerdata = customerdata[,c('TransNo','custid', 'sales.dates', 'sales.value')]
head(customerdata)
dim(customerdata)
# Create Customer Data
# 
findRFM(customerdata, recencyWeight = 4, frequencyWeight = 4,
        monetoryWeight = 4)
