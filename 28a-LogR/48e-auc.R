#LR Model Checking
#https://stats.stackexchange.com/questions/132777/what-does-auc-stand-for-and-what-is-it

cls = c('P', 'P', 'N', 'P', 'P', 'P', 'N', 'N', 'P', 'N', 'P','N', 'P', 'N', 'N', 'N', 'P', 'N', 'P', 'N')
table(cls)
score = c(0.9, 0.8, 0.7, 0.6, 0.55, 0.51, 0.49, 0.43, 0.42, 0.39, 0.33, 0.31, 0.23, 0.22, 0.19, 0.15, 0.12, 0.11, 0.04, 0.01)

cbind(cls, score)
pos = score[cls == 'P']
neg = score[cls == 'N']

cbind(cls, score)
set.seed(14)
for( i in 1:100 ){
rnorm(10)
mean(rnorm(10))
print(mean(rnorm(10)))
}

replicate(100, mean(rnorm(10)))
sample(pos, size=1) > sample(neg, size=1)

#create values of True and false such that pos count > neg
p = replicate(50000, sample(pos, size=1) > sample(neg, size=1))
head(p); table(p)
prop.table(table(p))
mean(p)
#True=1, False=0 mean= 0.67926. Quite close, isn't it?



# use ROCR package for drawing ROC curves and calculating AUC.

library('ROCR')

pred = prediction(score, cls)
pred
roc = performance(pred, "tpr", "fpr")
roc

plot(roc, lwd=2, colorize=TRUE)
lines(x=c(0, 1), y=c(0, 1), col="black", lwd=1)

auc = performance(pred, "auc")
auc = unlist(auc@y.values)
auc
