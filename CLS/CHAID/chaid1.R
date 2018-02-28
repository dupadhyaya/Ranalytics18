#Chaid
library(CHAID)
df = read.csv('./data/bank.csv', sep=';')
head(df)
names(df)
df1 = df[,c('y','marital', 'education')]
table(df1$marital,df1$education)
table(df$housing)
table(df$y)
table(df1$y)
dim(df1)
dt.chaid = CHAID::chaid(y ~ marital + education, data=df1, 
          control = chaid_control(minprob = 0.001,
          minsplit=500, minbucket = 200))
plot(dt.chaid, uniform=T, compress=T, margin=0.2,
     branch=0.3)
text(dt.chaid, use.n=T, digits=3, cex=0.6)
summary(dt.chaid)
attributes(dt.chaid)
dt.chaid$node
dt.chaid$data
dt.chaid$terms
dt.chaid$info
