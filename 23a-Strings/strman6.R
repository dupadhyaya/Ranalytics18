# String Manipulations 6
# Regular Expressions
#A regular expression (a.k.a. regex) is a special text string for describing a certain amount
#of text. This “certain amount of text” receives the formal name of pattern. Hence we say
#that a regular expression is a pattern that describes a set of strings.

# Meta Characters  . \ | ( ) [ { $ * + ?
#escape them with a backslash \. In R, however, we
#need to escape them with a double backslash \\
# Metacharacter Literal meaning Escape in R
# . the period or dot \\.
# $ the dollar sign \\$
# * the asterisk or star \\*
# + the plus sign \\+
# ? the question mark \\?
# | the vertical bar or pipe symbol \\|
# \ the backslash \\\\
# ^ the caret \\^
# [ the opening square bracket \\[
# ] the closing square bracket \\]
# { the opening curly bracket \\{
# } the closing curly bracket \\}
# ( the opening round bracket \\(
# ) the closing round bracket \\)

#dollar sign $ with an empty string ""
# string
money = "$money"
# the naive but wrong way
sub(pattern = "$", replacement = "", x = money)
## [1] "$money"

# the usual (in other languages) yet wrong way in R
sub(pattern = "\$", replacement = "", x = money)

# the right way in R
sub(pattern = "\\$", replacement = "", x = money)
## [1] "money"

# silly egs
# dollar
sub("\\$", "", "$Peace-Love")
## [1] "Peace-Love"
# dot
sub("\\.", "", "Peace.Love")
## [1] "PeaceLove"
# plus
sub("\\+", "", "Peace+Love")
## [1] "PeaceLove"
# caret
sub("\\^", "", "Peace^Love")
## [1] "PeaceLove"
# vertical bar
sub("\\|", "", "Peace|Love")
## [1] "PeaceLove"
# opening round bracket
sub("\\(", "", "Peace(Love)")
## [1] "PeaceLove)"

# closing round bracket
sub("\\)", "", "Peace(Love)")
## [1] "Peace(Love"
# opening square bracket
sub("\\[", "", "Peace[Love]")
## [1] "PeaceLove]"
# closing square bracket
sub("\\]", "", "Peace[Love]")
## [1] "Peace[Love"
# opening curly bracket
sub("\\{", "", "Peace{Love}")

## [1] "PeaceLove}"
# closing curly bracket
sub("\\}", "", "Peace{Love}")
## [1] "Peace{Love"
# double backslash
sub("\\\\", "", "Peace\\Love")
## [1] "PeaceLove"



# Sequences ------------
# Anchor Description
# \\d match a digit character
# \\D match a non-digit character
# \\s match a space character
# \\S match a non-space character
# \\w match a word character
# \\W match a non-word character
# \\b match a word boundary
# \\B match a non-(word boundary)
# \\h match a horizontal space
# \\H match a non-horizontal space
# \\v match a vertical space
# \\V match a non-vertical space

# Digits and non digits
# replace digit with '_' first
sub("\\d", "_", "the dandelion war 2010")
## [1] "the dandelion war _010"

gsub("\\d", "_", "the dandelion war 2010")
## [1] "the dandelion war ____"  all digits

# replace non-digit with '_'
sub("\\D", "_", "the dandelion war 2010")
## [1] "_he dandelion war 2010"
gsub("\\D", "_", "the dandelion war 2010")
## [1] "__________________2010"


#Spaces and non-spaces -----
# replace space with '_'
sub("\\s", "_", "the dandelion war 2010")
## [1] "the_dandelion war 2010"
gsub("\\s", "_", "the dandelion war 2010")
## [1] "the_dandelion_war_2010"

# replace non-space with '_'
sub("\\S", "_", "the dandelion war 2010")
## [1] "_he dandelion war 2010"
gsub("\\S", "_", "the dandelion war 2010")
## [1] "___ _________ ___ ____"

#Words and non-words
# replace word with '_'
sub("\\b", "_", "the dandelion war 2010")
## [1] "_the dandelion war 2010"
gsub("\\b", "_", "the dandelion war 2010")
## [1] "_t_h_e_ _d_a_n_d_e_l_i_o_n_ _w_a_r_ _2_0_1_0_"


