#my Work
library(arules)
data("AdultUCI")
AdultUCI
str(AdultUCI)
Adult = as(AdultUCI,'transactions')
# error here as some colns are logical or factor
data1 = read.csv(file.choose())
data1
data1a = as(data1,'transactions')
data1a
#trans = read.transactions('data1',format='basket',sep=',')
inspect(data1a)
