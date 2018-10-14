#Missing Values - Visualisation  

library(VIM)
#Visualisation
VIM::aggr(sleep, prop=F, numbers=T)  #Total nos
#NonD max NA values 
VIM::aggr(sleep, prop=T)  # Proportion
VIM::matrixplot(sleep) # rowno and missing values in red
#The continuous variable is rescaled and represented by grayscale colors. Lighter colors indicate lower values and darker colors suggest larger values
names(sleep)
VIM::barMiss(sleep)
VIM::histMiss(sleep[,3:8])
sleep$BodyWgt
#Click in in the left margin to switch to the previous variable or in the right margin to switch to the next variable.
#To regain use of the VIM GUI and the R console, click anywhere else in the graphics window.
VIM::spineMiss(sleep[c('Gest','Dream')])
VIM::marginmatrix(sleep)
VIM::scattmatrixMiss(sleep)
VIM::marginplot(sleep[c('Gest','Dream')], pch=c(20), col=c("darkgray", "red", "blue"))  # finding relationship between NA value



(shadow = as.data.frame(abs(is.na(sleep))))


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
imp
?mice

# explore more
