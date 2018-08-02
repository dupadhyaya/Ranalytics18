#String Manipulations 7

#Pattern Finding Functions

#Finding a match
grep(pattern, text)
grepl(pattern, text)
regexpr(pattern, text)
gregexpr(pattern, text)
regexec(pattern, text)

# some text
text = c("one word", "a sentence", "you and me", "three two one")
# pattern
pat = "one"
# default usage
grep(pat, text)
## [1] 1 4

# with 'value' (showing matched text)
grep(pat, text, value = TRUE)
## [1] "one word" "three two one"

# with 'invert' (showing unmatched parts)
grep(pat, text, invert = TRUE)
## [1] 2 3
# same with 'values'
grep(pat, text, invert = TRUE, value = TRUE)
## [1] "a sentence" "you and me"


# some text
text = c("one word", "a sentence", "you and me", "three two one")
# pattern
pat = "one"
# default usage
grepl(pat, text)
## [1] TRUE FALSE FALSE TRUE

# location 
# some text
text = c("one word", "a sentence", "you and me", "three two one")
# default usage
regexpr("one", text)
## [1] 1 -1 -1 11
## attr(,"match.length")
## [1] 3 -1 -1 3
## attr(,"useBytes")
## [1] TRUE


# some text
text = c("one word", "a sentence", "you and me", "three two one")
# pattern
pat = "one"
# default usage
gregexpr(pat, text)

# some text
text = c("one word", "a sentence", "you and me", "three two one")
# pattern
pat = "one"
# default usage
regexec(pat, text)

# handy function to extract matched term
x = regexpr(pat, text)
substring(text, x, x + attr(x, "match.length") - 1)
## [1] "one" "" "" "one"
# with NA
regexpr(pat, c(text, NA))
## [1] 1 -1 -1 11 NA
## attr(,"match.length")
## [1] 3 -1 -1 3 NA


#6.2 Pattern Replacement Functions ----
sub(pattern, replacement, text)
gsub(pattern, replacement, text)


# string
Rstring = c("The R Foundation",
            "for Statistical Computing",
            "R is FREE software",
            "R is a collaborative project")
# substitute 'R' with 'RR'
sub("R", "RR", Rstring)
## [1] "The RR Foundation" "for Statistical Computing"
## [3] "RR is FREE software" "RR is a collaborative project"

Rstring = c("The R Foundation",
            "for Statistical Computing",
            "R is FREE software",
            "R is a collaborative project")
# substitute
gsub("R", "RR", Rstring)
## [1] "The RR Foundation" "for Statistical Computing"
## [3] "RR is FRREE software" "RR is a collaborative project"

strsplit(x, split) # same as strsplit(text, pattern)

# a sentence
sentence = c("R is a collaborative project with many contributors")
# split into words
strsplit(sentence, " ")
## [[1]]
## [1] "R" "is" "a" "collaborative"
## [5] "project" "with" "many" "contributors"

# telephone numbers
tels = c("510-548-2238", "707-231-2440", "650-752-1300")
# split each number into its portions
strsplit(tels, "-")

# some objects
some_objs = c("pen", "pencil", "marker", "spray")
# detect phones
str_detect(some_objs, "pen")
## [1] TRUE TRUE FALSE FALSE
# select detected macthes
some_objs[str_detect(some_objs, "pen")]
## [1] "pen" "pencil"

# some strings
strings = c("12 Jun 2002", " 8 September 2004 ", "22-July-2009 ",
            "01 01 2001", "date", "02.06.2000",
            "xxx-yyy-zzzz", "$2,600")
# date pattern (month as text)
dates = "([0-9]{1,2})[- .]([a-zA-Z]+)[- .]([0-9]{4})"
# detect dates
str_detect(strings, dates)
## [1] TRUE TRUE TRUE FALSE FALSE FALSE FALSE FALSE


# tweets about 'Paris'
paris_tweets = c(
  "#Paris is chock-full of cultural and culinary attractions",
  "Some time in #Paris along Canal St.-Martin famous by #Amelie",
  "While you're in #Paris, stop at cafe: http://goo.gl/yaCbW",
  "Paris, the city of light")
# hashtag pattern
hash = "#[a-zA-Z]{1,}"
# extract (first) hashtag
str_extract(paris_tweets, hash)
## [1] "#Paris" "#Paris" "#Paris" NA
#As you can see, the output of str extract() is a vector of same length as string. Those
#elements that don’t match the pattern are indicated as NA. Note that str extract() only
#matches the first pattern: it didn’t extract the hashtag "#Amelie"

# extract (all) hashtags
str_extract_all(paris_tweets, "#[a-zA-Z]{1,}")  #??? where was Paris

# string vector
strings = c("12 Jun 2002", " 8 September 2004 ", "22-July-2009 ",
            "01 01 2001", "date", "02.06.2000",
            "xxx-yyy-zzzz", "$2,600")
# date pattern (month as text)
dates = "([0-9]{1,2})[- .]([a-zA-Z]+)[- .]([0-9]{4})"
# extract first matched group
str_match(strings, dates)

# tweets about 'Paris'
paris_tweets = c(
  "#Paris is chock-full of cultural and culinary attractions",
  "Some time in #Paris along Canal St.-Martin famous by #Amelie",
  "While you're in #Paris, stop at cafe: http://goo.gl/yaCbW",
  "Paris, the city of light")
# match (all) hashtags in 'paris_tweets'
str_match_all(paris_tweets, "#[a-zA-Z]{1,}")


# locate position of (first) hashtag
str_locate(paris_tweets, "#[a-zA-Z]{1,}")
## start end
## [1,] 1 6
## [2,] 14 19
## [3,] 17 22
## [4,] NA NA

# locate (all) hashtags in 'paris_tweets'
str_locate_all(paris_tweets, "#[a-zA-Z]{1,}")


# city names
cities = c("San Francisco", "Barcelona", "Naples", "Paris")
# replace first matched vowel
str_replace(cities, "[aeiou]", ";")
## [1] "S;n Francisco" "B;rcelona" "N;ples" "P;ris"

#Now, suppose that we want to replace the first consonant in each name. We just need to
#modify the pattern with a negated class:
# replace first matched consonant
str_replace(cities, "[^aeiou]", ";")
## [1] ";an Francisco" ";arcelona" ";aples" ";aris"


# city names
cities = c("San Francisco", "Barcelona", "Naples", "Paris")
# replace all matched vowel
str_replace_all(cities, pattern = "[aeiou]", ";")
## [1] "S;n Fr;nc;sc;" "B;rc;l;n;" "N;pl;s" "P;r;s"

# replace all matched consonants
str_replace_all(cities, pattern = "[^aeiou]", ";")
## [1] ";a;;;;a;;i;;o" ";a;;e;o;a" ";a;;e;" ";a;i;"


# a sentence
sentence = c("R is a collaborative project with many contributors")
# split into words
str_split(sentence, " ")
## [[1]]
## [1] "R" "is" "a" "collaborative"
## [5] "project" "with" "many" "contributors"

# telephone numbers
tels = c("510-548-2238", "707-231-2440", "650-752-1300")
# split each number into its portions
str_split(tels, "-")

# string
flavors = c("chocolate", "vanilla", "cinnamon", "mint", "lemon")
# split by vowels
str_split(flavors, "[aeiou]")


# split by first vowel
str_split(flavors, "[aeiou]", n = 2)

# string
flavors = c("chocolate", "vanilla", "cinnamon", "mint", "lemon")
# split flavors into 2 pieces
str_split_fixed(flavors, "n", 2)

# split favors into 3 pieces
str_split_fixed(flavors, "n", 3)
