#Array -------
set.seed(1234)
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

si = function(principal, time, rate=.10) 
  return(principal * time * rate )
si(1000, 2)
si(1000, 2,.20)

#Count Even Nos
count=0
for (i in c(2,5,3,9,8,11,6)) {
  if (i%%2 == 0) {
    count <<- count + 1
#    print(count)
  }
}
print(count)

x = c(2,5,3,9,8,11,6)
sum(x%%2==0)


data(Arthritis, package='vcd')
summary(Arthritis)
str(Arthritis)
table(Arthritis$Treatment, Arthritis$Improved, Arthritis$Sex)
ftable(Arthritis$Treatment ~ Arthritis$Improved + Arthritis$Sex )
table(Arthritis$Improved)
