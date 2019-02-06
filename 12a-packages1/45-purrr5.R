#purrr5
#https://adv-r.hadley.nz/functionals.html

library(purrr)
library(dplyr)

triple <- function(x) x * 3
map(1:3, triple)

map_chr(mtcars, typeof)
map_lgl(mtcars, is.double)

n_unique <- function(x) length(unique(x))
map_int(mtcars, n_unique)
map_dbl(mtcars, mean)

pair <- function(x) c(x, x)
map_dbl(1:2, pair)
map_dbl(1:2, as.character)
#in either case, it’s often useful to switch back to map(), because map() can accept any type of output. That allows you to see the problematic output, and figure out what to do with it.
map(1:2, pair)

#anonymous functions
map_dbl(mtcars, function(x) length(unique(x)))
map_dbl(mtcars, ~ length(unique(.x)))
map_dbl(mtcars, ~ mean(.x))
#This works because all purrr functions translate formulas, created by ~ (pronounced “twiddle”), into functions. 
x <- map(1:3, ~ runif(2))
str(x)

x <- list(1:5, c(1:10, NA))
map_dbl(x, ~ mean(.x, na.rm = TRUE))
map_dbl(x, mean, na.rm = TRUE)

trims <- c(0, 0.1, 0.2, 0.5)
x <- rcauchy(1000)
map_dbl(trims, mean, x = x)



by_cyl <- split(mtcars, mtcars$cyl)
by_cyl
by_cyl %>%   map(~ lm(mpg ~ wt, data = .x)) %>%   map(coef) %>%  map_dbl(2)
#base
by_cyl %>%  lapply(function(data) lm(mpg ~ wt, data = data)) %>%  lapply(coef) %>%  vapply(function(x) x[[2]], double(1))
models <- lapply(by_cyl, function(data) lm(mpg ~ wt, data = data))
vapply(models, function(x) coef(x)[[2]], double(1))



#modify - same format as input
df <- data.frame(  x = 1:3,  y = 6:4 )
map(df, ~ .x * 2)
modify(df, ~ .x * 2) #temp
df <- modify(df, ~ .x * 2)
df


#	List	Atomic	Same type	Nothing
# One argument	map()	map_lgl(), …	modify()	walk()
# Two arguments	map2()	map2_lgl(), …	modify2()	walk2()
# One argument + index	imap()	imap_lgl(), …	imodify()	iwalk()
# N arguments	pmap()	pmap_lgl(), …	—	pwalk()