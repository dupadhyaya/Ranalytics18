# dplyr - group by

library(dplyr)

mtcars %>% group_by(am) 
#nothing - just separation

mtcars %>% group_by(am) %>% summarise(mean(mpg))

#subgroups
mtcars %>% group_by(am, gear) %>% summarise(mean(mpg))

#subgroups
mtcars %>% group_by(am, gear) %>% summarise(mean(mpg)) %>% ungroup()
