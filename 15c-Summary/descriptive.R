#descriptive 

library(mosaic)
favstats (~ mtcars$mpg)
favstats(~ mtcars$mpg, na.rm = TRUE)
