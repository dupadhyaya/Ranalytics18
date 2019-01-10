#two axis - ggplot2

library (ggplot2)
library(tidyverse)

(year = seq(2016,2020))
(students = c(1000,1200, 1500, 1300,2000))
(fac = c(100,120, 150, 130,180))

library(ggplot2)
(df = data.frame(year, students, fac))
g= ggplot() + geom_bar(data=df, aes(x=year,y=fac,fill=year, alpha=.4) , stat='identity') + geom_line(data=df, aes(x=year, y=students/10 ), colour='red') +  scale_y_continuous(sec.axis=sec_axis(~.*10, name="students")) + guides(fill='none', alpha='none')

g + theme(axis.text.y.right=element_text(colour="red"),
      axis.title.y.right=element_text(colour="red"),
      axis.text.y=element_text(colour="#346D9D"),
      axis.title.y=element_text(colour="#346D9D"),
      axis.title.x=element_blank(),
      legend.position="bottom")
