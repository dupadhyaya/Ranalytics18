#mean3

set.seed(1234)
x = ceiling(runif(100,50,100))  # 100 uniform dist nos
x
mean(x)

#sampling mean
(s1 = sample(x,10))
mean(s1)
?sample

(s2= sample(x,10, replace=T))
mean(s2)

for i in 1:10 {
  
}