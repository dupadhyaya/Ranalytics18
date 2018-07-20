#Merge

?merge

df2= merge(mtcars, mtcars)
df2
dim(mtcars)
dim(df2)
df3= merge(mtcars, mtcars, by.x = names(mtcars))
dim(df3)

# merge2

rollno = c(17010,17045,17012,17087,17057,17056,17032,17084,17078,17018,17013)
sname = c('Achal Kumar','Apoorva Karn','Goldie Sahni','Hitesh Mann','Kaustav Chatterjee','Meena Srisha Valavala','Rashmi Ranjan Mangaraj','Shruti Sinha','Shubham Pujan','Vijay Pal Singh','Lalit Sahni')
course =  c('PGDDS','PGDDS','PGDDS','PGDDS','MSCDS','PGDDS','MSCDS','PGDDS','PGDDS','PGDDS','PGDDS')
df1 = data.frame(rollno, sname, course)

gender = c('M','F','M','M','M','F','M','F','M','M','M')
exp =  c(3,3.5,14,5,0,1,1,15,1,3,8) # Experience
hostel =  c(FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,FALSE,FALSE,TRUE,TRUE)
df2 = data.frame(rollno, gender, exp, hostel)
df1; df2
merge(df1,df2)


# Other joins
# DF of marks of subjec1
ID = c(17010,17045,17012,1)
SEX = c('M','F','M','T')
SUB1 = c(50,60, 70,80)
(df3 = data.frame(ID, SEX, SUB1))
merge(df1, df3)  # incorrect
merge(df1, df3, all=F)  

merge(df1, df3, by.x = c('rollno'), by.y=c('ID'))

# use two columns to join
df1$gender = gender
merge(df1, df3, by.x = c('rollno','gender'), by.y=c('ID','SEX'))
df3

merge(df1, df3, by.x = c('rollno'), by.y=c('ID'), all=TRUE)
merge(df1, df3, by.x = c('rollno'), by.y=c('ID'), all=FALSE)
merge(df1, df3, by.x = c('rollno'), by.y=c('ID'), all.x=TRUE)
merge(df1, df3, by.x = c('rollno'), by.y=c('ID'), all.y=TRUE)
