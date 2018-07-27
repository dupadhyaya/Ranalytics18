# Subset
#subset( ) function is the easiest way to select variables and observations.

mtcars
# using subset function 
newdata <- subset(mtcars, mpg >=20 & mpg < 30, 
                  select=c(mpg, disp))
newdata
#we select cars with mpg >= 20   and < 10 
#we keep variables mpg and disp

# using subset function (part 2)
names(mtcars)
head(mtcars)
newdata <- subset(mtcars, cyl == 6 & disp > 150,select=mpg:wt)
newdata




subset(airquality, select = Ozone:Wind)
subset(airquality, Temp > 80, select = c(Ozone, Temp))
subset(airquality, Temp > 80, select = - Temp)

subset(airquality, Month == 8 & Temp > 90) # better
airquality[airquality$Month == 8 & airquality$Temp > 90, ]

