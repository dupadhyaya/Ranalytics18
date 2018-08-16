#Bar Plot2
#
heights1 = c(5, 5, 4.5, 4, 4, 4, 4.5, 2, 4, 4) # Your data
mydata <- matrix(heights1, ncol = 2, byrow = TRUE,
     dimnames = list(c("Spanish", "English", "Hindi", 
     "Arabic", "Body Lang"), c("Reading/Writing", "Speaking")))
#matrix( ,  , , list(rowname,s colnames))
colors <- c("darkblue", "red") # Define the colors you're using

barplot(t(mydata), beside = TRUE, col = colors, 
        ylim = c(0, 6), axes = FALSE,
        xlab = "Language starting with mostly used",
        main = "Languages (Verbal & Non-verbal)")
axis(2, at = 0:5, labels = 0:5)
legend("topright", colnames(mydata), fill = colors, bty = "n")
legend("topleft", c("reading/Writing", "Speaking"), col=c("darkblue","red"), lwd=10)

#2

##Create data
x = replicate(2, sample(letters[1:2], 100, rep=T))
apply(x, 2, table)

##Create plot
barplot(matrix(c(5, 3, 8, 9), nr=2), beside=TRUE, 
        col=c("aquamarine3", "coral"), 
        names.arg=LETTERS[1:2], 
        ylim=range(0,12))

##Add text at coordinates: x=2, y=6
##Use trial and error to place them 
text(2, 6, "A label")
text(5, 10, "Another label")

#3
tt = structure(c(7L, 13L, 24L, 30L, 30L, 38L, 35L, 45L, 37L, 
    43L, 38L, 59L, 33L, 45L, 37L, 58L), .Dim = c(2L, 8L), 
   .Dimnames = structure(list(param = c("A","B"), 
   xvar = c("5", "6", "7", "8", "9", "10", "11", "12")), 
 .Names = c("param", "xvar")), class = "table")
tt
bb <- barplot(tt, col=c("grey60","grey80"))
text(bb,tt[1,]-4,labels=tt[1,],cex=.8)
text(bb,colSums(tt)-4,labels=tt[2,],cex=0.8)
str(tt)

library(ggplot2)
ggplot(as.data.frame(tt),aes(x=factor(xvar),y=Freq,fill=param)) +
  geom_bar(stat="identity",position="stack")+
  geom_text(aes(label=Freq),position="stack",vjust=1)+
  scale_fill_manual(values=c("grey60","grey80"))+
  theme_bw()


#4
students = c(10,5,15,
             25,20,30,
             12,14,17)
stusummary = matrix(students, byrow=T,ncol=3, 
    dimnames = list(c('DS','ANM', 'LAW'), 
     c('sem1','sem3','sem5') ) )
stusummary
barplot(stusummary)    
barplot(stusummary, beside=T , col=rainbow(nrow(stusummary)) 
        ,legend=rownames(stusummary)) 

#
barplot(stusummary, beside=T , 
    col=rainbow(nrow(stusummary)) )

legend('top', legend=rownames(stusummary), horiz=T,
       fill=rainbow(nrow(stusummary)))

#Invert       
barplot(t(stusummary))
barplot(t(stusummary), beside=T)
barplot(stusummary, beside=T , 
        col=rainbow(nrow(t(stusummary))) )
legend('top', legend=colnames(t(stusummary)), horiz=T,
       fill=rainbow(ncol(t(stusummary))))


#4
max.temp <- c(22, 27, 26, 24, 23, 26, 28)
barplot(max.temp)
# barchart with added parameters

barplot(max.temp,
        main = "Maximum Temperatures in a Week",
        xlab = "Degree Celsius",
        ylab = "Day",
        names.arg = c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"),
        col = "darkred",
        horiz = TRUE)

barplot(max.temp,
        main = "Maximum Temperatures in a Week",
        ylab = "Degree Celsius",
        xlab = "Day",
        names.arg = c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"),
        col = "yellow",
        horiz = F)
?barplot
max.temp2 <- c(20, 25, 20, 27, 33, 22, 28)
temp = matrix(c(max.temp, max.temp2), byrow=F, ncol=2)
colnames(temp) = c('Jan', 'Feb')
temp
barplot(temp, beside=T, xlab='Days', ylab='Degree C', cex.names = 0.6,
  cex.axis = 0.5, ylim=range(0, max(temp)+5),names.arg = rep(c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"),2)
        )
title(main='Avg Day Temp of Month',sub='Jan & Feb')
text(x=c(1:7,9:15)+.5, temp+1, temp, col='red', cex=0.5)
axis(1, at= c(4, 12), pos=-3, labels=c('Jan','Feb') , lwd=0)
?axis
