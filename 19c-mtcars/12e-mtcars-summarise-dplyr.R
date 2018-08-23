#tidyverse

library(dplyr)
#Options to print increased no of rows and columns
#options(dplyr.print_max = 1e9)
#options(tibble.print_max = n, tibble.print_min = 3)
#: if there are more than n rows, print only the first m rows. Use 
options(tibble.print_max = Inf) #to always show all rows.
options(tibble.width = Inf)

#group by cyl, calculate avg hp and wt
mtcars %>% group_by(cyl) %>% summarise(mean(hp), mean(wt))
#group by cyl, am
mtcars %>% group_by(cyl,am) %>% summarise(mean(hp), mean(wt))

#mean and count of all columns when gp by cyl, am
mtcars %>%group_by(cyl, am) %>% summarise_all(funs(mean, n()))

#selected columns
mtcars %>% select(cyl, am, mpg, wt, hp, qsec) %>% group_by(cyl, am) %>% summarise_all(funs(mean, max, min))

#sample 
sample_n(mtcars, 2)
sample_frac(mtcars, .2)
mtcars %>% sample_frac(.2)

#
