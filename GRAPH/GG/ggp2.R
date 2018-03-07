# Graph 1
library(ggplot2)
salesg = sales
ggplot(data = salesg, aes(x=sdate,y=pies)) +
  geom_point() +
  labs( title ='Sales data of Pies', x='Date', y='Sales')

#Stepwise
g1= ggplot(data = salesg, aes(x=sdate,y=pies)) 
g2= g1+ geom_point()
g3= g2 + labs( title ='Sales data of Pies', x='Date', y='Sales')
g3  #run

g1= ggplot(data = salesg, aes(x=sdate,y=pies)) 
g2= geom_point()
g3= labs( title ='Sales data of Pies', x='Date', y='Sales')
g=g1+g2+g3  #run
g


#Part 2
g2b = geom_point(pch=17, color='blue', size=2)
g3b = geom_smooth(method='lm', color='red', linetype=3)
gA = g1 + g2b + g3b
gA

names(salesg)
#Facegrid
f1 = ggplot(salesg, aes(x=sdate, y=pies, shape=daywk, col=daywk))
f2 = geom_point(size=3)
f= f1+f2
f


