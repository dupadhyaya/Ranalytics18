#Strings http://gastonsanchez.com/Handling_and_Processing_Strings_in_R.pdf
# names of states
states = rownames(USArrests)
# substr
substr(x = states, start = 1, stop = 4)

# abbreviate state names
states2 = abbreviate(states)
states2

# remove vector names (for convenience)
names(states2) = NULL
states2


# abbreviate state names with 5 letters
abbreviate(states, minlength = 5)


# size (in characters) of each name
state_chars = nchar(states)
# longest name
states[which(state_chars == max(state_chars))]

# get states names with 'k'
grep(pattern = "k", x = states, value = TRUE)

# get states names with 'w'
grep(pattern = "w", x = states, value = TRUE)

# get states names with 'w' or 'W'
grep(pattern = "[wW]", x = states, value = TRUE)

# get states names with 'w'
grep(pattern = "w", x = tolower(states), value = TRUE)

# get states names with 'W'
grep(pattern = "W", x = toupper(states), value = TRUE)

# get states names with 'w'
grep(pattern = "w", x = states, value = TRUE, ignore.case = TRUE)

# histogram
hist(nchar(states), main = "Histogram",
     xlab = "number of characters in US State names")

# position of a's
positions_a = gregexpr(pattern = "a", text = states, ignore.case = TRUE)

# how many a's?
num_a = sapply(positions_a, function(x) ifelse(x[1] > 0, length(x), 0))
num_a

# load stringr (remember to install it first)
library(stringr)

# total number of a's
str_count(states, "a")
