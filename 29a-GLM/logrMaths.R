# General Logistic Regression
# Subscribe y ~ age
constant = -26.52
agecoeff = 0.78
age = c(35,36,25,26,45, 46)
(y = constant * 1 + agecoeff * age)
round(y,2)
(p = exp(y) / ((exp(y) + 1)))
round(p,3)
round(diff(p),3)


# Subscribe y ~ age  + woman
# 
constant = -26.46
agecoeff = 0.787
womancoeff = -0.55
age = c(35,36,36,36)
gender = c('F','M','F','M')
woman = c(1,0,1,0)
(y = constant * 1 + agecoeff * age + womancoeff * woman)

round(y,3)
(p = exp(y) / ((exp(y) + 1)))
round(p,3)
round(diff(p),3)
