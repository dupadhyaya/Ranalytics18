#bar plot in ggplot2
#mtcars

library(ggplot2)
library(dplyr)
mtcars %>% ggplot(., aes(x=factor(gear))) + geom_bar()

mtcars %>% ggplot(., aes(x=factor(gear))) + geom_bar(aes(fill=factor(cyl))) 


mtcars %>% ggplot(., aes(x=factor(gear))) + geom_bar(aes(fill=factor(cyl)))

mtcars %>% ggplot(., aes(x=factor(gear))) + geom_bar(aes(fill=factor(cyl)), position='dodge')

mtcars %>% ggplot(., aes(x=factor(gear))) + geom_bar(aes(fill=factor(cyl)), position = position_stack(reverse = TRUE))

mtcars %>% ggplot(., aes(x=factor(gear))) + geom_bar(aes(fill=factor(cyl)), position = position_stack(reverse = TRUE)) + coord_flip() +  theme(legend.position = "top")

mtcars %>% group_by(gear) %>% count() %>% ggplot(., aes(x=gear, y=n)) + geom_bar(stat='identity')
        
mtcars %>% group_by(gear) %>% count() %>% ggplot(., aes(x=gear, y=n)) + geom_bar(stat='identity', aes(fill=gear)) + geom_text(aes(label = n), vjust = -0.3)  

library(ggpubr)
mtcars %>% group_by(gear) %>% count() %>% ggplot(., aes(x=gear, y=n)) + geom_bar(stat='identity', aes(fill=factor(gear))) + geom_text(aes(label = n), vjust = -0.3) + theme_pubclean()                             


ggplot(data=mtcars, aes(x=factor(gear), fill=factor(cyl))) +  geom_bar(aes(y = (..count..)/sum(..count..)))

ggplot(data=mtcars, aes(x=factor(gear))) + geom_bar(aes(y = ..prop.., group = 1, fill=factor(gear)))

ggplot(data=mtcars, aes(x=factor(gear))) + geom_bar(aes(y = ..prop.., group = 1, fill=factor(gear))) + facet_wrap(~cyl)

#not correctly drawn.  use proportions
mtcars %>% group_by(gear) %>% count() %>% ggplot(., aes(x=gear, y=n, fill=factor(gear))) + geom_bar(stat='identity') + geom_text(aes(label = n), vjust = -0.3) + coord_polar("y", start = 0) +  ggpubr::fill_palette("jco")+ theme_void()                          #http://www.sthda.com/english/articles/32-r-graphics-essentials/133-plot-one-variable-frequency-graph-density-distribution-and-more/

