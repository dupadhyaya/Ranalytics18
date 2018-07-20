# ROCR

library(ROCR)
data(ROCR.simple)

summary(ROCR.simple)
class(ROCR.simple)
ROCR.simple

pred = prediction(ROCR.simple$predictions, ROCR.simple$labels)
pred
perf = performance(pred, 'tpr', 'fpr')
plot(perf)
