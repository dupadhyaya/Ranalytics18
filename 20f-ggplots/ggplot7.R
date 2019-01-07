
#ggplot bar

library(ggplot2)

(p1 <- ggplot(mtcars, aes(x=cyl)) + geom_bar())

library(dplyr)
(p2 <- mtcars %>% group_by(cyl) %>% tally %>% ggplot(., aes(x=cyl, y=n)) + geom_bar(stat='identity'))

library(gridExtra)
grid.arrange(p1,p2, ncol=2)


mtcars %>% group_by(cyl) %>% tally %>% ggplot(., aes(x=factor(cyl), y=n)) + geom_bar(stat='identity')  + labs(title="Main Title", x='Cylinders', y='Nos') + coord_flip()

ggplot(mtcars, aes(x=wt, y=mpg, color=cyl)) + geom_point() + geom_smooth()

ggplot(mtcars, aes(x=wt, y=mpg, color=cyl)) + geom_point() + geom_smooth() + theme(legend.position="none") + labs(title="legend.position='none'")  # remove legend


ggplot(mtcars, aes(x=cyl)) + geom_bar(fill='darkgoldenrod2') +
  theme(panel.background = element_rect(fill = 'steelblue'),
        panel.grid.major = element_line(colour = "firebrick", size=2),
        panel.grid.minor = element_line(colour = "blue", size=1))


ggplot(mtcars, aes(x=cyl)) + geom_bar(fill="firebrick") + theme(plot.background=element_rect(fill="steelblue"), plot.margin = unit(c(2, 4, 1, 3), "cm")) # top, right, bottom, left
