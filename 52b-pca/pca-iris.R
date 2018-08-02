#PCA Iris
# PCA -iris
library(psych)
data(iris)
summary(iris)
str(iris)
df = iris[,1:4]
df
(pc = princomp(df, cor=T, score=T))
summary(pc)
plot(pc)
plot(pc, type='l')
abline(h=1)
biplot(pc)
dim(df)
attributes(pc)
pc$loadings
pc$scores

# Paritition Data 
set.seed(111)
(ind = sample(2, nrow(iris), replace=T, prob = c(0.8, 0.2)))
training = iris[ind==1,]  
dim(training)
testing = iris[ind==2,]
dim(testing)
psych::pairs.panels(training[,-5], gap=0, bg=c('red', 'yellow', 'blue') [ training$Species], pch =21 )

library(psych)
library(caret)
#PCA
(pc = prcomp(training[,-5], center=T, scale.= T))
attributes(pc)
pc$sdevs
pc$center
mean(training$Sepal.Length)
pc$scale
print(pc)
summary(pc)
sd(training$Sepal.Length)

#Orthogonality of PCs
pairs.panels(pc$x, gp=0, bg=c('red', 'yellow', 'blue')[training$Species])

#
#Bi Plot
library(devtools)
#install_github('ggbiplot','vqv', force=T)
library(ggbiplot)
g = ggbiplot(pc, obs.scale = 1, var.scale = 1, groups = training$Species,
      ellipse=T, circle=T, ellipse.prob=0.68 )
g = g + scale_color_discrete(name= '')
g = g + theme(legend.direction ='horizontal', legend.position='top')
print(g)

cor(training[,-5])

#prediction with PC
trg = predict(pc,training)
head(trg)
trg = data.frame(trg, training[5])
head(trg)
tst = predict(pc, testing)
head(tst)
tst = data.frame(tst, testing$Species)
head(tst)


#Multinominal Logistic Regression Model
library(nnet)
trg$Species = relevel(trg$Species, ref='setosa')
head(trg$Species)
mymodel= multinom(Species ~ PC1 + PC2, data = trg)
summary(mymodel)


#Confusion Matrix & Misclassification Error - Traing
p = predict(mymodel, trg)
tab = table(p, trg$Species)
tab

#Confusion Matrix & Misclassification Error - Testing
p = predict(mymodel, tst)
tab = table(p, tst$Species)
tab
