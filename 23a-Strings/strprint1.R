# Printing Characters
print()  # generic printing
noquotes() # print with no quotes
cat() # concatenation
format() # special formats
toStrings() # convert to string
sprintf() # print as per c format

# print ------------

# text string
mystring = " Programming with data is fun"

print(mystring)
# quoted by default

# noquote -------------
noquote(mystring)

(no_quote1 = noquote(c('some', 'quoted', 'text', '!%~(&=')))

class(no_quote1) #  noquote
class(noquote)  # function 
#text character
is.character(no_quote1) # TRUE
no_quote1[2:3]  # 2nd & 3rd string


# concatenate -----------
?cat
cat(... , file = "", sep = " ", fill = FALSE, labels = NULL,
    append = FALSE)
# Accepts several types of data -> character
# default sep space

mystring
cat(mystring) # without quote
# prints to screen or file, no line indicator[1]

# 2 or more strings
cat(mystring, 'with R')

# cat with sep
cat(mystring, 'with R', sep=' =) ')
cat(1:10, sep="-")
#passing vectors, taken as seperate arguments
cat(month.abb[1:4], sep='#')
# break long strings  fill=30  string width
cat('Loooooooong strings', 'can be displayed', 'in a nice format',
    "by using the 'fill ' argument ", fill=30)
cat('Loooooooong strings', 'can be displayed', 'in a nice format',
    "by using the 'fill ' argument ", fill=50)
cat('Loooooooong strings', 'can be displayed', 'in a nice format',
    "by using the 'fill ' argument ", fill=5) # takes min of string

# output to a file
cat(mystring, 'with R', file='strings/output.txt')

# Encoding strings with format() ----------
# preety printing

#default usage
format(13.7)
format(13.1343232)
format(13.134323245544545)
# upto 5 decimal places
# arguments width, trim(padding), justify(text only), digits, scientific

format(13.7, nsmall = 3) # padding upto 3 digits
format(13.7, nsmall = 5)

format(c(6, 13.1), digits=2)
format(c(6, 13.1), digits=3) # max digits
format(c(6, 13.1), digits=1)  # no effect
format(c(6, 13.1), digits=5)  # no effect
format(c(6, 13.12345), digits=5)

format(c(6, 13.1), digits=2, nsmall=2)

format(c(6, 13.1), digits=2, nsmall=4)
format(c(6, 13.12345), digits=5, nsmall=3)  #shorten the display, pad if reqd

# pad - makes length same

#justify ----------------

format(c('A', 'BB', 'CCC'), width=5, justify='centre')

format(c('A', 'BB', 'CCC'), width=6, justify='left')

format(c('A', 'BB', 'CCC'), width=3, justify='right')

format(c('A', 'BB', 'CCC'), width=2, justify='none')

#digits
format(1/1:5, digits=2)
format(1/1:5, digits=5)

format( format(1/1:5, digits=2), width=6, justify='c') # center
format( format(1/1:5, digits=2), width=8, justify='r') # center
format( format(1/1:5, digits=10), width=8, justify='r') # center

# big mark
format(123456, big.mark = ',')
format(123456, big.interval = ',')
?big.mark
format(12345.678,big.mark=",",scientific=FALSE)
format(12345.678,big.mark=",",scientific=TRUE)

library(scales)    
comma_format()(1000000)

#sprintf - c styling
?sprintf
sprintf(fmt, ...)
gettextf(fmt, ..., domain = NULL)

sprintf('%f', pi)
sprintf('%.3f', pi)  # 3 decimal places
sprintf('%1.0f', pi)  # 1 integer & 0 decimal
sprintf('%5.1f', pi) # decimal notation 1 decimals
sprintf('%5.2f', pi) # decimal notation 2 decimals
sprintf('%05.1f', pi) # decimal notation 1 decimals inital padding
sprintf('%05.1f', 1234567.12345) # decimal notation 1 decimals inital padding

sprintf('%+f', 1234567.12345) # decimal notation 1 decimals inital padding

sprintf('% f', 1234567.12345) # prefix a space
sprintf('%-10f', 1234567.12345) # left justified
n1 = 12345678.12345678 ; n2=87654321.87654321
sprintf('%-10f', n1,'%+10f', n2)  # only 1 print variable

sprintf('%e', 1234567.12345) # exponential format e
sprintf('%E', 1234567.12345) # exponential format E
sprintf('%g', 1234567.12345) # significant digits default 6
sprintf('%.3g', 1234567.12345) # significant digits default 6
sprintf('%.8g', 123456789123.12345) # significant digits default 6


# Convert objects to strings

toString(17.04)

#combine 2 objects to single string sepearated by commas
toString(c(17.04, 1978))

# combine objects
toString(c('Bonjour', 123, TRUE, NA, log(exp(1))))

# use of width max 
toString(c('One', 'two', '3333333', 444), width=8)
toString(c('One', 'two', '3333333', 444), width=20)
toString(c('One', 'two', '3333333', 444))


# Printing methods

print(1:5)
as.character(1:5)
cat(1:5, sep='-')
paste(1:5)
paste(1:5, collapse='')
toString(1:5)
noquote(as.character(1:5))


# extras
prettyNum(c(123,1234),big.mark=",")
