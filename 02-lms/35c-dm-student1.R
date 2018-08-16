# Data Manipulation : Academic Data

#Method1 : gsheet
library(gsheet)
url= "https://docs.google.com/spreadsheets/d/1qLHa5qFTyWacta8F-IGo6J3Zpf-BVR9OrlqONuJDqYc/edit#gid=2051155174"
student1 = as.data.frame(gsheet2tbl(url))

#Method2 : read.csv
student2 = read.csv('./data/student1.csv')
names(student2)

#save the imported data object into a new object
student=student1  # or student2
str(student)
names(student)
df1= student
lm(df1$btechmarks ~ df1$attnd, data=df1)

(colnames = names(df1))
#attributes(df1) = NULL
#df1 = as.data.frame(df1)
attributes(df1)
attr(df1, which='spec') = NULL
#names(df1) = colnames
str(df1)
#class of each column
class(df1$gender)
sapply(df1, class)

# convert character to factor
factorcols = c('gender', 'cat', 'class12', 'batch','batchyr', 'br', 'city', 'finalgrade', 'btechfinal')

df1[factorcols] = lapply(df1[factorcols] ,factor)
sapply(df1, class)
str(df1)


# Now do summarisation
#attach(df1)
names(df1)
table(df1$gender)
#combine it in single command 
(l1= lapply(df1[factorcols],factor,ordered=TRUE)) #ordering is not necessary for all
sapply(l1,table)

table(df1$gender)
table(df1$batchyr)
sapply(df1[factorcols],table)


sapply(lapply(df1[factorcols],factor,ordered=TRUE), table)  #Method1


sapply(df1[factorcols], table)   #Method2
sapply(df1[c('gender', 'cat', 'class12')], table)
?lapply
str(df1)
# Numeric Cols
sapply(df1, is.numeric)
(numcols = sapply(df1, is.numeric))
class(numcols)
(numcols = names(df1[numcols]))
#remove rollno
(numcols = numcols[-1])
head(df1[numcols])
colSums(df1[numcols])
colSums(df1[numcols],dims=1)
colMeans(df1[numcols],dims=1)
numcols[c(1,3)]
colMeans(df1[c('age','java', 'cpp')])
names(df1)
colMeans(df1[numcols[c(1:3)]])

names(df1)
#Look for other summarisation and grouping
aggregate(df1[numcols], by=list(df1$br), FUN=mean)
aggregate(cbind(sem1, sem2) ~ br + gender, data=student, FUN=mean)

aggregate(java + cbnst ~ br, data=df1, FUN=mean)  #sum of java & cbnst wrt branch
aggregate( cbnst ~ gender, data=df1, FUN=mean)
aggregate( cbnst ~ gender + br, data=df1, FUN=mean)



#using dplyr package
library(dplyr)

#Top 2 students from each Branch---- 
df1 %>% select(br, sname, btechmarks) %>% group_by(br) %>% arrange(desc(btechmarks)) %>% top_n(n=2)

# Average Fees Paid by Batch Yr----
df1 %>% group_by(batchyr) %>% select(batchyr, feepaid) %>% summarize(mean_fees = mean(feepaid, na.rm = TRUE))

names(df1)
# Avg BTech Marks and Min Marks in Java : Group by Gender, Granch and Final Grade ----
df1 %>% filter(finalgrade == 'A') %>% group_by(gender, br, finalgrade) %>% summarize(btechmks = mean(btechmarks, na.rm = TRUE), javamin = min(java, na.rm = TRUE))

#Count by Gender ----
df1 %>%   group_by(gender) %>%  tally()

#Filter by Final Grade = B : select only few columns ----
df1 %>% filter(finalgrade == 'B') %>% select(rollno, sname, finalgrade)

