# summarise
#Summarise multiple values to a single value.

library(dplyr)

summarise(mtcars, mean(disp))
summarise(group_by(mtcars, cyl), mean(disp))
summarise(group_by(mtcars, cyl), m = mean(disp), sd = sd(disp))
