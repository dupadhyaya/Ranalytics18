#Artwork - Classification
# Build Decision Tree for predicting and Classification how sale happened


auctiondata2
names(auctiondata2)
keepcols = c('idafn', 'auchouse', 'aucloc', 'awcat', 'lotesthigh', 'lotestlow', 'saleprice','lotstatus') 
df_cls = auctiondata2[keepcols]
summary(df_cls)

library(rpart)
library(rpart.plot)
#model1 Anova
clstree1 = rpart(saleprice ~ awcat + lotesthigh + lotestlow + auchouse, minbucket=5, method='anova', data=df_cls)
#plot(clstree1)
clstree1
rpart.plot(clstree1)
prp(clstree1, type=4, ni=T, fallen.leaves = T, left=T, xflip=F, varlen = 0, faclen=0)


#model2 Anova
clstree2 = rpart(lotstatus ~ awcat + lotesthigh , method='class', data=df_cls, control=rpart(control(cp=.2)))
#plot(clstree)
clstree2
rpart.plot(clstree2)
prp(clstree2, type=1, ni=T, fallen.leaves = T, left=T, xflip=F, varlen = 0, faclen=0)
printcp(clstree2)
