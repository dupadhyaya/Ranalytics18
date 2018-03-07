#ggplot
names(df1)
range(df1$Asales1)

#Histogram
ggplot(df1, aes(x = df1$Asales1)) + geom_histogram()

g1= ggplot(df1, aes(x = df1$Asales1))
g2=geom_histogram()
(g1+g2)
g2=geom_bar(color='green')
(g1+g2)

g2=ggplot(df1, aes(y = df1$Asales1, x=Acoy1)) + geom_boxplot(color='blue') 
g2

g2=ggplot(df1, aes(y = df1$Asales1, x=Acoy1)) + geom_violin(color='yellow', fill='green')
g2

g1= ggplot(df1, aes(x = df1$Asales1))
g2=geom_density(color='green')
(g1+g2)

g2=geom_rug(color='green')
(g1+g2)

ggplot_build(g1)$data

x
# Overlay
h1= ggplot(df1, aes(y = df1$Asales1, x=df1$Acoy1))
h2 = geom_boxplot(fill='blue', color='green', notch = T)
h3 = geom_point(position='jitter', color='red', alpha=.5)
h4 = geom_rug(sides="trbl", color='black')
(h1+h2)
(h1+h2+h3)
(h1+h2+h3+h4)
(h1+h3)

#Overlay2
f1 = ggplot(df1, aes(y = df1$Asales1, x=df1$Acoy1))
f2 = geom_violin(fill='lightblue', color='green')
f3 = geom_boxplot(fill='lightgreen', width=.5)
(f1+f2)
(f1+f2+f3)


#Grouping
e1= ggplot(data=df1, aes(x=Asales1, fill=Acoy1))
e2 = geom_density(alpha=.3)
(e1+e2)

names(df1)
d1 = ggplot(data=df1, aes(y=Asales1, x=Asalesman1, color=Acoy1, shape=Aloc1 ))
d2 = geom_point() 
(d1 + d2)

#Grouped Bar
aggregate(df1$Asales1, by=list(Acoy1,Aloc1), FUN=NROW)
(df2= aggregate(Asales1 ~ Acoy1 + Aloc1, FUN=NROW))
c1 = ggplot(data=df1, aes( x=Acoy1, fill=Aloc1)) + geom_bar(position = 'stack') + labs(title='position=stack')
(c1) #stack on top
c2 = ggplot(data=df1, aes(x=Acoy1, fill=Aloc1)) + geom_bar(position = 'dodge') + labs(title='position=dodge/ beside')
(c2) #side

c3 = ggplot(data=df1, aes(x=Acoy1, fill=Aloc1)) + geom_bar(position = 'fill') + labs(title='position=fill')
(c3)  #full


#Faceting
b1 = ggplot(data=df1, aes(x=Asales1))
b1
b2 = geom_histogram(bins=10) 
b3 = facet_wrap(~ Acoy1, nrow=1)
(b1 + b2 + b3)

ggplot(df1, aes(x=Aadv1, y=Asales1, color=Aloc1, shape=factor(Asalesman1))) + geom_point() + facet_grid(.~ Aloc1)

summary(df1)
z1 = ggplot(data=df1, aes(x=Aadv1, fill=Aloc1))
z2 = geom_density()
z3 = facet_wrap(Acoy1 ~ Asalesman1)
(z1+z2)
(z1+z2+z3)

# Smooth Lines
y1 = ggplot(data=df1, aes(x=Aadv1, y=Asales1)) + geom_smooth() + geom_point()
y2 = ggplot(data=df1, aes(x=Aadv1, y=Asales1, linetype=Asalesman1))
(y3 = y2 + geom_smooth() + geom_point())

#axis 
q1 = ggplot(data=df1, aes(x=Acoy1, y=Asales1, fill=Aloc1))
(q2 = q1 + geom_boxplot())

q3x= scale_x_discrete(breaks=c('coy1','coy2','coy3'), labels=c("Company1", "Company2", "Company3"))
q3y= scale_y_continuous(breaks=c(50,60,70,100,150), labels=c("50K", "60K", "70K", "100K", "150K"))
q4 = labs(title="Sales Details of 3 Companies Citywise", x="",y="")
(q2+q3x)
(q2+q3x+q3y)
(q2+q3x+q3y + q4)

#Legends
q4b = labs(title="Sales Details of 3 Companies Citywise", x="",y="", fill=Acoy1)
q5 = theme(legend.position = c(.5,.8))
(q2+q3x+q3y+q4b+q5)

# Scales
r1 = ggplot(data=df1, aes(x=Aadv1, y=Asales1, size=Aadv2))
r2 = geom_point(shape=21, color='red', fill='green')
r3 = labs(x='Adv1 Amount', y="Sales Amount", title="Sales vs Ad1 Amount - Ad2/ Salesman Shape")
(r1+r2+r3)
names(df1)
r1a = ggplot(data=df1, aes(x=Aadv1, y=Asales1, size=Asalesman1)) #discrete
(r1a + r2 + r3)
#warning
ggplot(data=df1, aes(x=Aadv1, y=Asales1, color=Asalesman1)) + scale_color_manual(values=c('red','blue','yellow')) + geom_point(size=2)

ggplot(data=df1, aes(x=Aadv1, y=Asales1, color=Asalesman1)) + scale_color_brewer(palette="Set3") + geom_point(size=3)
#preset colors


#Multiple Graphs

(df3 = aggregate(Asales1 ~ Acoy1, data=df1, FUN=sum))

q4a= ggplot(data=df2, aes(x="", y=Asales1, fill=Acoy1))
q4b = geom_bar(width=1,stat='identity')
(q4a + q4b)
(q4a + coord_polar("y", start=0))

library(gridExtra)
q1= ggplot(data=df1, aes(x=Aadv1)) + geom_bar()
q2= ggplot(data=df1, aes(x=Aadv2)) + geom_bar()
q3= ggplot(data=df1, aes(x=Asales1, y=Aadv1)) + geom_point()
q4= ggplot(data=df2, aes(x="", y=Asales1, fill=Acoy1)) + geom_bar(width=1,stat='identity')

gridExtra::grid.arrange(q1, q2, q3, ncol=3)
gridExtra::grid.arrange(q1, q2, q3, q4, nrow=2, ncol=2)


ggplot(data=df1, aes(x=Aadv1, y=Asales1, linetype=Asalesman1, shape=Acoy1)) + geom_smooth() + geom_point()


#Plot
ggplot(df1, aes(x = df1$Asales1, y=df1$Aadv1)) + geom_point()
y1 = ggplot(df1, aes(y = df1$Asales1, x=df1$Aadv1)) 
y2=  geom_point(size=3, pch=17, color='blue')


ggplot(df1, aes(y = df1$Asales1, x=df1$Aadv1)) + geom_point(size=3, pch=17, color='blue') + facet_grid(Adv2 ~ Acoy1)



p1 <- ggplot(df1, aes(Aadv1, Aadv2)) +
  geom_point(data = df1[df1$Asales1 > 50,]) 
p1

p2 <- ggplot(df1, aes(Aadv1, Aadv2)) +
  geom_point(data = df1[df1$Asales1 > 50,], aes(size=Asales1)) 
p2
names(df1)
p3 <- ggplot(df1, aes(Aadv1, Aadv2)) + geom_point(data = df1[Asalesman1 ==1,]) 
p3

p4 <- ggplot(df1, aes(Aadv1, Aadv2)) +
  geom_point(data = df1[Asales1 > 70,], aes(color=Asalesman1)) 
p4
