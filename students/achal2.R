#Achal 2 : String Extract


data = read.csv(file.choose())
data = read.csv('./students/achal1.csv')

data
str(data)
library(stringr)
t = str_match_all(data$Group, "\\bCat_[a-zA-Z0-9_]+\\b")

for (i in 1:nrow(data))
  print(cbind(as.vector(data$User[i]),unlist(t[i]) ))


y  <- NULL
for (i in 1:nrow(data))
{ 
  tmp <- cbind(as.vector(data$User[i]),unlist(t[i]) )
  y <- rbind(y, tmp)
}
y
output = as.data.frame(y)
names(output) = c('User','Group')
output

write.csv(y, './students/achal2.csv', row.names = F)

head(output)
library(dplyr)
output %>% group_by(User) %>% paste(Group)


#2nd part
smatch=  "\\bCat_[a-zA-Z0-9_]+\\b"

data$Group
str_split(data$Group, boundary("word"))
str_split(data$Group, "CN")
x1= str_extract_all(data$Group, boundary("word"))
class(x1)
df2= data.frame(unlist(x1))
class(df2)

# to list
x1= str_extract_all(data$Group, boundary("word"))
x1

#List to DF
library(qdapTools)
list2df(x1)
