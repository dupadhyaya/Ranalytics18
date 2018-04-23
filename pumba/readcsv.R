# dplyr

df= read.csv('./data/denco.csv')
df
summary(df)
str(df)
names(df)
aggregate(df$revenue, by=list(df$region), mean)



(course = sample(c('BBA','MBA'), size=30, replace=T, prob=c(.7,.3)))
table(course)
prop.table(table(course))
