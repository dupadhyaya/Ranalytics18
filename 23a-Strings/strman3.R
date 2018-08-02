# String Manipulations2


nchar()  # no of characters
tolower() # convert to lowercase
toupper() # convert to uppercase
casefold() # case folding
chartr()  # character translation
abbreviate()  # abbreviation
substring() # substrings of a character vector
substr()  # substrings of a character vector


#nchar -------------
(c1 = c('How', 'Many', 'Characters?'))
(nchar(c1))
length(c1)

(c2= c('How Many Characters?'))  # white spaces also counted

(nchar(c2))  # white spaces also counted
length(c2)  # no of elements

#tolower
tolower(c1)

toupper(c1)

casefold(c1)
casefold(c1, upper=TRUE)  #opposite
c3 = c('DHIRAJ','UPADHYAYA')
casefold(c3)  # lower case
casefold(c3, upper=TRUE)


chartr( old= 'a',new= 'A', x= c1)  # find a, replace with A
chartr('A', 'a', c3)
chartr('RA', 'a', c3)  # RA is longer than a

sname = c('Achal Kumar','Apoorva Karn','Goldie Sahni','Hitesh Mann','Kaustav Chatterjee','Meena Srisha Valavala','Rashmi Ranjan Mangaraj','Shruti Sinha','Shubham Pujan','Vijay Pal Singh','Lalit Sahni')
chartr('a', 'A', sname)  #multiple replacements

?abbreviate
abbreviate(names.arg, minlength = 4, use.classes = TRUE,
           dot = FALSE, strict = FALSE,
           method = c("left.kept", "both.sides"), named = TRUE)
sname
abbreviate(sname)

colors[1:4]
(some_colors = colors[1:4])
(colors1 = abbreviate(some_colors))

(colors2 = abbreviate(some_colors, minlength = 5))
(colors2 = abbreviate(some_colors, minlength = 5, method='both.sides'))

(aname2 = abbreviate(sname, minlength = 5, method='both.sides'))


# Replace by substr
?substr
substr(x, start, stop)
substring(text, first, last = 1000000L)
substr(x, start, stop) <- value
substring(text, first, last = 1000000L) <- value

substr('bcdef', start=2, stop=4) # extract cde
(x= month.abb[1:6])
substr(x,2,2) <- '#'
x

y= c('may', 'the', 'force', 'be', 'with', 'you')
substr(y,2,3) <- ":)"
y

# replace with recycling
z= c('may', 'the', 'force', 'be', 'with', 'you')
substr(z, 2,1) <- c('#', '@')
substr(z, 2,2) <- c('#', '@')
z

# substring - similar to substr
substring('ABCDEF', 2, 4)
substr('ABCDEF', 2, 4)

substring('ABCDEF', 1:6, 1:6)  # each character

# multiple replacement with recycling ???? check
(text = c('more', 'emotions', 'are', 'better', 'than', 'less'))
substring(text, 1:3) <- c('', 'zzz')
text
(text1 = c('dhiraj','more', 'emotions', 'are', 'better', 'than', 'less'))
substring(text1, 1:3) <- c('', 'yyz')
text1

(sname = c('Achal Kumar','Apoorva Karn','Goldie Sahni','Hitesh Mann','Kaustav Chatterjee','Meena Srisha Valavala','Rashmi Ranjan Mangaraj','Shruti Sinha','Shubham Pujan','Vijay Pal Singh','Lalit Sahni'))
substring(sname, 1:4) <- c('', 'sods')
sname

(sname = c('Achal Kumar','Apoorva Karn','Goldie Sahni','Hitesh Mann','Kaustav Chatterjee','Meena Srisha Valavala','Rashmi Ranjan Mangaraj','Shruti Sinha','Shubham Pujan','Vijay Pal Singh','Lalit Sahni'))
substring(sname, 2:5) <- c('', 'MUIT')
sname

