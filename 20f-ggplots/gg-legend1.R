#ggplot scale

library(ggplot2)
V1<-rnorm(10)
V2<-rnorm(10)
V3<-rnorm(10)
DF<-data.frame(V1,V2,V3)
DF               

ggplot(DF,aes(x=V1,y=V2,size=V3))+
  geom_point(fill='red',shape=21)+
  theme_bw()+
  scale_size(range=c(1,5))+
  theme(legend.justification=c(1,0), legend.position=c(1,0))

#Option 2: Use facet_wrap(...) if you can. This way you only get one legend for the set of plots.

#Option 3: Use color and size, and then hide the size legend altogether.

ggplot(DF,aes(x=V1,y=V2,size=V3, color=V3))+
  geom_point(shape=20)+
  theme_bw()+
  scale_size(range=c(2,10), guide="none")+
#  scale_color_gradient(high="green", low="yellow", guide="none")  
scale_color_gradient(high="#ff0000", low="#ffffcc")  


#-----
library(ggplot2)
basic=ggplot(mtcars, aes(wt, mpg, colour = factor(cyl), shape = factor(vs) )) + geom_point()
basic

basic+labs( colour = "Gp-1 : Type of Eng",   shape = "Gp-2 : Cylinders")

#do not display 1 legend
basic + guides(shape=FALSE)

#1: no legend
basic + theme(legend.position = "none")

#2: around the plot
basic + theme(legend.position = "bottom")

#3: inside the plot
basic + theme(
  legend.position = c(.95, .95),
  legend.justification = c("right", "top"),
  legend.box.just = "right",
  legend.margin = margin(6, 6, 6, 6)
)

# custom box around legend
basic + theme(
  legend.box.background = element_rect(color="red", size=1),
  legend.box.margin = margin(116, 6, 6, 6)
)

# custom the key
basic + theme(legend.key = element_rect(fill = "white", colour = "black"))

# custom the text
basic + theme(legend.text = element_text(size = 8, colour = "red"))

# custom the title
basic + theme(legend.title = element_text(face = "bold"))


#-----
library(ggplot2)
library(grid)
library(gridExtra)
dsamp <- diamonds[sample(nrow(diamonds), 1000), ]
(d <- ggplot(dsamp, aes(carat, price)) +
    geom_point(aes(colour = clarity)) +
    theme(legend.position = c(0.06, 0.75))
)

library(lemon)

reposition_legend(d, 'top left')

#multiple legends
d2 <- d + aes(shape=cut) + 
  theme(legend.box.background = element_rect(fill='#fffafa'),
        legend.background = element_blank())
reposition_legend(d2, 'left')

reposition_legend(d + theme_classic(), 'top left')

reposition_legend(d + theme_bw(), 'top left', x=0.002, y=1-0.002)

reposition_legend(d + theme_bw(), 'top left', offset=0.002)

d2 <- d + facet_grid(.~cut)
gtable_show_names(d2)
reposition_legend(d2, 'top left', panel = 'panel-3-1')
reposition_legend(d + facet_wrap(~cut, ncol=3), 'top left', panel='panel-3-2')

d3 <- d + facet_wrap(~cut, ncol=3) + scale_color_discrete(guide=guide_legend(ncol=3))
reposition_legend(d3, 'center', panel='panel-3-2')
#https://cran.r-project.org/web/packages/lemon/vignettes/legends.html
