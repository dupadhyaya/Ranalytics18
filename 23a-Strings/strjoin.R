# Strings Join
library(stringr)
str_c("Letter: ", letters)
str_c("Letter", letters, sep = ": ")
str_c(letters, " is for", "...")
str_c(letters[-26], " comes before ", letters[-1])

str_c(letters, collapse = "")
str_c(rev(letters), collapse = "")

str_c(letters, collapse = ", ")
