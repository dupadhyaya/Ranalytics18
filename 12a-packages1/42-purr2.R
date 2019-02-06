#purrr

df = mtcars

library(purrr)
library(dplyr)

df %>% split(.$cyl)

df %>% split(.$cyl)  %>% walk(print)


df %>% split(.$am)  %>% mean(mpg)

library(ggplot2)
plots <- mtcars %>% split(.$cyl) %>%  map(~ggplot(., aes(mpg, wt)) + geom_point())
plots$`4`

paths <- stringr::str_c(names(plots), ".pdf")
paths
pwalk(list(paths, plots), ggsave, path = tempdir())
tempdir()


#keep
iris %>%   keep(is.factor) %>%   str()
iris %>%   discard(is.factor) %>% str()

#some
x <- list(1:5, letters, list(10))
x %>% some(is_character)
x %>% some(is_numeric)
x %>% every(is_numeric)
x %>% every(is_vector)

#detect
x <- sample(10)
x

x %>% detect(~ . > 5)
x %>% detect_index(~ . > 5)

#take elements from the start or end of a vector while a predicate is true:
x %>% head_while(~ . > 5)
x %>% tail_while(~ . > 5)

#accumulate
x <- sample(10)
x
x %>% accumulate(`+`)
x %>% accumulate(`*`)
x %>% accumulate(`/`)
x %>% accumulate(`-`)
#https://r4ds.had.co.nz/iteration.html
