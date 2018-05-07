#Data Structures
#Vectors----
x1 = 1:50  # vector of numeric values from 1 to 50
x1  # print vector
(x2 = 1:100) # create and print together
x2
x3 = c(3,6,10,5,7)
?c
x3
length(x3)
mean(x3)
max(x3)
min(x3)
(x4 = seq(1,100, 3))
(x5 = rep(10,5))
?rep
str(x5)
(c1 = c('A', 'C', 'D','E','A'))
(c2 = c('Abhishek', 'Sreyan', 'Shubhara', 'Kaustubh', 'Anagha'))
str(c2)
(L1 = c(TRUE, FALSE, TRUE, F, T))
str(L1)
x4;c1;c2;L1
x4[1:10]
mean(x4[1:10])
c2[3]; c2[3:5];c2[c(1,5,2)]
L1[5]
table(c1)
x4
length(x4[x4 > 30 & x4 < 70])  # |
summary(x4)
min(x4); max(x4); mean(x4); median(x4)
#quantiles
quantile(x4)
x4
?rnorm
x5 = rnorm(100, mean=50, sd=10)
x5
plot(density(x5))
quantile(x5)
sort(x5)
#

#Matrix----
#rows x columns
length(50:73)
(m1 = matrix(50:73, nrow=4))  # create matrix no rows =4
(m2 = matrix(50:73, ncol=4, byrow = T))
m1[1,1] ; m1[1,5]; m1[4,6]
m1[,1:2]; m1[,c(2,5)]
m1
m1[1:2,]; m1[c(2,4),]
m1[1:2,1:2]
m1[1,]
rbind(m1[,3], m1[,5])
m1
colSums(m1) # column means
rowSums(m1)
colMeans(m1)
rowMeans(m1)
t(m1)
m1
#Array----
4*3*2 # 4 products - 3 locations - 2 coy : salesqty
salesqty = ceiling(rnorm(24, mean=50, sd=15))
#salesqty2 = as.vector(m1)  #salesqty2
salesqty; length(salesqty)
a1 = array(salesqty, dim=c(4,3,2))
a1
dimnames(a1) = list(c('P1','P2','P3','P4'), c('Delhi','Mumbai','Chennai'), c('coy1','coy2'))
a1
apply(a1, 1, sum) # sum of sales qty Product wise
apply(a1, 2, sum)
apply(a1, 3, sum)
apply(a1, 2, mean)
apply(a1, c(1,3), mean)
#explain this output

#DataFrame----

df1 = data.frame(rollno=c(1,2,3,4,5), name=c('Abhishek', 'Sreyan', 'Shubhara', 'Kaustubh', 'Anagha'))
df1
