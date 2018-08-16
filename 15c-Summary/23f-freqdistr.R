# freq dist

#Eg1
library(MASS)                 # load the MASS package 
school = painters$School      # the painter schools 
school.freq = table(school)   # apply the table function
school
school.freq
head(painters)
nrow(painters) # no of rows/ records
school.relfreq = school.freq / nrow(painters)
school.relfreq
cbind(school.relfreq) 
round(cbind(school.relfreq),2)
school2 = data.frame(round(cbind(school.relfreq),2))
hist(school2$school.relfreq)

#Cumulative Relative Frequency
school2$cum = cumsum(as.numeric(school2$school.relfreq))
school2
plot(school2$cum, type='l')


