#Sampling
x = 1:3
sample(x)

sample(1:3, size=3, replace=FALSE)  # same as previous line
sample(1:3, size=3, replace=TRUE)  # no may get repeated

# 4 Val
sample(c(1,2,3,4,5,6), size=4, replace=TRUE)

# 10 Values  with ratio of probabilities
sample(1:2, size=10, prob=c(1,3), replace=TRUE)


sample(1:3, size=1000, replace=TRUE, prob=c(.30,.60,.10))
table(sample(1:3, size=1000, replace=TRUE, prob=c(.30,.60,.10)))

barplot(table(sample(1:3, size=1000, replace=TRUE, prob=c(.30,.60,.10))))

