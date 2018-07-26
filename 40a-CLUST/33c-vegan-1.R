# Clustering
#http://cc.oulu.fi/~jarioksa/opetus/metodi/sessio3.pdf

library(vegan)  #decostand(df, "hell"), 3)
data(dune)
str(dune)
dim(dune) # 30 speicies, 20 obsvn
summary(dune)
?dune

d = vegdist(dune)
d
#par(mfros=c(1,3))
(csin = hclust(d, method='single'))
plot(csin)
plot(csin, hang=-1)
(ccom = hclust(d, method='complete'))
plot(ccom)
plot(ccom, hang=-1)

caver = hclust(d, method='aver')
plot(caver)
plot(caver, hang=-1)
#
vegemite(dune, caver)
#
plot(csin, hang=-1)
rect.hclust(csin,3)
plot(ccom, hang=-1)
rect.hclust(ccom,3)
plot(caver, hang=-1)
rect.hclust(caver,3)
#
c1 = cutree(ccom,3)
c1
table(c1)

table(c1, cutree(csin,3))
table(c1, cutree(caver,3))
#
ord = cmdscale(d)
ord
ordiplot(ord)

ordihull(ord, c1, lty=3)
ordispider(ord, c1, col='blue', label=T)
ordiellipse(ord, c1, col='red')

ordiplot(ord, dis='si')
ordiplot(ord, cutree(caver, 3))
ordiplot(ord, dis='si')
ordicluster(ord, csin)
#
ordiplot(ord, dis='sites')
ordicluster(ord, caver)
ordiplot(ord, dis='si')
ordicluster(ord, caver, prune=2)

#
#Reordering a Dendrogram
den = as.dendrogram(caver)
x = scores(ord, display ='sites', choices=1)
oden = reorder(den, x)
plot(den)
plot(oden)
vegemite(dune, oden)

tabasco(dune, caver)
tabasco(dune, caver, Rowv=F)
tabasco(dune, oden, Rowv=F)
tabasco(dune, oden, Colv=F)
#
# Minimum Spanning Tree
mst = spantree(d)
ordiplot(ord, dis='si')
lines(mst, ord)
plot(mst, type='t')
#
#Cophenetic Distance
plot(d, cophenetic(csin), asp=1)
abline(0,1)
plot(d, cophenetic(ccom), asp=1)
abline(0,1)
plot(d, cophenetic(caver), asp=1)
abline(0,1)

cor(d, cophenetic(csin))
cor(d, cophenetic(ccom))
cor(d, cophenetic(caver))

#Intepretation of Classes
data(dune.env)
str(dune.env)
c1 = factor(c1)
Moist = with(dune.env, as.numeric(as.character(Moisture)))
with(dune.env, as.numeric(Moisture))
boxplot(Moist ~ c1, notch = T)
anova(lm(Moist ~ c1))
anova( rda(Moist ~ c1))
with(dune.env, table(c1, Management))
#
library(labdsv)
const(dune, c1)
importance(dune, c1)
mod = indval(dune, as.numeric(c1))
names(mod)
mod$maxcls
mod$pval
summary(mod)
summary(mod, type='long')
#
#Optimisd Clustering at Given Level
ckm = kmeans(decostand(dune, 'hell'), 3)
ckm$cluster
ordiplot(ord, dis='si')
ordihull(ord, ckm$cluster, col='red')
# Optimal no of clusters
ccas = cascadeKM(decostand(dune, 'hell'), 2, 15)
plot(ccas, sortq=T)
#
#Fuzzy Clustering
library(cluster)
cfuz = fanny(d, 3, memb.exp = 1.7)
names(cfuz)
ordiplot(ord, dis='si')
ordiplot(ord, dis='si', type='n')
stars(cfuz$membership, locatio=ord, draw.segm=T, add=T, scale=F,len=0.1)
ordihull(ord, cfuz$clustering, col='blue')

#
df = iris[-5]
cluster = kmeans(decostand(df,'hell'), 3)
cluster$cluster
ordiplot(cluster, dis="si")
ordihull(ord, ckm$cluster, col="red")

ccas <- cascadeKM(decostand(df, "hell"), 2, 15)
plot(ccas, sortq=TRUE)
