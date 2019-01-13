#bubble chart -using mtcars

#base plot

symbols(mtcars$mpg, mtcars$wt, mtcars$hp, inches=.2, xlab="MPG", ylab="Weight",title=' Bubble Plot using mtcars')
text(mtcars$mpg, mtcars$wt,rownames(mtcars), cex=.5, col=mtcars$vs)
title(main='Bubble Plot using mtcars', sub = 'Size is proportional to hp')

#ggplot - qplot
qplot(x=mpg, y=wt, data = mtcars, label = rownames(mtcars), colour='red', size = hp/2) + geom_text(colour = "black", hjust=0,vjust=1, size=3) + ggtitle('Bubble Plot using qplot', subtitle = 'Size is proportional to hp/2')

#ggplot
p1 <- ggplot(data=mtcars, aes(x=mpg, y=wt)) +  geom_point(aes(size=hp/2), colour = 'green', alpha=.5)
p1
p2 = p1 +  geom_text(aes(x=mpg, y=wt, label=rownames(mtcars)), colour = "black", hjust=0,vjust=1, size=3) 
p2
p3 = p2 + scale_size_area( max_size = 10, guide=F) + scale_alpha(guide=F)
p3
p4 = p3 + labs(x='MPG', y='Weight', title='Bubble Chart in GGplot using MTCARS dataset')  +  theme(plot.subtitle=element_text(size=12, hjust=0.5, face="italic", color="blue"))
p4
p5 = p4 + labs( subtitle='Size of Point is proportional to HP/2' ) 
p5

#Another bubble chart showing count of values
library(dplyr)
mtcars %>% group_by(gear, cyl) %>% summarise(count=n()) -> df1
df1
df1[,1:2] <- lapply(df1[,1:2], as.factor)

str(df1)

g1 <-  ggplot(df1, aes(x=gear, y=cyl) )  + geom_point(aes(size=count), fill='green', colour = 'black', shape=21)
g1
g2 = g1 + scale_size_area(name='Count', max_size = 20, guide=F) 
g2
g3 = g2 + geom_text(aes(y=as.numeric(cyl) - sqrt(count)/20 , label=count, size=count/2), vjust=1.5)
g3
g4= g3 + labs(x='Gear', y='Cylinder', title='Bubble Chart in GGplot') 
g4
g5 = g4 + labs( subtitle='Using mtcars data set and data.table Nos show the count of Gear & Cyl: See Details in the table \n Number Labels and size of Circle indicate the count of Cars in the category of Gear & Cyl ' ) +  theme(plot.subtitle=element_text(size=12, hjust=0.5, face="italic", color="blue"))
g5
g6 = g5 + annotate(geom='text', x=2, y=3.2, label='Max cars with Gears=3 & Cylinder=8', size=4)
g6
g7 = g6 + geom_segment(mapping=aes(x=2, y=3.2, xend=1, yend=3), arrow=arrow(), size=1, colour="blue") 
g7
#
library(gridExtra)
grid.arrange(tableGrob(df1), g7, ncol=2, widths=c(.2,.8))

grid.arrange( tableGrob(DT1, theme=ttheme_default()), g7, ncol = 2, widths = c(.5, 1))


library(sp)

# NOT RUN {
data(meuse)
head(meuse)
coordinates(meuse) <- c("x", "y") # promote to SpatialPointsDataFrame
df2 = df1
coordinates(df2) <- c('x','y')
bubble(df2, "count", maxsize = 2.5, main = "cadmium concentrations (ppm)",   key.entries = 2^(-1:4))
bubble(meuse, "zinc", main = "zinc concentrations (ppm)",
       key.entries =  100 * 2^(0:4))
# }