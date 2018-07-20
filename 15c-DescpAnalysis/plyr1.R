#Plyr Package


library(plyr)
#make some example data
dd = data.frame(matrix(rnorm(216),72,3), 
                c(rep("A",24),rep("B",24),rep("C",24)),
                c(rep("J",36),rep("K",36)))
colnames(dd) <- c("v1", "v2", "v3", "dim1", "dim2")
dd
head(dd)
aggregate(dd$v1, by=list(dd$dim1, dd$dim2), FUN=mean)
aggregate(v1 ~ dim1 + dim2 , data=dd, FUN=mean)

aggregate(cbind(v1, v2) ~ dim1 + dim2 , data=dd, FUN=mean)

#ddply is the plyr function

plyr::ddply(dd, c("dim1","dim2"), function(df) mean(df$v1))

ddply(dd, c("dim1","dim2"), function(df)c(mean(df$v1), mean(df$v2), mean(df$v3), sd(df$v1), sd(df$v2), sd(df$v3)))




#
set.seed(1)
d <- data.frame(year = rep(2000:2002, each = 3),
                count = round(runif(9, 0, 20)))
print(d)

library(plyr)
ddply(d, "year", function(x) {
  mean.count <- mean(x$count)
  sd.count <- sd(x$count)
  cv <- sd.count/mean.count
  data.frame(cv.count = cv)
})


ddply(d, "year", summarise, mean.count = mean(count)) #mean of years
ddply(d, "year", transform, total.count = sum(count)) # yearwise sum also
d
cumsum(d$count)


ddply(d, "year", mutate, mu = mean(count), sigma = sd(count),
      cv = sigma/mu)

par(mfrow = c(1, 3), mar = c(2, 2, 1, 1), oma = c(3, 3, 0, 0))
d_ply(d, "year", transform, plot(count, main = unique(year), type = "o"))
mtext("count", side = 1, outer = TRUE, line = 1)
mtext("frequency", side = 2, outer = TRUE, line = 1)

#----
baseball.dat <- subset(baseball, year > 2000) # data from the plyr package
head(baseball.dat)
x <- ddply(baseball.dat, c("year", "team"), summarize, homeruns = sum(hr))
head(x)

#http://seananderson.ca/2013/12/01/plyr/


#Speed
system.time(ddply(baseball, "id", summarize, length(year)))
system.time(tapply(baseball$year, baseball$id,function(x) length(x)))

#alternative
library(data.table)
dt <- data.table(baseball, key = "id")
system.time(dt[, length(year), by = list(id)])


#http://philogrammer.com/2016-12-03/aggregte/
library(plyr)
aggregate(price ~ cut, diamonds, each(mean, median))
