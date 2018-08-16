# data
str(df1$dob)
as.Date("5-Apr-91", '%d-%b-%y')
df1$dob = as.Date(df1$dob, '%d-%b-%y')
df1 %>% select(sname, dob) %>% tidyr::separate(dob, c("y", "m", "d"))


library(tidyr) #Reshape
df2 = df1
df2$name = rownames(df1)  # col a column which is unique name
head(df2)
df2long <- df2 %>% select(name, cyl, carb) %>% tidyr::gather(key = name, value = name, cyl, carb) 
head(df1long)
distinct(df1long)

tidyr::unite(df1, 'rollnoname', c(rollno, sname), sep="-") %>% select(1:5)%>% head

