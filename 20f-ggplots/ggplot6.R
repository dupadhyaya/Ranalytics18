# GG Plot
#
data(mtcars)
names(mtcars)
hist(mtcars$mpg)

library(ggplot2)
ggplot(mtcars, aes(x = mtcars$mpg)) # nothing
ggplot(mtcars, aes(x = mtcars$mpg)) + geom_histogram()

housing = read.csv('./data/landdata-states.csv')
# Complex
head(housing[,c('Home.Value', 'Date')])
plot(Home.Value ~ Date, data=subset(housing, State='MA'))

points(Home.Value ~ Date, data=subset(housing, State='TX'), col='red')
legend(1975, 400000, c('MA', 'TX'), title='State', col=c('black', 'red'), pch=c(1,1))

ggplot(subset(housing, State %in% c('MA', 'TX')), 
       aes(x=Date, y=Home.Value, color=State)) + geom_point()



help.search("geom_", package = "ggplot2")
geom_
data("airquality")
str(airquality)
str(faithful)
str(sleep)
sleep
AirPassengers
housing
str(housing)
hp2001Q1 = subset(housing, Date == 2001.25)
dim(hp2001Q1)

ggplot(hp2001Q1, aes(y=Structure.Cost, x=Land.Value)) + geom_point()
#Eg1
hp2001Q1 <- subset(housing, Date == 2001.25)
ggplot(hp2001Q1, aes(y = Structure.Cost, x = Land.Value)) +
  geom_point()
ggplot(hp2001Q1, aes(y =Structure.Cost, x = log(Land.Value))) +   geom_point()

#Eg2
ggplot(mtcars, aes(y = mpg, x = wt)) +
  geom_point()

#Eg1
hp2001Q1$pred.SC <- predict(lm(Structure.Cost ~ log(Land.Value), data = hp2001Q1))
p1 <- ggplot(hp2001Q1, aes(x = log(Land.Value), y = Structure.Cost))
p1 + geom_point(aes(color = Home.Value)) +
  geom_line(aes(y = pred.SC))

#Eg1
p1 +
  geom_point( aes(color = Home.Value )) +
  geom_smooth()

#Eg1
p1 +
  geom_text(aes( label=State), size=3)

#Eg2 : ggrepel
library(ggrepel)
p1 +
  geom_point() +
  geom_text_repel( aes(label=State), size=3)

p1 +
  geom_point (aes (size=2),
              color='red')

#Eg
p1 +
  geom_point(aes (color = Home.Value, shape=region))
             
#Eg2 : R in Action @19.2
library(ggplot2)
ggplot(data = mtcars, aes(x=wt, y=mpg)) +
#  geom_point() +
#geom_point(pch=17, col='blue', size=2)
geom_smooth(method='lm', color='red', linetype=2) +
  labs(title = "Automobile Data", x="Weight", y="Miles per Gallon")


#Eg3: RinA : Grouping
mydata=mtcars
mydata$am = factor(mydata$am, levels=c(0,1), labels=c('Automatic', 'Manual'))
mydata$vs = factor(mydata$vs, levels=c(0,1), labels=c('V-Engine', 'Straight Engine'))
levels(mydata$cyl)
mydata$cyl = factor(mydata$cyl)

str(mydata)
ggplot(data=mtcars, aes(x=hp, y=mpg, shape=cyl, col=cyl)) + 
    scale_shape_identity() +
  geom_point(size=1) +
  facet_grid(am~vs) +
  labs(title=' Automobile Data by Engine Type', x ='Horsepower', y='Miles per Gallon')


#Eg4 RiA : Singer
data(singer, package='lattice')
#histogram
ggplot(singer, aes(x =height)) + geom_histogram()
#boxplot
ggplot(singer, aes(x=voice.part, y=height)) + geom_boxplot()

#Eg5a: RiA : Salaries
data(Salaries, package='car')
ggplot(Salaries, aes(x=rank, y=salary)) +
  geom_boxplot( fill='cornflowerblue', color='black', notch=T) +
  geom_point(position='jitter', color='blue', alpha=.5) +
  geom_rug(sides='l', color='black')