#sample : select few rows on randowm basis ----
df1 %>% sample_frac(0.2, replace = TRUE)  %>% select(rollno, sname)  # % of Total
df1 %>% sample_frac(0.2, replace = F)  %>% select(rollno, sname) # % of total : replace should be False to have non repeated rows
df1 %>% sample_n(3, replace = F)  %>% select(rollno, sname) # select only 3 rows

#few rows : 10 to 15
slice(df1, 10:15)

library(tidyr) #Reshape
df1long <- df1 %>% select(sname, java, cbnst)
df1long <- df1 %>% select(sname, java, cbnst) %>% tidyr::gather(key = subject, value = marks, java, cbnst) 

head(df1long)
distinct(df1long)

tidyr::unite(df1, 'rollnoname', c(rollno, sname), sep="-") %>% select(1:5)%>% head


# data
str(df1$dob)
as.Date("5-Apr-91", '%d-%b-%y')
df1$dob = as.Date(df1$dob, '%d-%b-%y')
df1 %>% select(sname, dob) %>% tidyr::separate(dob, c("y", "m", "d"))


# Rows
df1 %>% slice(1:n():5)
slice(df1, 1:5)

df1 %>% slice(1:n())
df1 %>% slice(1:10)
slice(df1, n()-10: n())  #different way

names(df1)
#defaults to the last variable in the tbl
df1 %>% group_by(gender) %>% top_n(2)  #Rank not data on last column
# top_n(n = 5, wt = x)
df1 %>% group_by(gender) %>% top_n(2,wt=class10)  #Rank not data wrt class10 marks

df1 %>% top_n(-2, wt=class10) %>% select(rollno, sname, class10, cgpa) #bottom 2 ranks - see 3 values
df1 %>% group_by(gender) %>% tally(java)  #total count
df1 %>% select(finalgrade, btechmarks, sname) %>% top_n(1, btechmarks)

#Selecting Columns
df1 %>% select(1:5)
df1 %>% select(contains('java'))
df1 %>% select(starts_with('btech'))
df1 %>% select(ends_with('s'))
df1 %>% select(everything())
df1 %>% select(finalgrade, everything()) %>% select(1:5) %>% select(-2)
names(df1)


# Summarise
df1 %>% summarise(avgjava = mean(java))
df1 %>% group_by(gender) %>% summarise(avgjava = mean(java),sumcbnst = sum(cbnst))
df1 %>% group_by(br, batch) %>% select(numcols) %>% summarise_each( funs(mean))

df1 %>% group_by(cat, gender) %>% count(class12, finalgrade)




#Summary Functions
v1 = df1$btechmarks
v1
v1 %>% first
v1 %>% last
v1 %>% sd
v1 %>% mean
v1 %>% n_distinct()


# Combine Data Sets

(a=data.frame(x1=c('A','B','C'), x2=c(1,2,3)))
(b=data.frame(x1=c('A','B','D'), x2=c('T','F','T')))

dplyr::left_join(a, b, by = "x1")
#Join matching rows from b to a.

dplyr::right_join(a, b, by = "x1")
#Join matching rows from a to b.

dplyr::inner_join(a, b, by = "x1")
#Join data. Retain only rows in both sets.

dplyr::full_join(a, b, by = "x1")
#Join data. Retain all values, all rows.

dplyr::semi_join(a, b, by = "x1")
#All rows in a that have a match in b.

cbind(a,b)

dplyr::anti_join(a, b, by = "x1")
#All rows in a that do not have a match in b.

#-----
y = data.frame(x1=c('A','B','C'), x2=c(1,2,3))
z = data.frame(x1=c('B','C','D'), x2=c(2,3,4))
cbind(y,z)

dplyr::intersect(y, z)  # B&C
#Rows that appear in both y and z.

dplyr::union(y, z)
#Rows that appear in either or both y and z.

dplyr::setdiff(y, z)
#Rows that appear in y but not z.

#Bind
dplyr::bind_rows(y, z)
#Append z to y as new rows.
dplyr::bind_cols(y, z)
#Append z to y as new columns.
#Caution: matches rows by position


