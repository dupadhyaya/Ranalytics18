# Missing Values

v1 = c(1,2,NA,NA,5)
is.na(v1)
mean(v1, na.rm=T)
na.omit(v1)
anyNA(v1)
#all
v1[is.na(v1)] = mean(v1, na.rm=T)
v1


#denoted by NA
data(sleep, package='VIM')
head(sleep)
complete.cases(sleep)
sleep[complete.cases(sleep),]
sleep[!complete.cases(sleep),]
sum(is.na(sleep$Dream))
sum(is.na(sleep$Dream))
mean(is.na(sleep$Dream))
mean(!complete.cases(sleep))
sum(is.na(sleep))
colSums(is.na(sleep))
rowSums(is.na(sleep))

#Tabulate
library(mice)
mice::md.pattern(sleep)
#42 rows without any missing values # 2 rows with 1 NA NonD

#Visualisation
VIM::aggr(sleep, prop=F, numbers=T)
#NonD max NA values 
VIM::aggr(sleep, prop=T)
VIM::matrixplot(sleep)
VIM::marginmatrix(sleep)
VIM::marginplot(sleep[c('Gest','Dream')], pch=c(20), col=c("darkgray", "red", "blue"))


#Exploration
x = as.data.frame(abs(is.na(sleep)))
head(sleep, na=5)
head(x, n=5)
y = x[which(apply(x, 2, sum) > 0)]
cor(y)  #Dream - NonD 0.9
cor(sleep, y, use="pairwise.complete.obs")
#ignore NA, 
#

#Listwise Deletion
options(digits=3)
na.omit(sleep)
cor(na.omit(sleep))
cor(sleep, use="complete.obs")

fit = lm(Dream ~ Span + Gest, data= na.omit(sleep))
summary(fit)


#imputations Packages - mice, Amelia, mi : mice, with, pool

imp = mice::mice(sleep, seed=1234)
?mice
