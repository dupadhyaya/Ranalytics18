# Data for graphs Plot using Business Data

# Data
set.seed(100)
sales = floor(rnorm(100, 80, 20))

set.seed(101)
coy = sample(c('coy1','coy2','coy3'), size=100, replace=T) 
coy = factor(coy)

set.seed(102)
adtv = ceiling(rnorm(100,10,5))

set.seed(103)
adweb = ceiling(rnorm(100,7,2))

set.seed(104)
loc = sample(c('delhi','noida'), size=100, replace=T) 

set.seed(105)
salesman = factor(sample(c(1,2,3), size=100, replace=T))

set.seed(106)
product = factor(sample(c('TV','Friz','Car'), size=100, replace=T))

df1 = data.frame(coy,sales,adtv,adweb,loc,product,salesman)
head(df1)
str(df1)

save(df1, file='./data/badata.Rdata')

