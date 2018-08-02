# Abbreviations

head(USArrests)
str(USArrests)
# rows as strings

# name of States
states = rownames(USArrests)
head(states)

# substr
(s1= substr(x = states, start=1, stop=4))

# Find duplicates
duplicated(s1)
sum(duplicated(s1), na.rm=TRUE)
sum(duplicated(s1))
sum(duplicated(s1), na.rm=FALSE)
# sums only TRUE values

table(duplicated(s1))

length(s1)
length(unique(s1))

# Better
(states2 = abbreviate(states))
head(states2)
# remove rownames for convenience
names(states2) = NULL
states2
sum(duplicated(states2))

# Change length of abbreviation to 5
(states3 = abbreviate(states, minlength = 5))
names(states3) = NULL
states3

