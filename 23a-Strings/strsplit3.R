#
library(splitstackshape)

campus = c('AUHR_M', 'AUHR_M')
institute = c('ABS', 'ASET')
programs = c('BBA, MBA, MBA-HR', 'BTECH_CSE, BTECH_ME, BTECH_CE, MTECH, PHD')
courses = data.frame(campus,institute, programs)
courses

## Split the "programs" column
cSplit(courses, "programs")

##   they have different delimiters...
#cSplit(temp, c("Likes", "Hates"), c(",", ";"))

## Split "Siblings" into a long form...
cSplit(courses, "programs", ",", direction = "long")
#solved
cSplit(courses, "programs", ",", direction = "long", stripWhite = F)


#split a occurance of a character or string


