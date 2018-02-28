# CHAID 2
#http://dni-institute.in/blogs/reading-data-in-r/
  
install.packages("CHAID", repos="http://R-Forge.R-project.org")
library(CHAID)
library(help=CHAID)
termCrosssell1 <- read.csv(file="http://dni-institute.in/blogs/wp-content/uploads/2016/07/termCrosssell.csv")

termCrosssell = termCrosssell1
names(termCrosssell)

table(termCrosssell$housing)
summary(termCrosssell[,c('marital','education', 'y')])
dim(termCrosssell)
?chaid
dt.chaid  <- chaid(y~ marital+education , 
   control = chaid_control(minprob = 0.001,
   minsplit = 500,minbucket = 200), data=termCrosssell)

plot(dt.chaid, 
     uniform = T, 
     compress = T, 
     margin = 0.2, 
     branch = 0.3)
# Label on Decision Tree
text(dt.chaid)
summary(dt.chaid)
print(dt.chaid)
