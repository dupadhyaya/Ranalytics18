#https://stackoverflow.com/questions/4903092/calculate-auc-in-r


library(data.table)
library(mltools)

actuals <- c(0, 0, 1, 1)
preds <- c(.1, .3, .3, .9)


auc_roc(preds, actuals)  # 0.875

auc_roc(preds, actuals, returnDT=TRUE)
