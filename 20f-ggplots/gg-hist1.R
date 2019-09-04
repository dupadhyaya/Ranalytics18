

library(ggplot2)
histogram <- ggplot(data=iris, aes(x=Sepal.Width))
histogram + geom_histogram(binwidth=0.2, color="black", aes(fill=Species)) + 
  xlab("Sepal Width") +  ylab("Frequency") + ggtitle("Histogram of Sepal Width")

ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth = 3, aes(fill=factor(cyl)))


library(ggplot2)
density <- ggplot(data=iris, aes(x=Sepal.Width))
density + geom_histogram(binwidth=0.2, color="black", fill="steelblue", aes(y=..density..)) +  geom_density(stat="density", alpha=I(0.2), fill="blue") +
  xlab("Sepal Width") +  ylab("Density") + ggtitle("Histogram & Density Curve")

ggplot(mtcars, aes(x=mpg, fill=factor(cyl))) + geom_histogram(binwidth =5,  aes(y=..density..)) + geom_density(stat="density", alpha=I(.2), fill="blue") 


ggplot(aes(x = price ) , data = diamonds) + 
  geom_histogram(aes(fill=cut), binwidth=1500, colour="grey20", lwd=0.2) +  stat_bin(binwidth=1500, geom="text", colour="white", size=3.5,  aes(label=..count.., group=cut), position=position_stack(vjust=0.5)) +  scale_x_continuous(breaks=seq(0,max(diamonds$price), 1500))

ggplot(data=mtcars, aes(x=mpg)) + geom_histogram(aes(fill=factor(cyl)),binwidth=5, lwd=.5) + stat_bin(binwidth=5, geom="text", colour="black", size=4,  aes(label=..count.., group=factor(cyl)), position=position_stack(vjust=0.5))


ggplot(aes(x = price ), data = diamonds) +   geom_histogram(aes(fill = cut ), binwidth=1500, colour="grey20", lwd=0.2) +  stat_bin(binwidth=1500, geom="text", colour="red", size=3.5, aes(label=..count.., group=cut, y=0.8*(..count..))) +  scale_x_continuous(breaks=seq(0,max(diamonds$price), 1500))


library(ggplot2)
s <- ggplot(mpg, aes(manufacturer, fill = class))
nrow(mpg)
s + geom_bar(position = "stack") +  theme(axis.text.x = element_text(angle=90, vjust=1)) +  geom_text(stat='count', aes(label=..count..), position = position_stack(vjust = 0.5),size=4)

ggplot(mpg, aes(manufacturer, fill=class)) + geom_bar(position='stack') + geom_text(stat='count', aes(label=..count..), position=position_stack(vjust=0.5))+  theme(axis.text.x = element_text(angle=90, vjust=1)) 


ggplot(mtcars, aes(mpg, fill=gear)) + geom_bar(position='stack') + geom_text(stat='count', aes(label=..count..), position=position_stack(vjust=0.5)) +  theme(axis.text.x = element_text(angle=90, vjust=1)) 


ggplot(data=mtcars, aes(mpg, fill=factor(gear))) + geom_histogram(breaks=seq(20,35,3)) + stat_bin(geom='text', aes(label=..count.., y=1*(..count..)), position= position_stack(vjust=0.5), breaks=seq(20,35,3))
