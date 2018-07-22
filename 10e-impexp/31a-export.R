#export data

mtcars
write.csv(mtcars, file='./data/mtcars.csv')

#list files
dir('./data')
list.files('./data')

file.exists("./data/mtcars.csv")
file.exists('./data/dhiraj.csv')
df= read.csv('./data/mtcars.csv')
str(df)

#Add arguments at saving
names(mtcars)
head(mtcars)
#Do not create columns for row names
write.csv(mtcars, file='./data/mtcars1.csv', row.names = F)

#help
?write.csv