# replace non-word with '_'
sub("\\B", "_", "the dandelion war 2010")
## [1] "t_he dandelion war 2010"
gsub("\\B", "_", "the dandelion war 2010")
## [1] "t_he d_an_de_li_on w_ar 2_01_0"

#Word boundaries and non-word-boundaries wherever word is there
# replace word boundary with '_'
sub("\\w", "_", "the dandelion war 2010")
## [1] "_he dandelion war 2010"
gsub("\\w", "_", "the dandelion war 2010")
## [1] "___ _________ ___ ____"

# replace non-word-boundary with '_'
sub("\\W", "_", "the dandelion war 2010")
## [1] "the_dandelion war 2010"
gsub("\\W", "_", "the dandelion war 2010")
## [1] "the_dandelion_war_2010"



# Character Classes ---------

# Anchor Description
# [aeiou] match any one lower case vowel
# [AEIOU] match any one upper case vowel
# [0123456789] match any digit
# [0-9] match any digit (same as previous class)
# [a-z] match any lower case ASCII letter
# [A-Z] match any upper case ASCII letter
# [a-zA-Z0-9] match any of the above classes
# [^aeiou] match anything other than a lowercase vowel
# [^0-9] match anything other than a digit

# some string
transport = c("car", "bike", "plane", "boat")
# look for 'e' or 'i'
grep(pattern = "[ei]", transport, value = TRUE)
## [1] "bike" "plane"

# some numeric strings
numerics = c("123", "17-April", "I-II-III", "R 3.0.1")
# match strings with 0 or 1
grep(pattern = "[01]", numerics, value = TRUE)
## [1] "123" "17-April" "R 3.0.1"
# match any digit
grep(pattern = "[0-9]", numerics, value = TRUE)
## [1] "123" "17-April" "R 3.0.1"
# negated digit
grep(pattern = "[^0-9]", numerics, value = TRUE)
## [1] "17-April" "I-II-III" "R 3.0.1"


# POSIX Characters
#Closely related to the regex character classes we have what is known as POSIX character
#classes. In R, POSIX character classes are represented with expressions inside double brackets
#[[ ]].
# Class Description
# [[:lower:]] Lower-case letters
# [[:upper:]] Upper-case letters
# [[:alpha:]] Alphabetic characters ([[:lower:]] and [[:upper:]])
# [[:digit:]] Digits: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
# [[:alnum:]] Alphanumeric characters ([[:alpha:]] and [[:digit:]])
# [[:blank:]] Blank characters: space and tab
# [[:cntrl:]] Control characters
# [[:punct:]] Punctuation characters: ! ” # % & ’ ( ) * + , - . / : ;
# [[:space:]] Space characters: tab, newline, vertical tab, form feed,
# carriage return, and space
# [[:xdigit:]] Hexadecimal digits: 0-9 A B C D E F a b c d e f
# [[:print:]] Printable characters ([[:alpha:]], [[:punct:]] and space)
# [[:graph:]] Graphical characters ([[:alpha:]] and [[:punct:]])


# la vie (string)
la_vie = "La vie en #FFC0CB (rose);\nCes't la vie! \ttres jolie"
# if you print 'la_vie'
print(la_vie)
## [1] "La vie en #FFC0CB (rose);\nCes't la vie! \ttres jolie"
# if you cat 'la_vie'
cat(la_vie)
## La vie en #FFC0CB (rose);
## Ces't la vie! tres jolie


# remove space characters
gsub(pattern = "[[:blank:]]", replacement = "", la_vie)
## [1] "Lavieen#FFC0CB(rose);\nCes'tlavie!tresjolie"
# remove digits
gsub(pattern = "[[:punct:]]", replacement = "", la_vie)
## [1] "La vie en FFC0CB rose\nCest la vie \ttres jolie"
# remove digits
gsub(pattern = "[[:xdigit:]]", replacement = "", la_vie)
## [1] "L vi n # (ros);\ns't l vi! \ttrs joli"
# remove printable characters
gsub(pattern = "[[:print:]]", replacement = "", la_vie)
## [1] "\n\t"
# remove non-printable characters
gsub(pattern = "[^[:print:]]", replacement = "", la_vie)
## [1] "La vie en #FFC0CB (rose);Ces't la vie! tres jolie"


