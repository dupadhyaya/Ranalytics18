# CHAID 2
#http://dni-institute.in/blogs/reading-data-in-r/
  
install.packages("CHAID", repos="http://R-Forge.R-project.org")
library(CHAID)
library(help=CHAID)
termCrosssell1 <- read.csv(file="http://dni-institute.in/blogs/wp-content/uploads/2016/07/termCrosssell.csv")

termCrosssell = termCrosssell1
save(termCrosssell,file='madata.Rdata')
names(termCrosssell)

table(termCrosssell$housing)  #multiple classes
summary(termCrosssell[,c('marital','education', 'y')])
dim(termCrosssell)
?chaid
head(termCrosssell[,c('y','marital', 'education')])
ftable(termCrosssell[,c('y','education', 'marital')])

#Chisquare test 
#education to y  or marital to y which is more dependent
(te1= table(termCrosssell[,c('education','y')]))
(tm2= table(termCrosssell[,c('marital','y')]))
#Ho: Xcell  is independent of their education level (No association)
#H1 : There is relationship : Some association
(ce1= chisq.test(t1))
#Ho: Xcell  is independent of their marital level 
(cm2=chisq.test(t2))
ce1$statistic;cm2$statistic
ce1$p.value;cm2$p.value


dt.chaid  <- chaid(y~ marital+education , 
   control = chaid_control(minprob = 0.001,
   minsplit = 500, minbucket = 200), data=termCrosssell)

plot(dt.chaid)

plot(dt.chaid, uniform = T, compress = T, margin = 0.2, branch = 0.3)
# Label on Decision Tree
text(dt.chaid)
summary(dt.chaid)
print(dt.chaid)
