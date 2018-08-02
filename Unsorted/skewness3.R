#Skewness 3
library(e1071)
data(airquality)
ozone <- airquality$Ozone
ozone <- ozone[!is.na(ozone)]
hist(ozone, col = "tomato")
skewness(ozone)
