#Confusion Matrix
#https://cran.r-project.org/web/packages/heuristica/vignettes/confusion-matrix.html
#
library(heuristica)
lvs <- c("normal", "abnormal")
truth <- factor(rep(lvs, times = c(86, 258)),
                levels = rev(lvs))
pred <- factor(
  c(
    rep(lvs, times = c(54, 32)),
    rep(lvs, times = c(27, 231))),               
  levels = rev(lvs))

xtab <- table(pred, truth)
# load Caret package for computing Confusion matrix
library(caret) 
confusionMatrix(xtab)
