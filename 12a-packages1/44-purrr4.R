#purrr4

#purrr is designed to help with “functional programming”, which you can take broadly as trying to use functions (preferably “pure” ones) to accomplish most of your complex and repetitive tasks (don’t copy and paste more then 3 times - H. Wickham)


library(purrr)
library(dplyr)

map(1:3, ~runif(2, max = .x))

shades <- colors()[1:10]

for (i in seq_along(shades)){  print(shades[i])}
a <-  lapply(shades, print)
a
b <-  map(shades, print)

#general
#map("Lists to apply function to","Function to apply across lists","Additional parameters")

map(mtcars, mean, na.rm = T)
mtcars_means <- map(mtcars, mean, na.rm = T)
class(mtcars_means)

#map_TYPE returns an object of class TYPE, e.g.
#map_lgl returns logical objects
#map_df returns data frames, etc.
df1= map_df(mtcars, mean, na.rm = T)
class(df1)
df1

#map can also be extended to deal with multiple input lists
#map applies a function over one list.
#map2 applies a function over combinations of two lists in the form
#map2(list1, list2, ~function(.x,.y), ...)
map2_chr(c('one','two','red','blue'), c('fish'), paste)


z <- 10
foo <- function(x,y) {
    z <- x + y
    return(z) }

foo(x = 2,y = 3)
z #not affected

a <- 10
z =0
foo <- function(x,y) {
  z <- x + y + a
  return(z) }
foo(x = 2, y = 3)
a; z
#recommend you avoid using global variables inside functions: it
#“anonymous” functions in :make anonymous functions with ~
map2_chr(c('one','two','red','blue'), c('fish'), ~paste(.x,.y))

cvfoo <- function(x){ sd(x) / mean(x) }
map(mtcars, cvfoo)
#MULTIPLE LISTS USING PMAP

library(ggplot2)
library(dplyr)
dmonds <- diamonds %>%  slice(1:4)

pmap_foo <- function(list1, list2 , list3){
  paste0("Diamond #", list1, " sold for $", list2," and was ", list3, " carats") }

pmap(list(list1 = 1:nrow(dmonds), list2 = dmonds$price, list3 = dmonds$carat), pmap_foo)
