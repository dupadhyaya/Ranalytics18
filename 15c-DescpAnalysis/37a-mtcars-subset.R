#Subset - mtcars

# Subset
#subset( ) function is the easiest way to select variables and observations.

mtcars
# using subset function 
(newdata = subset(mtcars, mpg >=20 & mpg < 30))
(newdata = subset(mtcars, mpg >=20 & mpg < 30, select=c(mpg, disp)))
(newdata <- subset(mtcars, cyl == 6 & disp > 150,select=mpg:wt))
