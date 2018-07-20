# Rattle
#Eg1
loc='http://archive.ics.uci.edu/ml/machine-learning-databases/'
ds = 'pima-indians-diabetes/pima-indians-diabetes.data'
url = paste(loc, ds, sep='')
diabetes = read.table(url, sep=',' , header=F)
names(diabetes) = c('npregant', 'plasma', 'bp', 'triceps', 'insulin', 'bmi', 'pedigree', 'age', 'class')
diabetes$class = factor(diabetes$class, levels = c(0,1) , labels = c('normal', 'diabetic'))
library(rattle)
rattle()

cv = matrix(c(145, 50, 8,27, nrow=2))
cv
performance(as.table(cv))
