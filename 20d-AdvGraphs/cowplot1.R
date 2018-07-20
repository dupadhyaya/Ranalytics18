# Cow Plot
library(cowplot)

#adding xlim and ylim to align axis.
p1 = qplot(x = 1, y = mpg, data = mtcars, xlab = "", geom = 'boxplot') + 
  coord_flip() +
  ylim(min(mtcars$mpg),max(mtcars$mpg))

p2 = qplot(x = mpg, data = mtcars, geom = 'histogram')+
  xlim(min(mtcars$mpg),max(mtcars$mpg))

#result
plot_grid(p1, p2, labels = c("A", "B"), align = "v",ncol = 1)
