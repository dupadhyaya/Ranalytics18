# ROC Curve
#https://rocr.bioinf.mpi-sb.mpg.de

library(ROCR)

pred = prediction(predictions, labels)
perf = performacne(pred, measure='tpr', x.measure='fpr')
plot(perf, col=rainbow(10))
