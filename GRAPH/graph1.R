# Plot using Business Data
#use df1 : load(file='./data/ba.Rdata')
# Data

#scatter Plot
plot(adtv, sales)
plot(x=adtv, y=adweb, pch=10, type='p', col='green')
abline(lm(adweb ~ adtv))

car::scatterplot(sales ~ ., data=df1, legend.columns=T)
car::scatterplot(sales ~ adtv, data=df1, legend.columns=T)

car::scatterplotMatrix(~ sales + adtv + adweb, data=df1)

pairs( ~ sales + adtv + adweb, data=df1)



#Corrgrams
library(corrgram)
names(df1)
cor(df1[c('sales','adtv','adweb')])
corrgram::corrgram(df1[c('sales','adtv','adweb')])
nvars = c('sales', 'adtv', 'adweb')
corrgram::corrgram(df1[nvars], order=T, lower.panel = panel.shade, upper.panel = panel.pie, diag.panel = panel.minmax, text.panel = panel.txt, main='Corrgram Plot')

corrgram::corrgram(df1[nvars], order=T, panel = panel.ellipse, diag.panel = panel.minmax, text.panel = panel.txt, main='Corrgram Plot - Ellipse')
#color - magnitude, direction = +/1, pie- value, min/ max values
corrgram::corrgram(df1[nvars], order=T, lower.panel = panel.pts, upper.panel = panel.conf, diag.panel=panel.density, main='Corrgram Plot - Ellipse')

corrgram::corrgram(df1[nvars], order=T, lower.panel = corrgram::panel.ellipse, upper.panel = panel.bar, diag.panel=panel.minmax, col.regions=colorRampPalette(c('red','blue','green')), main='Corrgram Plot')

corrgram::corrgram(df1[nvars], order=T, upper.panel=panel.cor)


#Mosaic Plot
library(vcd)
data(Titanic)
vcd::mosaic(Titanic, shade=T, legend=T)
names(df1)
XS= structable(~ coy + loc + product + salesman, data=df1)
df3= as.table(XS) ; is.array(XS) 
df3
vcd::mosaic(df3,color='skyblue', shade=T, main="Main", sub='Sub Title', xlab='Product')
vcd::assoc(df3)


# Plots
mean(sales)
plot(sales, pch=18)
plot(density(sales))
hist(sales, bin=10)
library(ggplot2)
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



