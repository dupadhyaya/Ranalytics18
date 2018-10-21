#Clustering Example

#Packages - library(fields)

(income = c(68,72,100))
(customers = data.frame(income))

#which 2 customers are similar
(cm =combn(income, 2))
diff(c(68,72))
(d1= apply(cm, 2, diff))
rbind(cm,d1 )
#C1 & C2 are closer/ similar

#Now use euclidean distance
sqrt((68-72)^2); sqrt((68-100)^2); sqrt((100-72)^2)
fields::rdist(customers)
#Most Similar are 1 and 2 - diff is 4 units

#add one more factor
(age = c(25, 70, 28))
(customers2 = data.frame(income, age))
#which 2 customers are similar
# minus sign will cancel plus values, so use euclidean distance
dist(customers)
#sqrt(sum((x1-x2)^2 + (y1-y2)^2))
sqrt(sum((68 - 72)^2 + (25 - 70) ^2))
rdist(customers2)

#Most Similar now are C1 and C3


#when scales are different is recommended to standardise values
scale(customers2)
customers2
colMeans(customers2)
?scale
x = customers$income

scale1 = function(x) (x - min(x))/ (max(x) - min(x))
scale2 = function(x) (x - mean(x))/ sd(x)
scale1(x)
scale2(x)
scale(x)
rescale(x, to=c(0,1))
rescale(x, to=c(0,100))
apply(customers2, 2, FUN = rescale)
apply(customers, 2, FUN = rescale)


library(BBmisc)
normalize(x, method = "standardize", range = c(0, 1), margin = 1, on.constant = "quiet")
