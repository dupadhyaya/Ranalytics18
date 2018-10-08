# Outliers 2

#http://mantra.edina.ac.uk/practicals/MANTRA-R-Practical-Intro.pdf

#different methods for checking apparent outliers
with(riverquality,which(Temp<3))# the result is given as just the row number
which(riverquality$Temp<3)
riverquality$Temp<3  # prints the entire column
#as a set of TRUE, FALSE or NA responses for each cell, and involves counting
#which value meets the TRUE criterion. 
