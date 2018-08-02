# String Manipulation 9

# function that reverses a string by characters
reverse_chars <- function(string)
{
  # split string by characters
  string_split = strsplit(string, split = "")
  # reverse order
  rev_order = nchar(string):1
  # reversed characters
  reversed_chars = string_split[[1]][rev_order]
  # collapse reversed characters
  paste(reversed_chars, collapse="")
}
#Let’s test our reversing function with a character and numeric vectors:
  # try 'reverse_chars'
reverse_chars("abcdefg")
## [1] "gfedcba"
# try with non-character input
reverse_chars(12345)
## Error: non-character argument
reverse_chars('12345')


# reversing a string by characters
reverse_chars <- function(string)
{
  string_split = strsplit(as.character(string), split = "")
  reversed_split = string_split[[1]][nchar(string):1]
  paste(reversed_split, collapse="")
}


# example with one word
reverse_chars("atmosphere")
## [1] "erehpsomta"
# example with a several words
reverse_chars("the big bang theory")
## [1] "yroeht gnab gib eht"

# try 'reverse_chars'
reverse_chars("abcdefg")
## [1] "gfedcba"
# try with non-character input
reverse_chars(12345)
## [1] "54321"

# reverse vector (by characters)
lapply(c("the big bang theory", "atmosphere"), reverse_chars)
## [[1]]
## [1] "yroeht gnab gib eht"
##
## [[2]]
## [1] "erehpsomta"

# function that reverses a string by words
reverse_words <- function(string)
{
  # split string by blank spaces
  string_split = strsplit(as.character(string), split = " ")
  # how many split terms?
  string_length = length(string_split[[1]])
  # decide what to do
  if (string_length == 1) {
    # one word (do nothing)
    reversed_string = string_split[[1]]
  } else {
    # more than one word (collapse them)
    reversed_split = string_split[[1]][string_length:1]
    reversed_string = paste(reversed_split, collapse = " ")
  }
  # output
  return(reversed_string)
}


# examples
reverse_words("atmosphere")
## [1] "atmosphere"
reverse_words("the big bang theory")
## [1] "theory bang big the"

# reverse vector (by words)
lapply(c("the big bang theory", "atmosphere"), reverse_words)
## [[1]]
## [1] "theory bang big the"
##
## [[2]]
## [1] "atmosphere"


#Email
# pattern
email_pat = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
# string that matches
grepl(pattern = email_pat, x = "gaston@abc.com")
## [1] TRUE

# another string that matches
grep(pattern = email_pat, x = "gaston.sanchez@research-center.fr")
## [1] 1
# unmatched email (TLD too long)
grep(pattern = email_pat, x = "gaston@abc.something")
## integer(0)


# potential email addresses
emails = c(
  "simple@example.com",
  "johnsmith@email.gov",
  "marie.curie@college.edu",
  "very.common@example.com",
  "a.little.lengthy.but.ok@dept.example.com",
  "disposable.style.email.with+symbol@example.com",
  "not_good@email.address")

# detect pattern
str_detect(string=emails, pattern=email_pat)
## [1] TRUE TRUE TRUE TRUE TRUE FALSE FALSE
