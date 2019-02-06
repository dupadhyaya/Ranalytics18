# split - apply - combine

#https://vita.had.co.nz/papers/plyr.pdf
a*ply(.data, .margins, .fun, ..., .progress = "none")
d*ply(.data, .variables, .fun, ..., .progress = "none")
l*ply(.data, .fun, ..., .progress = "none")
#a = array, d = data frame, l = list, and _ means the output is discarded.
#The first argument is the .data which will be split up, processed and recombined. The second argument, .variables or .margins, describes how to split up the input into pieces. The third argument, .fun, is the processing function, and is applied to each piece in turn. All further arguments are passed on to the processing function. If you omit .fun the individual pieces

# input\output  array  dataframe list      discarded
# array         aaply   adply    alply     a_ply
# dataframe     daply   ddply    dlply     d_ply
# list          laply   ldply    llply     l_ply
#.progress argument controls display of a progress bar,
#all arguments start with “.”. This prevents name clashes with the arguments of the processing function, and helps to visually delineate arguments that control the repetition from arguments that control the individual steps. Some functions in base R use all uppercase argument names for this purpose,

shape <- function(x) if (is.vector(x)) length(x) else dim(x)
shape(mtcars)
x <- array(1:24, 2:4)
library(plyr)
shape(aaply(x, 2, function(y) 0))
shape(aaply(x, 2, function(y) rep(1,5)))
shape(aaply(x, 2, function(y) matrix(0,nrow=5,ncol=6)))
shape(aaply(x, 1, function(y) matrix(0,nrow=5,ncol=6)))
