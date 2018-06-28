#by - data frame - matrix form

?by
#by(data, INDICES, FUN, ..., simplify = TRUE)

str(student1)
student1[,c(15:22)]
str(s1)
student[,c(17:22)]
by(student[,17:22], INDICES=student[,'batchyr'], FUN=summary, simplify=T)
by(student[,17:22], INDICES=student[,c('gender','batchyr')], FUN=summary, simplify=T)
by(student[,17:22], INDICES=student[,c('gender','cat')], FUN=colMeans, simplify=T)
by(student[,17:22], INDICES=student[,c('city')], FUN=colMeans, simplify=T)
