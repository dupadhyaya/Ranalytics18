#apply - VAPPLY

#vapply - When you want to use sapply but perhaps need to squeeze some more speed out of your code.

#For vapply, you basically give R an example of what sort of thing 
#your function will return, which can save some time 
#coercing returned values to fit in a single atomic vector.

(x <- list(a = 1, b = 1:3, c = 10:100))

#Note that since the advantage here is mainly speed, this
# example is only for illustration. We're telling R that
# everything returned by length() should be an integer of 
# length 1. 
vapply(x, FUN = length, FUN.VALUE = 0L) 
#a  b  c  
#1  3 91