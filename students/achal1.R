# Extract Strings in R : Achal
#https://cran.r-project.org/web/packages/stringr/vignettes/stringr.html
#https://github.com/siskavera/r4ds_exercises/blob/master/strings.R

data = read.csv(file.choose())
data
str(data)

#Output
User	Group			
A	Cat_Svc_Users			
A	Cat_UXSu_Users			
B	Cat_27_Users			
B	Cat_29_Users			
B	Cat_58_Replay			
B	Cat_58_Users			
B	Cat_UXS_Users			

A	Cat_Svc_Users	Cat_UXSu_Users		
B	Cat_27_Users	Cat_29_Users	Cat_58_Replay	Cat_UXS_Users

#----
User	Group
A	Cat_Svc_Users
A	Cat_UXSu_Users
B	Cat_27_Users
B	Cat_29_Users
B	Cat_58_Replay
B	Cat_58_Users
B	Cat_UXS_Users

library(stringr)

#Extract Character Strings
matchstr1 = "Cat"
matchstr2 = "Cat[^a-zA-Z0-9]"

str_detect()
str_subset()
#(similar to grep() with value = TRUE)`.

# Which strings contain phone numbers?
str_detect(data$Group, matchstr2)
str_subset(data$Group, matchstr2)
str_count(data$Group, matchstr2)
(loc <- str_locate(data$Group, matchstr2))
(locall <- str_locate_all(data$Group, matchstr2))
data


str_extract(data$Group, matchstr2)
str_extract_all(data$Group, matchstr2)
str_extract_all(data$Group, matchstr2, simplify = TRUE)

word(data$Group,1)




#grep
# some text
text=data$Group
# pattern
pat = "Cat"
# default usage
grep(pat, text)
regexec(pat,text)
strsplit(text, ' ')
strsplit('Dhiraj Upadhyaya', ' ')
text
str_extract_all(text, 'Cat_[A-Za-z0-9]{1}')
words = c('Cat_27_Users', 'Cat_29_Users')
grep('Cat', words)
grepl('Cat', words)
grepl("\\<Cat", words)    
matchstr3 = "\\<Cat"
str_extract_all(data$Group, matchstr3)

matchstr3 = "\bCat"
str_extract_all(data$Group, matchstr3)
matchstr4 = "Cat_[a-zA-Z0-9_]{8}"

str_match_all(data$Group, matchstr4)


st = list(words)
st = text
st = data$Group
t = str_match_all(st, "\\bCat_[a-zA-Z0-9_]+\\b")
t


as.data.frame(str(t))
