#how to rows in 1st DF from column values in 2nd DF

library(gsheet)
library(dplyr)

url1 = 'https://docs.google.com/spreadsheets/d/1_GQ-h4bgdNlIxcAanwRp_ak1u3JoWI-Vx2HKYj4FstA/edit#gid=2077624779'

df1 = data.frame(gsheet2tbl(url1))
head(df1)

url2 = 'https://docs.google.com/spreadsheets/d/1_GQ-h4bgdNlIxcAanwRp_ak1u3JoWI-Vx2HKYj4FstA/edit#gid=943100206'
df2 = data.frame(gsheet2tbl(url2))
head(df2)
names(df1); names(df2)
head(df2)
df2$stock
df1[which(df2$stock %in% df1$stockname), ]
df1

sqldf("select * from df1 where stockname LIKE '%HDFC%'")
sqldf("select stock from df2")

sqldf("select * from df1 where stockname in (select stock from df2)")
sqldf("select * from df1 where stockname like in (select stock from df2)")

df1[(sapply(df1$stockname, grepl, df2$stock) %>% rowSums() %>% as.logical()) * (1:nrow(x)), ]
# not working

library(dplyr)
library(fuzzyjoin)
head(df2)
regex_join(  mutate_if(df1, is.factor, as.character), mutate_if(df2, is.factor, as.character),  by = c("stockname" = "stock") )
#https://stackoverflow.com/questions/45638726/how-to-query-a-dataframe-using-a-column-of-other-dataframe-in-r

#
library(magrittr)  # To use the pipe, "%>%"
df1 %>% data.table::setDT()  # To return the result as a table easily
m2 = df1[(sapply(df2$stock, grepl, df1$stockname) %>% rowSums() %>% as.logical()) * (1:nrow(df1)), ]
as.data.frame(m2)
df2$stock


#-----
library(data.table)
mtcars[rownames(mtcars) %like% "Merc", ]
iris[iris$Species %like% "osa", ]


#------
mtcars[grep("Merc", rownames(mtcars)), ]
iris[grep("osa", iris$Species), ]


#-----
library(stringr)
library(dplyr)

CO2 %>%  filter(str_detect(Treatment, "non"))


#-----
require(sqldf)
df <- data.frame(name = c('bob','robert','peter'),id=c(1,2,3))
df
sqldf("select * from df where name LIKE '%er%'")

