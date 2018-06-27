# Initialise Data
# 

#Roll No
rollno = seq(1,100)
rollno

#Subjects
subjects = data.frame(subid= c('STATS','MATHS','EXCEL', 'RPGM', 'PYTHON'),
            maxmks=c(150,150,100,100,100))
subjects

#Date of Birth - Sequence
dob= seq(as.Date("1994/1/1"), by = "week", length.out = 100)
length(dob)

#Course Names
course = c('BSCDS','MSCDS', 'PGDDS', 'BTCSDA')
course

#Allot Courses to all Students in groups
scourse = rep(x=c('BSCDS','MSCDS', 'PGDDS', 'BTCSDA'), c(20,30,15,35) )
length(scourse)
table(scourse)

#Gender
set.seed(1234)
gender = sample(c('M','F'), size=100, replace=TRUE, prob=c(0.8,0.2))
table(gender)

# Data frame for Master Data
student = data.frame(rollno=rollno, name='XYZ', dob=dob,
        gender= gender, course=scourse, batch=c(2016,2017))
student
str(student)

subscore = data.frame(expand.grid(rollno = student$rollno, 
                    subid = subjects$subid), score=0)
str(subscore)
table(subscore$subid)
length(subscore$rollno) # 100 students x 5 subjects = 500 rows
head(subscore)


#subscore$score[subscore$score >= 0 & subscore$subid %in% c('STATS','MATHS')] = round(rnorm(100, mean=110, sd=10))
subjects$subid
#STATS (110,10), MATHS(100,20), EXCEL(80,15), RPGM(70,12), PYTHON(75,10)
subscore$score[subscore$score >= 0 & subscore$subid == c('STATS') ] =
  round(rnorm(100, mean=110, sd=10))
subscore$score[subscore$score >= 0 & subscore$subid == c('MATHS') ] =
  round(rnorm(100, mean=100, sd=20))
subscore$score[subscore$score >= 0 & subscore$subid == c('EXCEL') ] =
  round(rnorm(100, mean=80, sd=15))
subscore$score[subscore$score >= 0 & subscore$subid == c('RPGM') ] =
  round(rnorm(100, mean=70, sd=12))
subscore$score[subscore$score >= 0 & subscore$subid == c('PYTHON') ] =
  round(rnorm(100, mean=75, sd=10))

summary(subscore)
aggregate(subscore$score, by=list(subscore$subid), mean)
head(subscore,70)


library(reshape2)

dfcast = dcast(subscore, rollno ~ subid) # Good Function
melt(dfcast) # Reverse back to original

total = merge(student, dfcast, by='rollno')
total
options(digits=4)
head(total)
aggregate(total[c(7:11)], by=list(total$course, total$batch), FUN=mean)
aggregate(total[c(7:11)], by=list(total$course), FUN=mean)
aggregate(total[c(7:11)], by=list(total$batch), FUN=mean)
aggregate(total[c(7:11)], by=list(total$gender), FUN=mean)
str(total)
library(lubridate)
total$age = as.period(interval(total$dob, Sys.Date()), unit='year')$year
str(total)
aggregate(total[c(7:11)], by=list(total$age), FUN=mean)
write.csv(total, file='studentdata.csv', row.names = F)
?write.csv
# Clustering
# 
# 
mydata = total

library(ggplot2)
ggplot(mydata, aes(STATS, RPGM, color=gender)) + geom_point()
set.seed(20)
sdataCluster <- kmeans(mydata[, 7:11], 5, nstart = 20)
sdataCluster      
sdata$cluster = sdataCluster$cluster
head(sdata[c(1,7:13)])

str(mydata)
mydata2 = mydata[-c(1:6)]
str(mydata2)
# Prepare Data
mydata2 <- na.omit(mydata2) # listwise deletion of missing
head(mydata2)
mydata3 <- scale(mydata2) # standardize variables
head(mydata3)
mydata = mydata3

# No of Clusters
# Determine number of clusters
wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))
for (i in 2:15) wss[i] <- sum(kmeans(mydata, 
                                     centers=i)$withinss)
plot(1:15, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares")

# K-Means Cluster Analysis
fit <- kmeans(mydata, 7) # 7 cluster solution
# get cluster means 
aggregate(mydata,by=list(fit$cluster),FUN=mean)
# append cluster assignment
mydata <- data.frame(mydata, fit$cluster)
head(mydata)



# Ward Hierarchical Clustering
d <- dist(mydata, method = "euclidean") # distance matrix
fit <- hclust(d, method="ward.D") 
plot(fit) # display dendogram
groups <- cutree(fit, k=7) # cut tree into 5 clusters
# draw dendogram with red borders around the 5 clusters 
rect.hclust(fit, k=7, border="red")
head(mydata)
