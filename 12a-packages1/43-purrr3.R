#purrr3

library(purrr)
library(dplyr)

car_data <- transform(aggregate(. ~ cyl,  data = subset(mtcars, hp > 100), FUN = function(x) round(mean(x, 2))),  kpl = mpg*0.4251)
car_data

#If we don’t want to save intermediate results, composing multiple functions becomes super import

mtcars %>% subset(hp > 100) %>%   aggregate(. ~ cyl, data = ., FUN = . %>% mean %>% round(2)) %>%  transform(kpl = mpg %>% multiply_by(0.4251))
#error on multiply_by

devtools::install_github("jennybc/repurrrsive")

ghr <- repurrrsive::gh_repos
head(ghr)

map_dbl(ghr, length)
map_dbl(ghr, ~length(.x))
map(1:3, ~runif(2, max = .x))

map(1:3, runif, min = 3, max = 6)
map(1:3, function(n) { runif(n, min = 3, max = 6) })

map(ghr, ~map(.x, length))

ghr %>% map_chr(~map_chr(.x, ~.x$owner$login)[1]) %>% set_names(ghr, .) %>%   pluck("jennybc")

#map2_xxx() (analogous to map_xxx())
# pmap() (with which you can map over howerver many elements you want)
# lmap() (for mapping with funcions that take and return lists)
# imap() (for mapping over a list and its names, just like we did above)
# map_at()/map_if() (functions that allow you to filter which elements get mapped)

