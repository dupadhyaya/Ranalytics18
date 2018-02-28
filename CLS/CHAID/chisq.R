#Chi Square
library(MASS)
str(Cars93)
names(Cars93)
car.data = Cars93[,c('AirBags','Type')]
table(car.data)
car.data.table =table(car.data$AirBags, car.data$Type)
car.data.table
chisq.test(car.data.table)


#---- 2nd Eg
library(MASS)       # load the MASS package 
tbl = table(survey$Smoke, survey$Exer) 
tbl                 # the contingency table 
chisq.test(tbl) 
ctbl = cbind(tbl[,"Freq"], tbl[,"None"] + tbl[,"Some"]) 
ctbl 
chisq.test(ctbl) 
