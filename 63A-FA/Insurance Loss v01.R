
setwd("E:\\HHges - Mkt Anyts\\BITS Pilani Bussiness Anallytics\\03. Linear Regression")
getwd()

library(dplyr)
library(car)
file.data <- read.csv("InsuranceLosses.csv")

summary(file.data)

set.seed(5)
s1 <- sample(1:nrow(file.data), 0.7*nrow(file.data))
data.train <- file.data[s1,]
data.test <- file.data[-s1,]

head(file.data)
names(file.data)
fit.train <- lm(Losses ~ Age+Years.of.Driving.Experience+
                  Number.of.Vehicles+Gender+
                  as.factor(Married)+Vehicle.Age+                           
                  Fuel_type_D+ 
                  Income   
                , data=data.train[,-c(1)])
library(car)
vif(fit.train)
names(data.train)
fit.train <- lm(Losses ~ Years.of.Driving.Experience+
                  Number.of.Vehicles+Gender+
                  as.factor(Married)+Vehicle.Age+                           
                  Fuel_type_D+ 
                  Income   
                , data=data.train[,-c(1,2)])
vif(fit.train)


summary(fit.train)

fit.final <- lm(Losses ~ 
                Vehicle.Age+                           
                  Fuel_type_D+ 
                  Income   
                , data=data.train[,-c(1)])

summary(fit.final)

fitted(fit.final)
summary(fit.final)$r.squared #R-square Value 



meancnt1=data.test
meancnt1$pred = 
  8.187 + 
  -0.01376*meancnt1$Vehicle.Age+
  0.2405*meancnt1$Fuel_type_D+
  0.01999*meancnt1$Income
  


meancnt1$res = meancnt1$pred - meancnt1$Losses
head(meancnt1)
meancnt1$abs_res = abs(meancnt1$res)
meancnt1$mape = 100*meancnt1$abs_res/meancnt1$Losses
(MAPE_Percentage =mean(meancnt1$mape))

# Plot Y-pred vs. Error to ensure there is no pattern
plot(meancnt1$pred,meancnt1$res)

