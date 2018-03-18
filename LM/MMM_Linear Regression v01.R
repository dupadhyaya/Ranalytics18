#Set Working Directory
setwd("E:\\HHges - Mkt Anyts\\Marketing Analytics\\Linear Regression - Mkt Mix Modeling")

#Read the data file
DefaultData<-read.csv("./regr/MMM_raw_data_v02.csv")

# Cars Sold analysis

#Check if the data is populated/imported properly
head(DefaultData)
tail(DefaultData)

#Check the summary of the file
summary(DefaultData)

#Generate plot of Dependent variable
plot(DefaultData$Unit_Sold)

#Check the quantile to find out the outlier limit
quantile(DefaultData$Unit_Sold, c(0,0.05,0.1,0.25,0.5,0.75,0.90,0.95,0.99,0.995,1))

#Creating the Capped Losses column with 768 cap
DefaultData$CappedUnitSold<-ifelse(DefaultData$Unit_Sold>768,768,DefaultData$Unit_Sold)

#Check if Capped Losses column has been created properly or not
summary(DefaultData)
names(DefaultData)

#Create new object deleting Losses and S.no.
DefaultData3<-DefaultData[,-c(2)]

#Check the headings of the new object

names(DefaultData3)
head(DefaultData3)

#Generate plots to see the relation between the independent variables and the dependent variable
plot(DefaultData3$Print_Spend,DefaultData3$CappedUnitSold)

plot(DefaultData3$Radio_Spend,DefaultData3$CappedUnitSold)
plot(DefaultData3$TV_Spend,DefaultData3$CappedUnitSold)

names(DefaultData3)


#Install car Package for vif (Multicollinearity)
#install.packages("car")

#Load the car package
library("car")

#Create linear function for vif
vif_data<-lm(CappedUnitSold~
               Print_Spend+
               Radio_Spend+
               TV_Spend+
               Promotion_Dummy,data=DefaultData3)

#Check Vif, vif>2 means presence of multicollinearity
vif(vif_data)

#Run Linear Regression w/o Years_Drv_Exp
lin_r1<-lm(CappedUnitSold~
             Print_Spend+
             Radio_Spend+
             TV_Spend+
             Promotion_Dummy,data=DefaultData3)

#Let's look at the results
summary(lin_r1)

fitted(lin_r1)
summary(lin_r1)$r.squared #R-square Value 


##Generate the diagnostic plots
plot(lin_r1)

meancnt1=DefaultData3
meancnt1$pred = 56.7185191 + 
  0.0098758*DefaultData3$Print_Spend+0.2493764*DefaultData3$Radio_Spend



meancnt1$res = meancnt1$pred - meancnt1$CappedUnitSold
meancnt1$abs_res = abs(meancnt1$res)
meancnt1$mape = 100*meancnt1$abs_res/meancnt1$CappedUnitSold;
meancnt1$mape

# Plot Y-pred vs. Error to ensure there is no pattern
plot(meancnt1$pred,meancnt1$res)

