# ROC Curve

set.seed(1)
N = 2000
P = .01

rare_success = sample(c(TRUE, FALSE), N, replace=TRUE, prob=c(P,1-P))
table(rare_success)

guess_not = rep(0,N)
table(guess_not)

library(pROC)
plot(roc(rare_success, guess_not), print.auc=T)


simp_roc = function(labels, scores) {
  labels = labels[order(scores, decreasing=T)]
  data.frame(TPR=cumsum(labels)/sum(labels), FPR=cumsum(!labels)/sum(!labels), labels) }

simp_roc = simp_roc(rare_success, guess_not)
simp_roc

with(simp_roc, lines(1-FPR, TPR, col='blue', lty=2))
