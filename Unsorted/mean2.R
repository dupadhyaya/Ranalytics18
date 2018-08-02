# Summary1

library(MASS)                 # load the MASS package 
school = painters$School      # the painter schools 
c_school = school == "C"      # the logical index vector
c_school
#which school has the highest mean composition score
c_painters = painters[c_school, ]  # child data set
c_painters
mean(c_painters$Composition) 

tapply(painters$Composition, painters$School, mean)
