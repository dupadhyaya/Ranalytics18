#bubble Chart - ggplot

library(ggplot2)
library(data.table)
#http://brooksandrew.github.io/simpleblog/articles/advanced-data-table/#method-1-in-line


DTmtcars = data.table(mtcars)

#this will create new column in the Table
#DTmtcars[, mpg_biased_mean:=mean(mpg)), by=cyl] 
#this will not
DTmtcars[, .(mean_mpg=mean(mpg)), by=cyl] 
#mean mpg and count by cyl
DTmtcars[, .(count=.N, mean_mpg=mean(mpg)), by=cyl] 
#group by cyl and gear and calc count & mean mpg and sort by gear, cyl
DT1 <- DTmtcars[ order(gear,cyl) , .(count=.N, mean_mpg=round(mean(mpg),2)), by=list(gear, cyl)] 
DT1

#simple point with size as count
ggplot(DT1, aes(x=factor(gear), y=factor(cyl), size=count)) + geom_point()
#change the point 
ggplot(DT1, aes(x=factor(gear), y=factor(cyl))) + geom_point(aes(size=count, colour = 'black', fill='cornsilk'))

ggplot(DT1, aes(x=factor(gear), y=factor(cyl))) + geom_point(aes(size=count, alpha=mean_mpg), fill='green', colour = 'black', shape=21) + scale_size_area(name='Mean MPG', max_size = 20, guide=F) + geom_text(aes(y=as.numeric(factor(cyl)) - sqrt(count)/22 , label=count, size=mean_mpg), vjust=1.2) + labs(x='Gear', y='Cylinder', title='Bubble Chart in GGplot') + scale_alpha(guide=F)+  theme(plot.subtitle=element_text(size=12, hjust=0.5, face="italic", color="blue"))-> g
DT1
g = g + labs( subtitle='Using mtcars data set and data.table Nos show the count of Gear & Cyl: See Details in the table \n Density of Colour indicates Mileage Levels, Number Labels and size of Circle indicate the count of Cars in the category of Gear & Cyl ' ) 

#
grid.arrange(tableGrob(DT1), g, ncol=2, widths=c(.2,.8))

grid.arrange( tableGrob(DT1, theme=ttheme_default()), g, ncol = 2, widths = c(.5, 1))

#no legend : + theme(legend.position="none")


#https://flowingdata.com/2010/11/23/how-to-make-bubble-charts/

crime <- read.csv("http://datasets.flowingdata.com/crimeRatesByState2005.tsv", header=TRUE, sep="\t")

symbols(crime$murder, crime$burglary, circles=crime$population)

radius <- sqrt( crime$population/ pi )
symbols(crime$murder, crime$burglary, circles=radius)
symbols(crime$murder, crime$burglary, circles=radius, inches=0.35, fg="white", bg="red", xlab="Murder Rate", ylab="Burglary Rate")

symbols(crime$murder, crime$burglary, circles=radius, inches=0.35, xlab="Murder Rate", ylab="Burglary Rate", fg='red', bg=rgb(255,255,255,50,maxColorValue=255))
symbols(crime$murder, crime$burglary, squares=sqrt(crime$population), inches=0.5)
text(crime$murder, crime$burglary, crime$state, cex=0.5)
?text


library(ggplot2)
qplot(murder, burglary, data = crime, label = state, colour='red', size = 50*population)+ geom_text(colour = "black", hjust=0,vjust=1, size=3)+  xlim(c(0,10))
