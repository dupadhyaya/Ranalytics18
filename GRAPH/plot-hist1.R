# Plotting with Factors

#create a data frame
marks = floor(rnorm(50, 50,10))
gender1 = sample(c('M','F'), 50, replace=T, prob=c(.4,.6))
gender1
gender2 = factor(gender1,ordered=T, level=c('M','F'))
student1 = data.frame(marks, gender1)
student2 = data.frame(marks, gender2)
str(student1)
str(student2)
boxplot(student1)  #marks & gender1
boxplot(marks ~ gender1, data=student1)  # better format
boxplot(student1$marks ~ student1$gender1)

boxplot(marks ~ gender2, data=student2)  # see the order of printing M then F

#add another column
mstatus = sample(c('Married','Single'), 50, replace=T, prob=c(.6,.4))
mstatus = factor(mstatus)
student3 = data.frame(marks, gender2, mstatus)
boxplot( marks ~ gender2 + mstatus, data=student3)

# use ggplot to enhance the graph
hist(student3$marks)
# can we fill with colors for gender or married in histogram
library(ggplot2)
ggplot(student3)  #nothing
names(student3)
?barplot
(t1= table(student3$gender2))
(t2= table(student3$gender2, student3$mstatus))

barplot(height=t1, col=1:2)
barplot(height=t1, col=4:5, horiz=T)
barplot(height=t1, col=6:7, besides=T, horiz=T)

barplot(height=t2, col=3:4)
barplot(height=t2, col=6:9, beside=T)

#set ylim to fit legend
barplot(height=t2, col=6:9, beside=T, ylim=c(0,max(t2) * 1.3))
title(main='Bar Plot of Married and Gender Status', sub='See the distibution')

legend("topright", legend = c("M-Single", "M-Married","F-Single", "F-Married"),   fill = 6:9, horiz = T)


#Using GGplot2
library(ggplot2)

ggplot(students3, aes(x=gender2, fill=mstatus)) + geom_bar(position='stack') + labs(title='Distribution of Gender & Married status')

#dodge postion  . side wise
ggplot(students3, aes(x=gender2, fill=mstatus)) + geom_bar(position='dodge') + labs(title='Distribution of Gender & Married status')

#fill postion  . utilised full column length
ggplot(students3, aes(x=gender2, fill=mstatus)) + geom_bar(position='fill') + labs(title='Distribution of Gender & Married status')
ggplot(students3, aes(x=mstatus, fill=gender2)) + geom_bar(position='fill') + labs(title='Distribution of Gender & Married status')



#Histogram and distribution
#http://ggplot2.tidyverse.org/reference/geom_bar.html

hist(student3$marks)
ggplot(student3, aes(x=marks)) + geom_histogram(bins=15)
g1a = ggplot(student3, aes(x=marks))
g1b = geom_histogram(bins=15)
g1a + g1b


g2a = ggplot(student3, aes(x=marks))
g2b = geom_bar()
g2a + g2b

g2c = geom_bar(aes(fill = gender2))
g2a + g2c

g2d = geom_bar(aes(fill = mstatus))
g2a + g2d

g2e = geom_bar(aes(fill = mstatus)) +  theme(legend.position = "top")
g2a + g2e

g2e = geom_bar(aes(fill = mstatus), position = position_stack(reverse = TRUE)) +  coord_flip() +  theme(legend.position = "top")

 fill=gender2)) + geom_bar(position='stack', binwidth = 1.3) + scale_x_continuous('marks') + scale_y_continuous('Frequency')



data(Salaries, package='car')
Salaries
