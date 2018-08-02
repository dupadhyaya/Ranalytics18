# String Computations

# name of States
states = rownames(USArrests)
head(states)

# Histogram
nchar(states)
hist(nchar(states))
hist(nchar(states), main='Histogram',
     xlab='No of Characters in US State Names')


# Find no of vowels in Names

#no match = -1
# positions of a's
position_a = gregexpr(pattern='a', text=states, ignore.case = T)
position_a

str(position_a)  # positions a occured 1 3 6
states[1]
head(states,n=10)
position_a[c(1,7)] # 1st -1,3,5,7; 7th -1

# how many a's
(num_a = sapply(position_a, function(x) ifelse(x[1] > 0, length(x), 0)))
x = c(1,3,0)
sapply(x, function(x) ifelse(x[1] > 0, length(x), 0))
x = c('dhiraj', 'upadhyaya')
(num_a = sapply(position_a, function(x) ifelse(x[1] > 0, length(x), 0)))
head(position_a)

# Same command - stringr
library(stringr)
str_count(states,'a')  # only small case : no option for this
# transform to upper/lower case and then count
str_count(tolower(states), 'a')

# Same can be done for other vowels a, e,i,o, u
vowels = c('a', 'e', 'i', 'o', 'u')
# vector for storing results of positions
num_vowels = vector(mode='integer', length=5)  # blank int vector
num_vowels
# find vowels in each name
#num_aux = str_count(tolower(states), 'e')  # check for e
#sum(num_aux)

for(j in seq_along(vowels)) {
  num_aux = str_count(tolower(states), vowels[j])
  num_vowels[j] = sum(num_aux)
}
num_vowels
names(num_vowels) = vowels
num_vowels

# sort
sort(num_vowels, decreasing = T)

# draw barplot
barplot(num_vowels, main='No of vowels in US States Names',
      border=NA, ylim=c(0,80))
