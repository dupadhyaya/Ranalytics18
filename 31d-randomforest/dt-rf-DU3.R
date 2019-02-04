# Random Forests
#https://www.r-bloggers.com/variable-importance-plot-and-variable-selection/

set.seed(1)
n=500
library(clusterGeneration)
library(mnormt)
S=genPositiveDefMat("eigen",dim=15)
S
S=genPositiveDefMat("unifcorrmat",dim=15)
S
X=rmnorm(n,varcov=S$Sigma)
X
library(corrplot)
corrplot(cor(X), order = "hclust")

P=exp(Score)/(1+exp(Score))
P=exp(S)/(1+exp(S))

Y=rbinom(n,size=1,prob=P)
df=data.frame(Y,X)
allX=paste("X",1:ncol(X),sep="")
names(df)=c("Y",allX)
#The variable importance plot is obtained by growing some trees,

require(randomForest)
fit=randomForest(factor(Y)~., data=df)
(VI_F=importance(fit))

