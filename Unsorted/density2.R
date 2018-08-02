# Density

set.seed(1234)
x = ceiling(rnorm(100,50,15))
summary(x)
head(x)
hist(x)

write(x, file='./file/sampledata.txt', ncolumns = 1)
# write to a file to copy to execl
# 
hist(x, freq=F)
lines(density(x), lwd=2)


plot(density(x))
rug(x)  # jitters at points
abline(v=x) # vertical lines

#another method
plot(density(x)$x, density(x)$y)
rug(density(x)$x)
density(x)$x
