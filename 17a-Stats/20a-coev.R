#Coefficient of Variance
#Measures of dispersion—such as range, variance, standard deviation, and coefficient of variation

sd(mtcars$mpg) / mean(mtcars$mpg)

library(sjstats)
cv(mtcars$mpg)
