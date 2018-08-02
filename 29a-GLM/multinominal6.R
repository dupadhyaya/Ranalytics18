# MUltinominal Regression
# Students Selecting a Stream
dept = c('an', 'law', 'ds')
student = c('s',1:50,sep='')
sex = c('M','F')
set.seed(1234)
maths = ceiling(runif(50, 55,95))
set.seed(1234)
stream = sample(dept, 50, replace=T)
set.seed(1234)
gender = sample(sex, 50, replace=T)
admission = data.frame(stream, gender, maths )
admission
aggregate(admission$maths, by=list(stream,gender), mean )
aggregate(admission$maths, by=list(stream,gender), length )
aggregate(admission$maths, by=list(stream), length )
str(admission)
unique(admission$stream)
#base is an
#
library(nnet)
mmodel1 <- multinom( stream ~ gender + maths ,data= admission)
summary (mmodel1) # model summary
