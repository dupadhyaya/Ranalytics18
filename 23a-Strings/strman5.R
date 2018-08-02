#Stringr 5
library(stringr)
detach("package:stringr", unload=TRUE)

# Drawbacks

# some text vector
(text = c("one", "two", "three", NA, "five"))

# how many characters in each string?
nchar(text)
## [1] 3 3 5 2 4   ? NA should be left blank instead of 2


# this works fine
paste("University", "of", "California", "Berkeley")
## [1] "University of California Berkeley"
# this works fine too
paste("University", "of", "California", "Berkeley")

# this is weird
paste("University", "of", "California", "Berkeley", NULL)
## [1] "University of California Berkeley "

# this is ugly
paste("University", "of", "California", "Berkeley", NULL, character(0),
      "Go Bears!")
## [1] "University of California Berkeley Go Bears!"

#The objects NULL and character(0)
#have zero length, yet when included inside paste() they are treated as an empty string "".

#install.packages('stringr')
library(stringr)

#Function Description Similar to
str_c() #string concatenation paste()
str_length() #number of characters nchar()
str_sub()# extracts substrings substring()
str_dup() #duplicates characters none
str_trim() #removes leading and trailing whitespace none
str_pad() #pads a string none
str_wrap() #wraps a string paragraph strwrap()
str_trim() #trims a string none

#str_c
# default usage
str_c("May", "The", "Force", "Be", "With", "You")
## [1] "MayTheForceBeWithYou"

# removing zero length objects
str_c("May", "The", "Force", NULL, "Be", "With", "You", character(0))
## [1] "MayTheForceBeWithYou"
paste("May", "The", "Force", NULL, "Be", "With", "You", character(0))
#[1] "May The Force  Be With You "
#: zero length arguments like
#NULL and character(0) are silently removed by str c().

# changing separator
str_c("May", "The", "Force", "Be", "With", "You", sep = "_")
## [1] "May_The_Force_Be_With_You"

# synonym function 'str_join'
str_join("May", "The", "Force", "Be", "With", "You", sep = "-")
## [1] "May-The-Force-Be-With-You"

#string length

# some text (NA included)
some_text = c("one", "two", "three", NA, "five")
# compare 'str_length' with 'nchar'
nchar(some_text)
## [1] 3 3 5 2 4  check it is same
str_length(some_text)
## [1] 3 3 5 NA 4

# some factor
some_factor = factor(c(1, 1, 1, 2, 2, 2), labels = c("good", "bad"))
some_factor
## [1] good good good bad bad bad
## Levels: good bad
# try 'nchar' on a factor

nchar(some_factor)
## Error: ’nchar()’ requires a character vector
# now compare it with 'str_length'
str_length(some_factor)
## [1] 4 4 4 3 3 3

# Extract Strings -------
str_sub(string, start = 1L, end = -1L)

# some text
lorem = "Lorem Ipsum"
# apply 'str_sub'
str_sub(lorem, start = 1, end = 5)
## [1] "Lorem"
# equivalent to 'substring'
substring(lorem, first = 1, last = 5)
## [1] "Lorem"
# another example
str_sub("adios", 1:3)
## [1] "adios" "dios" "ios"  ???

# can work with negative indices

# some strings
resto = c("brasserie", "bistrot", "creperie", "bouchon")
# 'str_sub' with negative positions
str_sub(resto, start = -4, end = -1)
## [1] "erie" "trot" "erie" "chon"
# compared to substring (useless)
substring(resto, first = -4, last = -1)
## [1] "" "" "" ""

# extracting sequentially  ???
lorem
seq_len(nchar(lorem))
str_sub(lorem, seq_len(nchar(lorem)))

substring(lorem, seq_len(nchar(lorem)))

# reverse substrings with negative positions
str_sub(lorem, -seq_len(nchar(lorem)))

substring(lorem, -seq_len(nchar(lorem)))

#We can use str sub() not only for extracting subtrings but also for replacing substrings:
# replacing 'Lorem' with 'Nullam'
lorem = "Lorem Ipsum"
str_sub(lorem, 1, 5) <- "Nullam"
lorem

# replacing with negative positions
lorem = "Lorem Ipsum"
str_sub(lorem, -1) <- "Nullam"
lorem

# multiple replacements
lorem = "Lorem Ipsum"
str_sub(lorem, c(1, 7), c(5, 8)) <- c("Nullam", "Enim")
lorem
## [1] "Nullam Ipsum" "Lorem Enimsum"


#Duplicates
str_dup(string, times)
# default usage
str_dup("hola", 3)

# use with differetn 'times'
str_dup("adios", 1:3)
## [1] "adios" "adiosadios" "adiosadiosadios"

# use with a string vector
words = c("lorem", "ipsum", "dolor", "sit", "amet")
str_dup(words, 2)
## [1] "loremlorem" "ipsumipsum" "dolordolor" "sitsit" "ametamet"
str_dup(words, 1:5)
str_dup(words, 1:15) # recycle


#Padding
str_pad(string, width, side = "left", pad = " ")

# default usage
str_pad("hola", width = 7)
## [1] " hola"

# pad both sides
str_pad("adios", width = 7, side = "both")
## [1] " adios "
# left padding with '#'
str_pad("hashtag", width = 8, pad = "#")
## [1] "#hashtag"

# pad both sides with '-'
str_pad("hashtag", width = 9, side = "both", pad = "-")
## [1] "-hashtag-"

#string wrap
str_wrap(string, width = 80, indent = 0, exdent = 0)

# quote (by Douglas Adams)
some_quote = c(
  "I may not have gone",
  "where I intended to go,",
  "but I think I have ended up",
  "where I needed to be")
# some_quote in a single paragraph
some_quote = paste(some_quote, collapse = " ")
some_quote
# display paragraph with width=30
cat(str_wrap(some_quote, width = 30))

# display paragraph with first line indentation of 2
cat(str_wrap(some_quote, width = 30, indent = 2), "\n")

# display paragraph with following lines indentation of 3
cat(str_wrap(some_quote, width = 30, exdent = 3), "\n")


#Trimming with str trim() --------
str_trim(string, side = "both")

# text with whitespaces
bad_text = c("This", " example ", "has several ", " whitespaces ")

# remove whitespaces on the left side
str_trim(bad_text, side = "left")

## [1] "This" "example " "has several " "whitespaces "

# remove whitespaces on the right side

str_trim(bad_text, side = "right")
## [1] "This" " example" "has several" " whitespaces"

# remove whitespaces on both sides
str_trim(bad_text, side = "both")

#Word extraction with word() ---------
word(string, start = 1L, end = start, sep = fixed(" "))

# some sentence
(change = c("Be the change", "you want to be"))

# extract first word
word(change, 1)

## [1] "Be" "you"
# extract second word
word(change, 2)
## [1] "the" "want"

# extract last word
word(change, -1)
## [1] "change" "be"

# extract all but the first words
word(change, 2, -1)
## [1] "the change" "want to be"

word(change, c(1,2), c(3,4))  # ???



