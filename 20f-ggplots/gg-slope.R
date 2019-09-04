#ggplot - Slope Graph

library(ggplot2)
library(scales) #label the points nicely by putting commas in the numbers.

months <-24
year1 <-c(200,175, 190)
year3 <-c(150,100, 90)
group <-c("Group C", "Group B", "Group A")
a <- data.frame(year1,year3,group)
a

#Labels
l11<-paste(a$group,comma_format()(round(a$year1/(3600*24*30.5))),sep="\n")
l13<-paste(a$group,comma_format()(round(a$year3/(3600*24*30.5))),sep="\n")
l11
l13
a

#slope
p <- ggplot(a) + geom_segment(aes(x=0, xend=months, y=year1, yend=year3), size=.75)
p

#blank themes
p<-p + theme(panel.background = element_blank())
p<-p + theme(panel.grid=element_blank())
p<-p + theme(axis.ticks=element_blank())
p<-p + theme(axis.text=element_blank())
p<-p + theme(panel.border=element_blank())
p

#Set the axis labels and limits
p<-p + xlab("") + ylab("Amount Used")
p<-p + theme(axis.title.y=theme_text(vjust=3))
p<-p + xlim((0-12),(months+12))
p<-p + ylim(0,(1.2*(max(a$year3,a$year1))))
p


#Label the slope
p<-p + geom_text(label=l13, y=a$year3, x=rep.int(months,length(a)),hjust=-0.2,size=3.5)
p<-p + geom_text(label=l11, y=a$year1, x=rep.int( 0,length(a)),hjust=1.2,size=3.5)
p

#Label the columns
p<-p + geom_text(label="Year 1", x=0,     y=(1.1*(max(a$year3,a$year1))),hjust= 1.2,size=5)
p<-p + geom_text(label="Year 3", x=months,y=(1.1*(max(a$year3,a$year1))),hjust=-0.1,size=5)
p




#links
#https://rpubs.com/walkerke/slopegraph

