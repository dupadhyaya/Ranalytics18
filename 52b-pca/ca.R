#Correspondence Analysis
#dataset smoke
smoke
data(smoke, package='ca')
library(ca)
smoke
mosaicplot(smoke)
class(smoke)
addmargins(as.matrix(smoke))
addmargins(round(prop.table(as.matrix(smoke)),2))
addmargins(round(prop.table(as.matrix(smoke),margin=2),2),1)
addmargins(round(prop.table(as.matrix(smoke),margin=1),2),2)

ca(smoke)
ca(smoke)$rowcoord
summary(ca(smoke))
summary(ca(smoke, supcol = 1))
plot(ca(smoke))

chisq.test(smoke)

fit1 = ca(smoke)
library(factoextra)
library(FactoMineR)
eig = get_eigenvalue(fit1)
trace = sum(eig$eigenvalue)
cor.coef = sqrt(trace)
cor.coef

fviz_screeplot(fit1)
fviz_screeplot(fit1) + geom_hline(yintercept = 33.33, linetype=2, color='red')


row = get_ca_row(fit1)
row
library(corrplot)
corrplot(row$contrib, is.corr=F)
fviz_contrib(fit1, choice='row', axes=1)
fviz_contrib(fit1, choice='row', axes=2)
fviz_contrib(fit1, choice='row', axes=3)
plot(fit1, map='rowprincipal')
plot(fit1, map='colprincipal')
plot(fit1, mass=T, contrib='absolute', map = 'rowgreen', arrows=c(F,T))

fit2 = mjca(wg93)
fit2
summary(fit2)