#Interpretations
#1- salaries of 3 ranks differ from each other (No overlap in the box plot notches)
#2 variance in salaries increases with greater rank, with larger range of salaries for full professors
# 3 : salaries of 3 professors is so large to make them outlier's (3 black dots)

?singer
head(singer)
table(singer)
str(singer)
data('Salaries', package='car')
str(Salaries)
head(Salaries)
?Salaries




#Eg1
data(Salaries, package='car' )
ggplot( data=Salaries, aes(x=rank, y=salary, fill=sex)) +
  geom_boxplot() +
  scale_x_discrete( breaks=c('AsstProf', 'AssocProf', 'Prof'), labels= c('Assistant \n Professor', 'Associate \n Professor', 'Full \n Professor' )) +
  scale_y_continuous(breaks = c(5000, 10000, 15000, 20000), labels =c('Rs 50K', 'Rs 100k', 'Rs 150K', 'Rs 200K')) +
#  labs(title= 'Faculty Salary by Rank and Sex', x=' Salaries', y=' Ranks')

#Eg1
labs(title= 'Faculty Salary by Rank and Sex', y=' Salaries', x=' Ranks', fill='Gender') +
theme(legend.position =c(.1, .8))
      
ggplot( data=Salaries, aes(x=rank, y=salary, fill=sex)) +
  geom_boxplot() +
  scale_x_discrete( breaks=c('AsstProf', 'AssocProf', 'Prof'), labels= c('Assistant \n Professor', 'Associate \n Professor', 'Full \n Professor' )) +
  scale_y_continuous(breaks = c(5000, 10000, 15000, 20000), labels =c('Rs 50K', 'Rs 100k', 'Rs 150K', 'Rs 200K')) +
  labs(title= 'Faculty Salary by Rank and Sex', y=' Salaries', x=' Ranks', fill='Gender') +
  theme(legend.position =c(.1, .8))



#Eg1a
ggplot(mtcars, aes(x=wt, y=mpg, size=disp)) +
  geom_point(shape=21, color='black', fill='cornsilk') +
  labs(x='Weight', y='Miles per Gallon' , title='Bubble Chart', size='Engine \n Displacement')


Eg1b
data(Salaries, package='car')
ggplot(data=Salaries, aes(x=yrs.since.phd, y = salary, color=rank)) +
  #scale_color_manual(values=c('orange', 'olivedrab', 'navy')) +
  scale_color_brewer(palette='Set1') +       
  geom_point(size=2)
       

mytheme <- theme(plot.title=element_text(face="bold.italic",
                                         size="14", color="brown"),
                 axis.title=element_text(face="bold.italic",
                                         size=10, color="brown"),
                 axis.text=element_text(face="bold", size=9,
                                        color="darkblue"),
                 panel.background=element_rect(fill="white",
                                               color="darkblue"),
                 panel.grid.major.y=element_line(color="grey",
                                                 linetype=1),
                 panel.grid.minor.y=element_line(color="grey",
                                                 linetype=2),
                 panel.grid.minor.x=element_blank(),
                 legend.position="top")

ggplot(Salaries, aes(x=rank, y=salary, fill=sex)) +
  geom_boxplot() +
  labs(title="Salary by Rank and Sex", 
       x="Rank", y="Salary") +
  mytheme

#Eg1
data(Salaries, package="car")
p1 <- ggplot(data=Salaries, aes(x=rank)) +
  geom_bar()
p2 <- ggplot(data=Salaries, aes(x=sex)) +
  geom_bar()
p3 <- ggplot(data=Salaries, aes(x=yrs.since.phd, y=salary)) +
  geom_point()
library(gridExtra)
grid.arrange(p1, p2, p3, ncol=3)


#Eg1
ggplot(data=mtcars, aes(x=mpg)) + geom_histogram()
ggsave(file="mygraph.pdf")



library(playwith)
library(lattice)
playwith(
  xyplot(mpg~wt|factor(cyl)*factor(am),
         data=mtcars, subscripts=TRUE,
         type=c("r", "p"))
)
