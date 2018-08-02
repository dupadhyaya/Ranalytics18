# Selecting from Strings

# name of States
states = rownames(USArrests)
head(states)

# Select states with k
pattern1 = 'k'
grep(pattern = pattern1, x = states, value = T)

pattern1 = 'w'
grep(pattern = pattern1, x = states, value = T)

# w or W
pattern1 = '[wW]'
grep(pattern = pattern1, x = states, value = T)

# ignore case
pattern1 = 'w'
grep(pattern = pattern1, x = tolower(states), value = T)

pattern1 = 'W'
grep(pattern = pattern1, x = toupper(states), value = T)

pattern1 = 'w'
grep(pattern = pattern1, x = states, ignore.case=T, value = T)
