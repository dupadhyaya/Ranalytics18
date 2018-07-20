# Association Rule 14
# data set having Gradution, Attendance, Assignment, Unit Test and Univ Result Results
# Aim - to develop Association Rule 
options(digits=2)
edndata = read.csv(file='ar14.csv',header=T, stringsAsFactors = T)

# Check Properties of Data Set 
str(edndata)
dim(edndata)
names(edndata)
# load library
library(arules)
# Find Association Rules with Default Settings
rules = apriori(edndata)
inspect(rules)

# Custom Rules
rules = apriori(edndata, parameter = list(minlen=2,supp=.005,conf=0.8),
                list(rhs=c("result=Poor"),default="lhs"), control=list(verbose=F))
rules.sorted = sort(rules, by="lift")
inspect(rules.sorted)



# Taking data as numerical values and then converting it into categorical values
edndata14b = read.csv(file='ar14b.csv',header=T)
str(edndata14b)
breaks = seq(50,100,by=10)
# Table values of Attendance
attnd.cut = cut(edndata14b$attendance,breaks,right=F)
attnd.freq = table(attnd.cut) ; attnd.freq

edndata14b[edndata14b >= 70] = 'Good'
edndata14b[edndata14b >= 60 & edndata14b < 70 ] = 'Avg'
edndata14b[edndata14b < 60] = 'Poor'
str(edndata14b)
#edndata14b$graduation = factor(edndata14b$graduation) # one column at a time
edndata14b[] <- lapply( edndata14b, factor) # All Colns of DF
str(edndata14b)

rules14b = apriori(edndata14b)
inspect(rules14b)
head(edndata14b)
# Custom Rules result = 'Poor'
arules14b = apriori(edndata14b, parameter = list(minlen=2,supp=.005,conf=0.8),
                list(rhs=c('result=Poor'),default="lhs"), control=list(verbose=F))
<<<<<<< HEAD
arules14b.sorted = sort(arules14b, by="lift")
inspect(arules14b.sorted)
quality(arules14b.sorted)
head(inspect(arules14b.sorted))



# Plotting Rules
# Visualising
library(arulesViz)
plot(arules14b)

plot(arules14b, method="graph", control=list(type="items"))

plot(arules14b, method="paracoord", control=list(reorder=TRUE))
=======
rules.sorted = sort(rules, by="lift")
inspect(rules.sorted)
quality(rules.sorted)
head(inspect(rules.sorted))

>>>>>>> 0b50577bb0f052107564367a2845372e98756506
