# Frequency Distribution

#Discrete Cat Data
attend = c('A','P','P','A','P','A')
table(attend)
cbind(table(attend))  # A & P on left side

#Discrete Numeric Data

color=c('Blue','Green','Magenta','Green','Black','Blue','Black')
x2 = table(color)
x2
x2a = cbind(x2)
x2a
hist(x2a)  # not relevant 
barplot(x2a)  # not good
barplot(x2a, beside=T)  # Better
unique(color) ; length(unique(color))
barplot(x2a, beside=T, col=rainbow(length(unique(color))))
pie(x2a)

#Continuous Data 
set.seed(1234)
x3 = runif(100,0,150)  # 0 to 150 marks range, 100 values 
x3
x3 = ceiling(x3)
x3
range(x3)
# Divide range into step of 15 ie 10 levels
breaks = seq(0,150,by=15)
breaks
x3[1] = 60
x3[2] = 75
x3.cut = cut(x3, breaks)
x3.cut = cut(x3, breaks, labels=letters[1:10])
x3.cut = cut(x3, breaks, labels=letters[1:length(breaks)])

length(breaks)
x3.cut
?cut
x3a = table(x3.cut)
x3a
x3b = cbind(x3a)
x3b
hist(x3b)
pie(x3b)
barplot(x3b, beside=T)
barplot(x3b, beside=T, names.arg =rownames(x3b))
plot(x3b)
