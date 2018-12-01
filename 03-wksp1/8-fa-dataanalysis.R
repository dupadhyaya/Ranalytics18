# Finance Stock Analysis
#Stock Download

library(Quandl)
#https://www.quandl.com/account/api 4D8hkYAV4WEkcTmD9LMW

Quandl.api_key("4D8hkYAV4WEkcTmD9LMW")

## Download the data Set
ICICI = Quandl("NSE/ICICIBANK",collapse="daily",start_date="2017-09-01",type="raw")
ICICI
HDFC = Quandl("NSE/HDFCBANK",collapse="daily",start_date="2017-09-01",type="raw")
HDFC
PNB= Quandl("NSE/PNB",collapse="daily",start_date="2017-09-01",type="raw")
SBI=Quandl("NSE/SBIN",collapse="daily",start_date="2017-09-01",type="raw")

## Add another ("Stock") column in Datasets using cbind command
head(ICICI)
## Paste the stock name in stock column

ICICI$Stock = "ICICI"
PNB$Stock = "PNB"
SBI$Stock = "SBI"
SBI

allstocks = rbind(ICICI, PNB, SBI)
str(allstocks)
allstocks$Stock = factor(allstocks$Stock)
str(allstocks)
names(allstocks)
names(allstocks)[c(7,8)] = c('Qty','Turnover')
names(allstocks)


#Using Aggregations
names(allstocks)
dim(allstocks)
aggregate(allstocks$Close, by=list(allstocks$Stock), mean)
aggregate(cbind(Close,  Open) ~ Stock , data= allstocks, mean)
#https://www.statmethods.net/input/dates.html
aggregate(allstocks['Close'], by=list(allstocks$Date), mean)
aggregate(allstocks['Close'], by=list(format(allstocks$Date,"%d")), mean)
aggregate(allstocks['Close'], by=list(format(allstocks$Date,"%b")), mean)
aggregate(allstocks[c(3,7)], by=list(format(allstocks$Date,"%m")), mean)
aggregate(allstocks[c('Close','Open')], by=list(format(allstocks$Date,"%Y")), mean)

#Library to store data in xlsx files
Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jre1.8.0_191")
library(xlsx) #needs rJava

#using Dplyr Package to do Data Manipulation
library(dplyr)
names(allstocks)
#select Columns
(df1 <- allstocks %>% select(Stock, Open, Close))
df1 = as.data.frame(df1)
write.xlsx(df1, './data/iitgfa.xlsx', sheetName = "IITG12", append = T)


#Groupby
allstocks %>% group_by(Stock)  #nothing summarised

#summarise
allstocks %>% summarise(mean(Open), max(High))

allstocks %>% group_by(Stock) %>% summarise_all(mean)
#store this data into DF
(df2 <- allstocks %>% group_by(Stock, format(Date,'%b')) %>% summarise_all(mean) )
write.csv(df2, './data/iitgfa.csv')

#http://www.sthda.com/english/wiki/writing-data-from-r-to-excel-files-xls-xlsx#using-xlsx-package


#write.xlsx(USArrests, file = "myworkbook.xlsx", #check with this file sheetName = "USA-ARRESTS", append = FALSE)
df2 = as.data.frame(df2)
write.xlsx(df2, './data/iitgfa.xlsx', sheetName = "IITG2", append = T)


options(dplyr.print_max = 1e9)  #print all rows
allstocks %>% group_by(Stock, format(Date,'%b')) %>% summarise_all(mean)

allstocks %>% group_by(Stock, format(Date,'%b')) %>% summarise_all(funs(mean, max))

#sample using dplyr
allstocks %>% sample_n(10)

allstocks %>% sample_frac(.05)
allstocks %>% group_by(Stock) %>%   sample_n(2)

allstocks %>% group_by(Stock) %>% tally(Qty) %>%  top_n(1)
allstocks %>% group_by(Stock, format(Date,'%Y')) %>% top_n(2, Turnover)


# Linear Modeling
names(ICICI)
df= cbind(ICICI[2],SBI[2] )
names(df) = c('icici','sbi')
head(df)
plot(df)
fit = lm(icici ~ sbi, data=df)
summary(fit)
new1 = data.frame(sbi=200)
(p1=predict(fit,new=new1, interval='confidence' ))
cbind(new1, p1)
plot(x=df$sbi, y=residuals(fit))  #Linearity
qqnorm(residuals(fit))
qqline(residuals(fit))

library(car)
#Multiple LM
df1 = cbind(ICICI[2],SBI[2],PNB[2] )
names(df1) = c('icici','sbi','pnb')
head(df1)
#No Plots
pairs(df1)
fit1 = lm(icici ~ sbi + pnb, data=df1)
summary(fit1)
summary(fit1)$r.squared
summary(fit1)$adj.r.squared
new2= data.frame(sbi=c(200,300), pnb=c(250,350))
p2=predict(fit1, new=new2, interval='confidence')
cbind(new2, p2)

crPlots(fit1)
vif(fit1)# variance inflation factors 
sqrt(vif(fit1)) > 2 # problem? Use only 1 variable
durbinWatsonTest(fit1)
car::outlierTest(fit1) # Bonferonni p-value for most extreme obs
car::qqPlot(fit1, main="QQ Plot")
library(gvlma)
gvmodel <- gvlma(fit1) 
summary(gvmodel)

av.Plots(fit1)
?car::av.Plots
car::influencePlot(fit1,	id.method="identify", main="Influence Plot", sub="Circle size is proportial to Cook's Distance" )
car::ncvTest(fit1)
car::spreadLevelPlot(fit1)
