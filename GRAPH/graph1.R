# Plot using Business Data

# Data
set.seed(100)
Asales1 = floor(rnorm(100, 80, 20))

set.seed(101)
Acoy1 = sample(c('coy1','coy2','coy3'), size=100, replace=T) 
Acoy1
Acoy1 = factor(Acoy1)

set.seed(102)
Aadv1 = ceiling(rnorm(100,10,5))

set.seed(103)
Aadv2 = ceiling(rnorm(100,7,2))

set.seed(104)
Aloc1 = sample(c('delhi','noida'), size=100, replace=T) 

set.seed(105)
Asalesman1 = factor(sample(c(1,2,3), size=100, replace=T))


df1 = data.frame(Acoy1, Asales1, Aadv1, Aadv2, Aloc1, Asalesman1)
head(df1)

#scatter Plot
plot(Aadv1, Asales1)
plot(Aadv1, Asales1)

abline(lm(Asales1 ~ Aadv1))

car::scatterplot(Asales1 ~ Aadv1, legend.columns=T)
?car::scatterplot


pairs( ~ Asales1 + Aadv1 + Aadv2, data=df1)


car::scatterplotMatrix(~ Asales1 + Aadv1 + Aadv2, data=df1, spread=F)

#Corrgrams
names(df1)
cor(df1[c('Asales1','Aadv1','Aadv2')])
corrgram::corrgram(df1[c('Asales1','Aadv1','Aadv2')])


#Mosaic Plot
library(vcd)
data(Titanic)
Titanic
vcd::mosaic(Titanic, shade=T, legend=T)
vcd::mosaic( ~ Class + Sex + Age + Suvived, data = Titanic, shade=T, legend=T)
names(Titanic)

mean(Asales1)
plot(Asales1, pch=18)
plot(density(Asales1))
hist(Asales1, bin=10)

plot(x=Aadv1, y=Asales1)
#ggplot(data=df1 + aes(x=df1$Aadv1, y=df1$Acoy1)) + geom_point()
ggplot(data=mtcars + aes(x=wt, y=mpg)) + geom_point()
p1 <- ggplot(df1, aes(Asales1, Aadv1)) +
  geom_point(data = df1[Acoy1 == 'coy1',]) 
p1



qplot(Asales1, geom="histogram", bins=12)
?qplot
ggplot(data=df1) + aes(y=Asales1, x=Aadv1, + geom_point(binwidth=5, colour="black", fill="white") )
df1


               
               
#Histogram
hist(Asales1)
hist(Asales1, freq=F, col=1:12, breaks=12)
?hist
lines(density(Asales1), lwd=2, col='red')

str(df1)
#box plots
boxplot(Asales1)
boxplot(df1$Asales1 ~ df1$Acoy1 + df1$Aloc1)
boxplot(df1$Asales1 ~ df1$Acoy1, varwidth=T, col=1:3)



#Dot Chart
dotchart(df1$Asales1)  #not effective here
dotchart(df1$Asales1, group=df1$Acoy1, color=df1$Acoy1, pch=10:13)  



#add another column and convert to dataframe
names(df1)
head(df1)
aggregate(df1$Asales1, by=list(Acoy1), FUN=mean)
(adf1 = aggregate(formula = Asales1 ~ Acoy1, data=df1, FUN=mean))

pie(adf1$Asales1, label=adf1$Acoy1)
barplot(adf1$Asales1,names.arg=adf1$Acoy1)
abline(h=adf1[adf1$Acoy1=='coy1',]$Asales1)

barplot(adf1$Asales1,names.arg=adf1$Acoy1, horiz = T)
abline(v=adf1[adf1$Acoy1=='coy1',]$Asales1)

barplot(adf1$Asales1,names.arg=adf1$Acoy1, beside=T, legend=rownames(adf1), col=1:3)
abline(v=adf1[adf1$Acoy1=='coy1',]$Asales1)



