

#Decision Tree
#(https://rpubs.com/fabiorocha5150/decisiontreemodel)

url='https://raw.githubusercontent.com/fabiorcampos/Bank-Marketing/master/data/bank-full.csv'
data= read.table(url,sep=';', header = T )
head(data)
str(data)
names(data)
df1 = data
df1
str(df1)
hist(df1$age)
hist(df1$balance)
table(df1$marital)
barplot(table(df1$marital), col=1:3, beside=T)
barplot(table(df1$loan), col=1:3, beside=T)