# remove graphical characters
gsub(pattern = "[[:graph:]]", replacement = "", la_vie)
## [1] " \n \t "
# remove non-graphical characters
gsub(pattern = "[^[:graph:]]", replacement = "", la_vie)
## [1] "Lavieen#FFC0CB(rose);Ces'tlavie!tresjolie"



# Quantifiers  ---
#These are used when we want to match a certain number of characters that meet certain criteria

# Quantifier Description
# ? The preceding item is optional and will be matched at most once
# * The preceding item will be matched zero or more times
# + The preceding item will be matched one or more times
# {n} The preceding item is matched exactly n times
# {n,} The preceding item is matched n or more times
# {n,m} The preceding item is matched at least n times, but not more than m times


# people names
people = c("rori", "emilia", "matteo", "mehmet", "filipe", "anna", "tyler",
           "rasmus", "jacob", "youna", "flora", "adi")
# match 'm' at most once
grep(pattern = "m?", people, value = TRUE)
## [1] "rori" "emilia" "matteo" "mehmet" "filipe" "anna" "tyler"
## [8] "rasmus" "jacob" "youna" "flora" "adi"
# match 'm' exactly once
grep(pattern = "m{1}", people, value = TRUE, perl = FALSE)
## [1] "emilia" "matteo" "mehmet" "rasmus"
# match 'm' zero or more times, and 't'
grep(pattern = "m*t", people, value = TRUE)
## [1] "matteo" "mehmet" "tyler"

# match 't' zero or more times, and 'm'
grep(pattern = "t*m", people, value = TRUE)
## [1] "emilia" "matteo" "mehmet" "rasmus"
# match 'm' one or more times
grep(pattern = "m+", people, value = TRUE)
## [1] "emilia" "matteo" "mehmet" "rasmus"
# match 'm' one or more times, and 't'
grep(pattern = "m+.t", people, value = TRUE)
## [1] "matteo" "mehmet"
# match 't' exactly twice
grep(pattern = "t{2}", people, value = TRUE)
## [1] "matteo"


# Reg Exp Functions 
# Function Purpose Characteristic
# grep() finding regex matches which elements are matched (index or value)
# grepl() finding regex matches which elements are matched (TRUE & FALSE)
# regexpr() finding regex matches positions of the first match
# gregexpr() finding regex matches positions of all matches
# regexec() finding regex matches hybrid of regexpr() and gregexpr()
# sub() replacing regex matches only first match is replaced
# gsub() replacing regex matches all matches are replaced
# strsplit() splitting regex matches split vector according to matches

# in Stringr
# str_detect() Detect the presence or absence of a pattern in a string
# str_extract() Extract first piece of a string that matches a pattern
# str_extract all() Extract all pieces of a string that match a pattern
# str_match() Extract first matched group from a string
# str_match all() Extract all matched groups from a string
# str_locate() Locate the position of the first occurence of a pattern in a string
# str_locate all() Locate the position of all occurences of a pattern in a string
# str_replace() Replace first occurrence of a matched pattern in a string
# str_replace all() Replace all occurrences of a matched pattern in a string
# str_split() Split up a string into a variable number of pieces
# str_split fixed() Split up a string into a fixed number of pieces
str_function(string, pattern)

# Complimentary
# Function Purpose Characteristic
# regmatches() extract or replace matches use with data from regexpr(),
# gregexpr() or regexec()
# match() value matching finding positions of (first) matches
# pmatch() partial string matching finding positions
# charmatch() similar to pmatch() finding positions

# Accessory Functions accepting regex
# apropos() find objects by (partial) name
# browseEnv() browse objects in environment
# glob2rx() change wildcard or globbing pattern into Regular Expression
# help.search() search the help system
# list.files() list the files in a directory/folder
