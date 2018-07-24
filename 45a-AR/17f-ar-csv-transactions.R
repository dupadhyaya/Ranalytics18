# CSV to Transaction Format

data2 = read.csv("./data/dar2.csv")
data2
data2t = as(data2,'transactions')
inspect(data2t)

data3 = read.csv("dar3.csv")
#data3t = as(data3,'transactions')
data3t = read.transactions("dar3a.csv", format = "single", sep = ",")
str(data3t)
head(data3t)
inspect(data3t)
library(datasets)
itemFrequencyPlot(data3t,topN=10,type='absolute')
rules3 = apriori(data3t, parameter=list(minlen=2))
rules3.sorted = sort(rules3, by='lift')
inspect(rules3.sorted)