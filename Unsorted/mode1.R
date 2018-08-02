#mode1


x = c(2,3,4,4,5,5)
library(modeest)
m =mlv(x,  method = "mfv")
m
getmode(x)

fivenum(x)
