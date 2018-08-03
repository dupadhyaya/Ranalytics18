#tidyverse

library(dplyr)



mtcars %>%group_by(cyl, am) %>% summarise_all(funs(mean, n()))

aggregate(cbind(mpg, wt) ~ cyl + am, data = mtcars, FUN = plyr::each(avg = mean, n = length))
