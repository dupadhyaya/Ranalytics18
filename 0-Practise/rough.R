# Rough Work
?cat
?dput
?dget
?dump
?write
?write.table
?save
?detach
?attach
?dir
?ls
?rm
?attr
?attributes

data1 = c(3, 60, 19, 9, 4 , 5)

labels1 = c('Building training sets', 'Cleaning and Organising Data', 'Collecting Data sets', 'Mining data for patterns', 'Refining Algorithms', 'Others')
pie(data1, labels= pielabels)

barplot(data1)
pie(data1,labels=NA,   clockwise=TRUE,
    col=rainbow(6),  border="white",  radius=1.2,
    cex=0.8,  main="Average Time Spent by Data Scientists")
legend("bottomright",legend=pielabels,bty="n", # horiz = T,
       fill=rainbow(6))
barplot(data1, col=rainbow(6), names.arg=pielabels, 
        cex.names = 1, horiz=T, angle=90, 
        main="Average Time Spent by Data Scientists"
)
text(1:6, data1, labels= pielabels)
?barplot



browsers<-read.table("browsers.txt",header=TRUE)
browsers<-data1
browsers
pielabels <- sprintf("%s = %3.1f%s", labels1, browsers, "%")
pielabels
?sprintf
library(RColorBrewer)
pie(browsers,
    labels=NA,
    clockwise=TRUE,
    col=brewer.pal(6,"Set1"),
    border="white",
    radius=1,
    cex=0.8,
    main="Percentage Share of Internet Browser usage")
legend("bottomleft",legend=labels1,bty="n",
       fill=brewer.pal(6,"Set1"))


?strde
states
