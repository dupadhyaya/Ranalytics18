# String Length

# name of States
states = rownames(USArrests)
head(states)

# size of characters
length(states)  # length of vector
(state_chars = nchar(states))

# Longest name
max(state_chars)
state_chars
states[which(state_chars == max(state_chars))]
