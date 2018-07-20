#aggregate2

?ChickWeight
data = ChickWeight
str(ChickWeight)
dim(data)
unique(data$Chick)
unique(data$Diet)

library(ggplot2)
ggplot(data=data, aes(x=Time, y=weight, group=Chick, colour=Chick)) +
  geom_line() +
  geom_point()
#mean wt depending on diet
aggregate(data$weight, list(diet=data$Diet), mean)

#aggregate on time
aggregate(data$weight, list(time=data$Time), mean)

aggregate(data$weight, list(time=data$Time, diet=data$Diet), mean)

#to see the weights over time across different diets
ggplot(data) + geom_line(aes(x=Time, y=weight, colour=Chick)) +
  facet_wrap(~Diet) +
  guides(col=guide_legend(ncol=3))



#Eg1
values <- data.frame(value = c("a", "a", "a", "a", 
                               "a", "b", "b", "b", "c", 
                               "c", "c", "c"))
nr.of.appearances <- aggregate(x = values, 
    by = list(unique.values = values$value), FUN = length)
nr.of.appearances


#Eg2
dates <- data.frame(date = as.Date("2016-01-01", format = "%Y-%m-%d") + 0:729)
dates
last.day <- aggregate(x = dates["date"], 
                      by = list(month = substr(dates$date, 1, 7)), 
                      FUN = max)
last.day 


options(digits=3)
attach(mtcars)
aggregate(mtcars, by=list(cylinder= cyl,gears = gear), FUN=mean, na.rm=TRUE)

