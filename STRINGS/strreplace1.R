
x = '0_0_01-09-2013_0'
gsub('_', ',',x)
gsub('_', ',',x, fixed=T)
sub('_', ',',x)  # only 1st occurance
library(stringr)
str_replace_all(x, "_", ",")

library(stringi)
stri_replace_all(x, ",", fixed="_")


#----
library(tidyverse)
text_string = "developer"

# This works fine
x %>% str_replace_all(c('_' =',')) 

# But this is not what I want
x %>% str_replace_all(c('_' =", ", '-' = "/"))


casefold('DHiraj Upadhyaya', upper=T)
casefold('DHiraj Upadhyaya', upper=F)


chartr('a', 'A', 'This is a boring string')
chartr("_", ",", x)
