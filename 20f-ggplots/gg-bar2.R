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


mtcars %>% count(gear) %>% mutate(gearProp = n / nrow(mtcars)) %>% ggplot(., aes(x=gear, y=gearProp)) + geom_bar(stat='identity')
mtcars %>% select(gear) %>% table() %>% prop.table() %>% as.data.frame() -> y
class(y)
ggplot(mtcars, aes(x = gear)) +   geom_bar(aes(y = (..count..)/sum(..count..)))
ggplot(mtcars, aes(gear)) + geom_bar(aes(y = (..count..)/sum(..count..))) + scale_y_continuous(labels=scales::percent) +  ylab("relative frequencies")

ggplot(mtcars, aes(gear, group=am)) + geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") +  scale_y_continuous(labels=scales::percent) +  ylab("relative frequencies") +  facet_grid(~am) + scale_fill_manual(values = c("red", "green", "yellow"))

ggplot(mtcars, aes(x=gear,  group=am)) +  geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") + geom_text(aes( label = scales::percent(round(..prop..,3)), y= ..prop.. ), stat= "count", vjust = -.5) + labs(y = "Percent", fill="Transmission") + facet_grid(~am) +   scale_y_continuous(labels = scales::percent)


ggplot(mtcars, aes(x = gear, fill = factor(cyl))) + geom_bar(stat = "bin")
#x should be continuous

my3cols <- c("#E7B800", "#2E9FDF", "#FC4E07")
ggplot(mtcars, aes(x=cyl, y=mpg , group=gear)) + geom_dotplot(aes(color = gear, fill = gear), binaxis = 'y', stackdir = 'center') + scale_color_manual(values = my3cols) + scale_fill_manual(values = my3cols)



# Outside bars
mtcars %>% count(gear) %>% ggplot(., aes(x=gear,y=n)) +  geom_bar(stat="identity", fill="steelblue")+   geom_text(aes(label=n), vjust=-0.3, size=3.5)+   theme_minimal()
# Inside bars
mtcars %>% count(gear) %>% ggplot(., aes(x=gear,y=n)) +  geom_bar(stat="identity", fill="steelblue")+   geom_text(aes(label=n), vjust=1.6, size=3.5)+   theme_minimal()

#x should be continuous
ggplot(mtcars, aes(x=cyl))+ geom_bar(stat="bin", fill="steelblue")+ theme_minimal()


mtcars %>% count(gear) %>% ggplot(., aes(x=gear,y=n, colour=factor(gear))) +  geom_bar(stat="identity", fill="white")+   geom_text(aes(label=n), vjust=1.6, size=3.5) ->p
p
# Use custom color palettes
p+scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))
# Use brewer color palettes
p+scale_color_brewer(palette="Dark2")
# Use grey scale
p + scale_color_grey() + theme_classic()

mtcars %>% count(gear) %>% ggplot(., aes(x=gear,y=n, fill=factor(gear))) +  geom_bar(stat="identity")+   geom_text(aes(label=n), vjust=1.6, size=3.5) -> q
q
# Use custom color palettes
q+scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))
# use brewer color palettes
q+scale_fill_brewer(palette="Dark2")
# Use grey scale
q + scale_fill_grey()
q + scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))+
  theme_minimal()

#legend position
# Change bar fill colors to blues
q + scale_fill_brewer(palette="Blues")
q + theme(legend.position="top")
q + theme(legend.position="bottom")
# Remove legend
q + theme(legend.position="none")



#multiple groups
# Stacked barplot with multiple groups
mtcars %>% group_by(gear, cyl) %>% count() %>% ggplot(., aes(x=gear, y=n, fill=factor(cyl))) +  geom_bar(stat="identity")
# Use position=position_dodge()
mtcars %>% group_by(gear, cyl) %>% count() %>% ggplot(., aes(x=gear, y=n, fill=factor(cyl))) +  geom_bar(stat="identity", position=position_dodge())

#Paired
mtcars %>% group_by(gear, vs) %>% count() %>% ggplot(., aes(x=gear, y=n, fill=factor(vs))) +  geom_bar(stat="identity", position=position_dodge()) + geom_text(aes(label=n), vjust=1.6, color="white",   position = position_dodge(0.9), size=3.5)+
  scale_fill_brewer(palette="Paired")+   theme_minimal()

library(dplyr)
mtcars %>% group_by(gear, vs) %>% count() %>% arrange(gear,desc(vs)) -> df
df
library(plyr)
# Calculate the cumulative sum of len for each dose
df1 <- ddply(df, c('gear'),  transform, label_ypos=cumsum(n))
head(df1)
library(ggplot2)
df1 %>% ggplot(., aes(x=gear, y=n, fill=factor(vs))) +  geom_bar(stat="identity") + geom_text(aes(y=label_ypos, label=n), vjust=1.6, color="white", size=3) + scale_fill_brewer(palette="Paired")+   theme_minimal()

