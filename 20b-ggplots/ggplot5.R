
library(ggplot2)
dat<-rnorm(80)
dat<-data.frame(dat)
p<-ggplot(dat, aes(x=dat))+geom_histogram()
p<-p+geom_rug(sides="b", colour="blue")
p


p + geom_rug(sides = "b", aes(y = 0), position = "jitter", colour = "blue")
#using some more obvious data:
  
dat <- c(rep(1, 50), rep(2, 50))
dat <- data.frame(dat)
