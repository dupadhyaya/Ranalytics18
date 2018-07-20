# Mutate : add new, Add new without old
#Mutate adds new variables and preserves existing; 
#transmute drops existing variables.

library(dplyr)

mutate(mtcars, displ_l = disp / 61.0237)
transmute(mtcars, displ_l = disp / 61.0237)

mutate(mtcars, cyl = NULL)
