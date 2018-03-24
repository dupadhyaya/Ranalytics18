#CART Plot
#



library(rpart.plot)
tree <- rpart(Kyphosis~., data=kyphosis)
prp(tree, extra=7) # left graph
library(plotmo)
plotmo(tree, type="prob", nresponse="present") # middle graph
# type="prob" is passed to predict()
plotmo(tree, type="prob", nresponse="present", # right graph
       type2="image", ngrid2=200, # type2="image" for an image plot
       pt.col=ifelse(kyphosis$Kyphosis=="present", "red", "lightblue"))
labels(tree)
