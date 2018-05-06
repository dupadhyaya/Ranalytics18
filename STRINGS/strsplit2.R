# String Split

noquote(strsplit("A text I want to display with spaces", NULL)[[1]])

x <- c(as = "asfef", qu = "qwerty", "yuiop[", "b", "stuff.blah.yech")
# split x on the letter e
strsplit(x, "e")

unlist(strsplit("a.b.c", "."))
## [1] "" "" "" "" ""
## Note that 'split' is a regexp!
## If you really want to split on '.', use
unlist(strsplit("a.b.c", "[.]"))
## [1] "a" "b" "c"
## or
unlist(strsplit("a.b.c", ".", fixed = TRUE))

## a useful function: rev() for strings
strReverse <- function(x)
  sapply(lapply(strsplit(x, NULL), rev), paste, collapse = "")
strReverse(c("abc", "Statistics"))

## get the first names of the members of R-core
a <- readLines(file.path(R.home("doc"),"AUTHORS"))[-(1:8)]
a <- a[(0:2)-length(a)]
(a <- sub(" .*","", a))
# and reverse them
strReverse(a)

## Note that final empty strings are not produced:
strsplit(paste(c("", "a", ""), collapse="#"), split="#")[[1]]
# [1] ""  "a"

## and also an empty string is only produced before a definite match:
strsplit("", " ")[[1]]    # character(0)
strsplit(" ", " ")[[1]]   # [1] ""



# task----
s1 = c("PT1H57M3S", "PT1H3M46S","PT1H33S","PT1H2M", "PT18S","PT18M9S", "PT1H39M22S")
s2 = c("PT1H57M3S")
(s2h = strsplit(s2,'[H]'))
s2m = strsplit(s2h,'[M]')



library(tidyverse)
library(stringi)
out <- map2_df(stri_extract_all_regex(s1, "\\d+"), 
               stri_extract_all_regex(s1, "[HMS]"), ~ .x %>%
                 as.integer %>%
                 as.list %>% 
                 set_names(.y) ) 
out
