#by - data frame - matrix form

?by
#by(data, INDICES, FUN, ..., simplify = TRUE)

by(mtcars, INDICES=mtcars[,'am'],  FUN=summary, simplify=T)
by(mtcars, INDICES=mtcars[,c('am','cyl')],  FUN=summary, simplify=T)

by(mtcars, INDICES=mtcars[,c('am','cyl')],FUN=colMeans, simplify=T)
by(mtcars, INDICES=mtcars[,'am'],  FUN=colMeans, simplify=T)

