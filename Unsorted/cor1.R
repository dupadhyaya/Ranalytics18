# Covariance  and Correlation
# 
#
#Covariance----

#Correlation----
 
library(Hmisc)
splom(Orange)  # Correlation Plot
with(Orange, cor(age,circumference))
#0.91
#
#Correlation Test ----

cor.test(Orange$age, Orange$circumference)

Hmisc::rcorr(Orange$age, Orange$circumference)
rcorr(as.matrix( mtcars))
