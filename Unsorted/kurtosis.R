#Kurtosis
#describes the tail shape of the data distribution
# The normal distribution has zero kurtosis and 
# thus the standard tail shape. 
# It is said to be mesokurtic. 
# Negative kurtosis would indicate a thin-tailed data distribution, 
# and is said to be platykurtic. 
# Positive kurtosis would indicate a fat-tailed distribution, 
# and is said to be leptokurtic.

set.seed(1234)
(marks = ceiling(rnorm(100,50,20)))
x=marks
library(e1071)                    # load e1071 
hist(x)
plot(density(x))
e1071::kurtosis(x)  # -0.38  -vely Thin Tail




x1= c(2, 5, -1, 3, 4, 5, 0, 2)
kurt(x1)



library(e1071)                    # load e1071 
duration = faithful$eruptions     # eruption durations
plot(density(duration))
kurtosis(duration)                # apply the kurtosis function 
#[1] -1.5116 -ve : thin Tail