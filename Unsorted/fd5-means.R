# Table of Value - Mean Median Mode

# Observation Data  -------------
marks = c(43, 60, 37, 48, 65, 48, 57, 78, 31, 59, 50)
marks1 = scan() 
# copy column of values from Excel 
#and paste & enter after the last value
marks1

mean(marks) # 52.36
median(marks) # 50

estimate_mode <- function(x) {
  d <- density(x)
  d$x[which.max(d$y)]
}
estimate_mode(marks)
#50.89

# Quantile, Percentile, --------
quantile(marks)
sort(marks)
quantile(marks, c(0,.1,.2,.25, .4, .5, .75, .9, 1))
quantile(marks, c(0,.09,.18,.27, .36, .45, .55, .64, .73, .82, .91, 1))
IQR(marks)
quantile(marks, c(.25,.75))
(iqr = quantile(marks, .75) - quantile(marks,.25))

summary(marks)


# Discrete Data

#marks2 = scan()

marks2a =  c(3.5, 4.5, 5.5, 6.5, 7.5,8.5, 9.5)
freq2 = c(3,7,22,60,85,32,8)
cbind(marks2a, freq)  # see how it looks - excel
df2 = data.frame(marks2a, freq2)
df2
df2$marksfreq = df2$marks2a * df2$freq2
df2
sum(df2$marksfreq)
meanmarks2a = sum(df2$marksfreq)/ sum(df2$freq2)
meanmarks2a
midfreq = sum(freq2)/2
df2$cumfreq = cumsum(df2$freq2)
df2
# Median
df2$marks2a[df2$cumfreq > midfreq]  # X which are more than mid value
# use min to select least value
median2 = min(df2$marks2a[df2$cumfreq > midfreq]) # 
median2

#mode
max(df2$freq2)
which(df2$freq2 == max(df2$freq2))  # index No
df2$marks2[5]

mode2 = df2$marks2[ which(df2$freq2 == max(df2$freq2))]
mode2

# real data is not like this - it is observations
#create data from the table given
x2a = rep(marks2a, freq2)
x2a  # total obsverations
table(x2a)
cbind(table(x2a)) # Looks like the orginal table
mean(x2a)
median(x2a)
estimate_mode(x2a)


# Discrete Data - Cat Labels -------------
?scan
#marks2b = scan(what = character())
marks2b =c ("A", "B", "C", "D", "E", "F", "G") 
freq2
x2b = rep(marks2b, freq2)
x2b
table(x2b)
cbind(table(x2b))  # looks similar

mean(x2b) # will not work becoz data is not numeric
# Median  - E
median(x2b) # mid value if arranged in series
length(x2b)
mid = ceiling(length(x2b)/2) 
mid
x2b[mid]
order(x2b)[mid]
x2b[order(x2b)[mid]]

# Mode - max freq

estimate_mode(x2b)  # does not work
density(x2b)  # because u cannot calc density 

#simples 
table(x2b)
rownames(table(x2b))
colnames(table(x2b))  # does not work

max(table(x2b))
mode2b1 = rownames(table(x2b))[which(table(x2b) == max(table(x2b)))]
mode2b1

#Method3
freq <- tapply(x2b,x2b,length)
table(x2b)
names(freq)[which.max(freq)]


# continuous Data

#class = scan(what='character')
class3 =c("0-10","10-20","20-30","30-40","40-50","50-60", "60-70")
class3
#freq3 = scan()
freq3 = c(3,  7, 22, 60, 85, 32,  8)
as.numeric(unlist(strsplit(class3,"-")))  # long method
midx3 = c(5,15,25,35,45,55,65)
cbind(class3, midx3, freq3)  #midx3 is also character
df3 = data.frame(class3, midx3, freq3)
df3
df3$midxfreq = df3$midx3 * df3$freq3
df3

# and so..on like previous eg

# create observation data from contiuous series
x3 = rep(midx3, freq3)
x3
sum(x3)
table(x3)
cbind(table(x3))  # looks like original table

mean(x3)
median(x3)
estimate_mode(x3)
