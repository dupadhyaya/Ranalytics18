# R to Excel 
# Data Analysis in Excel


rollno = paste('S',1:30,sep='-')
name = paste0('Student',1:30, '- xyz')
name
gender = sample(c('M','F'), size=30, replace=T, prob=c(.7,.3))
course = sample(c('BTech','MTech','Phd'), size=30, prob=c(.5,.3,.2), replace=T)
marks = floor(rnorm(30,mean=50,sd=20))
age = floor(runif(30, 20,40))
married = sample(c(TRUE, FALSE), size=30, replace=T, prob=c(.2, .8))

df = data.frame(rollno, name, gender, age, course, marks, married)
df

#subset the data
sample(nrow(df),3)
df1= df[sample(nrow(df), 3), ]
(df2 = subset(df, age >= 20 & age < 27, select=c(rollno, name)))
(df2b = subset(df, marks >= 55 & marks < 70, select=c(name, marks)))

#dplyr
(df3= sample_n(df, 10))
(df4 = sample_frac(df, .5))

df5= df[ which(gender=='F' | age > 25),]

#Save this data for export
write.csv(df, './data/students3.csv')

library(xlsx)  #rJava also to be installed at this stage

Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jre1.8.0_144")
library(xlsx) #needs rJava
write.xlsx(df, './data/student3.xlsx', sheetName = "IITG1", row.names = F, append=T)
write.xlsx(df2, './data/student3.xlsx', sheetName = "IITG2", row.names = F, append=T)


#Open the xls file in Excel
