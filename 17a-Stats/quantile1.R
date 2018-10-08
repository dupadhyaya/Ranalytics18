# Quantile

set.seed(1234)
x = ceiling(rnorm(100,50,10))
x
#Quartile
quantile(x , c(0.25, 0.5, 0.75))
sort(x)
quantile(x)
IQR(x)
Q1 = quantile(x , 0.25)
(Q2 = quantile(x , 0.5))
Q3 = quantile(x , 0.75)
(iqr = Q3 - Q1)
#Q2 - 46.5

#Decile
quantile(x, seq(.1,1,by=0.1))
#50 = 46.5

#Percentile
quantile(x, seq(.01,1,by=0.01))
# P50 = 46.5

# Summary
summary(x)

fivenum(x)

summary(x)

plot(density(x))
hist(x)
