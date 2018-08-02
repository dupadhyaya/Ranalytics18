#Types of Data

# Create the function.
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# Nominal
tshirt = c('red', 'blue', rep('green',3), rep('black',3))
tshirt
mean(tshirt)
median(tshirt)
tshirt = c(tshirt, rep('yellow',2))
tshirt
median(tshirt)
table(tshirt)
getmode(tshirt) # first color in entry

# Ordinal
grades = c(rep('Good',2), rep('Poor',4), rep('Excellent'))
grades
mean(grades)
median(grades)
getmode(grades)

f1 = factor(grades, levels=c( 'Good','Poor','Excellent'), ordered=F)
f1
f2 = factor(grades, levels=c('Poor', 'Good', 'Excellent'), ordered=T)
f2

mean(f2)
f2
median(f2)# not working - it is Good
getmode(f2)
summary(f2)

# Interval



# Ratio

