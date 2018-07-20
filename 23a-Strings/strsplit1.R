# String - Splitting Columns

library(splitstackshape)

# Sample data
temp <- head(concat.test)
temp

## Split the "Likes" column
cSplit(temp, "Likes")

## Split the "Likes" and "Hates" columns --
##   they have different delimiters...
cSplit(temp, c("Likes", "Hates"), c(",", ";"))

## Split "Siblings" into a long form...
cSplit(temp, "Siblings", ",", direction = "long")

## Split "Siblings" into a long form, not removing whitespace
cSplit(temp, "Siblings", ",", direction = "long", stripWhite = FALSE)

## Split a vector
y <- c("a_b_c", "a_b", "c_a_b")
cSplit(data.frame(y), "y", "_")




#---
library(splitstackshape)
splitstackshape::cSplit(df, wordexplantion, "-")

before <- data.frame(attr = c(1,30,4,6), type=c('foo_and_bar','foo_and_bar_2'))  
before
do.call(rbind, stringr::str_split(before$type, '_and_'))


#-----
library(data.table) ## v 1.9.6+ 
setDT(before)[, paste0("type", 1:2) := tstrsplit(type, "_and_")]
before


#before <- data.frame(attr = c(1,30,4,6), type=c('foo_and_bar','foo_and_bar_2'))  
out <- strsplit(as.character(before$type),'_and_') 
do.call(rbind, out)


#---
ibrary(dplyr)
library(tidyr)

before <- data.frame(
  attr = c(1, 30 ,4 ,6 ), 
  type = c('foo_and_bar', 'foo_and_bar_2')
)

before %>%
  separate(type, c("foo", "bar"), "_and_")
