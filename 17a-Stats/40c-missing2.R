# Missing Values

df = read.csv(file='./data/dsstudents2.csv')
df
str(df)
summary(df)
is.na(df)
anyNA(df)
table(is.na(df))
all(is.na(df))
all(is.na(df)==F)
all(is.na(df)==T)
all(is.na(df)==F & is.na(df)==T )
df
complete.cases(df)
!complete.cases(df)
sum(complete.cases(df))
sum(!complete.cases(df))

df[complete.cases(df),][1:2]
mean(df$excel)
mean(df$excel, na.rm=T)
mean(df$excel, na.rm=T, trim=.2)
mean(df$excel, na.rm=T, trim=.4)
cat(df$excel, trim=.2)

df$excel
na.omit(df$excel)
na.omit(df)[1:2]

is.na(df)
colSums(is.na(df))  # apply to numeric M, DF
#there is no colsums  (small S)
apply(df,2, function(x) sum(is.na(x)))
apply(is.na(df), 2, sum)

funModeling::df_status(df,2)
VIM::aggr(df)
Amelia::missmap(df)
length(which(is.na(df['excel']==T)))  # particular col
sum(is.na(df$excel))
mean(df$excel,na.rm=T)
df$excel
df$excel[is.na(df$excel)] = mean(df$excel,na.rm=T)
df$excel
ma


library(mice)
library(purrr)
library(dplyr)
# map_df with purrr
x=purrr::map_df(df, function(x) sum(is.na(x)))
x
x[5:14]

#dplyr::describe(df)
na_count <-sapply(df, 
        function(y) sum(length(which(is.na(y)))))
#should give you a list with the counts for each column.

(na_count <- data.frame(na_count))
