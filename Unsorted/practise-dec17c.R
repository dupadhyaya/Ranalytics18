# Practise
#create random 10 dates between 01 and 30
#month - jan 
#with random years 1990 and 1994
# save in date of birth column
set.seed(1234)
(day = round(runif(10, 1, 30),0)) 
(month = 'Jan')
(year = sample(x=1990:2000,10,replace=T))  
(dob1= paste(year,month,day,sep='-'))
(dob = as.Date(dob1,'%Y-%b-%d'))
class(dob)  
#vector of student1 to student2 and give sname
(sname = paste('student',1:10, sep=''))
(marks = ceiling(runif(10,50,100)))
#put student1 to student5 to Dept1, rest in Dept2
(dept = rep(c('dept1','dept2'),each=5))
#Every alternate student gender as M or F
(gender = rep(c('M','F'),5))
(df1=data.frame(sname, dept, gender, dob,marks))

#calculate age column as on date; round of the age
(df1$agedays =  Sys.Date() - df1$dob)
(df1$age = round(as.numeric(df1$agedays)/365,0))
#create a column specify Grades A to C as follows
#A  > 80, B : 60-79 and C < 60

df1$grade = ifelse(df1$marks >= 80, 'Pass', 'Fail')
df1
#aggregate data 
aggregate(df1$age, by=list(dept, gender), mean)
#draw a pie graph for grades
pie(table(df1$grade))
#plot age vs marks 
plot(x=age , y=marks, data=df1)
#draw fit line for the plot above
abline(lm(marks ~ age, data=df1))
df1

#Array -------
# Two states hold elections gujrat, hp
# They have 3 parties - bjp, congress, aap
# Each state has 5 districts
# put values between 2 to 5 to each district of state for each party
# on random basis. use set.seed(1234)
(x=round(runif(2*3*5,2,5)))
(elections = array(x, dim=c(5,3,2)))
(state = c('gujrat','hp'))
(party = c('bjp','congress', 'aap'))
(district = paste('D',1:5,sep=''))
(dimnames(elections)= list(district, party, state))
elections

#summarise the elections
#statewise
apply(elections,3, sum)
#partywise
apply(elections,2, sum)
#state and partywise
(t1 = apply(elections,c(2,3), sum))
addmargins(t1,c(1,2),FUN=list(mean, list(sd,sum)))
#prop in each state
prop.table(t1,2)


# Built in Data Set
data("iris")
str(iris)           
dim(iris)
df2 = iris
#introduce NA values at (R,C) - (1,2), (2,4),(2,3),(1,5)
#select 4 random locations between 50 & 100 in Coln 2 using
#sample command and put NA missing values
ml = sample(50:100,4,replace=F) 
df2[ml,2] = NA
#list out the column 1 & 3 of complete cases
colSums(is.na(df2[1:4]))

sum(complete.cases(df2))
sum(!complete.cases(df2))

df2[complete.cases(df2),][c(1:5),c(1,3)]
#replace missing values in column 2 with mean of column1
df2[is.na(df2[2]),2]
mean(df2$Sepal.Length)
df2[is.na(df2[2]),2] = mean(df2$Sepal.Length)
#check if values have been changed
colSums(is.na(df2[1:4]))


#use data set mtcars 
#Find properties of dataset : structure, dimensions
#
data(mtcars)
str(mtcars)
dim(mtcars)
#plot mpg vs wt 
plot(mpg ~ wt, data=mtcars)
#draw abline for above graph
abline(lm(mpg ~ wt, data=mtcars))
#draw histogram of mpg with default settings
hist(mtcars$mpg)
#list out variables names of mtcars
names(mtcars)
#copy mtcars into another data frame df3 and use this for further calc
df3=mtcars
#convert am to factors
df3$am =factor(df3$am)
#aggregate DF by am with mean values of cols 1 to 5
aggregate(df3[1:5], by=list(df3$am), mean)
#list Df rows 25 to 30, and colns 5:8
df3[25:30,5:8]
#list DF with am=0 & cyl=4
df3[df3$am==0 & df3$cyl==4,1:4]
#List the DF in order cyl (increasing) & mpg(decreasing) - only 1st 2 column
df3[order(df3$cyl, -df3$mpg),1:2]


#Eg1: Freq Distribution #faithful - durations
duration = faithful$eruptions
range(duration)
#1.6 5.1
breaks = seq(1.5, 5.5, by=0.5)
breaks
duration.cut = cut(duration, breaks, right=FALSE)
duration.freq = table(duration.cut)
cbind(duration.freq)
#duration.freq  [1.5,2)            51  [2,2.5)            41
hist(duration,labels=T)

#Descriptive 
# Quantile Values fo Temp variable of airqualty Data Set
# 
quantile(airquality$Temp)
