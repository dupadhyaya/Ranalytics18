#Importing from ggsheet
#install.packages('gsheet')
library(gsheet)

regr1 = "https://docs.google.com/spreadsheets/d/1QogGSuEab5SZyZIw1Q8h-0yrBNs1Z_eEBJG7oRESW5k/edit#gid=107865534"

logr1 = "https://docs.google.com/spreadsheets/d/1QogGSuEab5SZyZIw1Q8h-0yrBNs1Z_eEBJG7oRESW5k/edit#gid=560796239"

df1 = as.data.frame(gsheet2tbl(regr1))
df2 = as.data.frame(gsheet2tbl(logr1))
str(df)
df2
summary(df1)
summary(df2)



#
docurl = "https://docs.google.com/spreadsheets/d/"
sheeturl = paste0("1QogGSuEab5SZyZIw1Q8h-0yrBNs1Z_eEBJG7oRESW5k","/edit#gid=")
sheetname = "560796239"
fullurl = paste0(docurl, sheeturl, sheetname)
fullurl
df = as.data.frame(gsheet::gsheet2tbl(fullurl))
summary(df)
str(df)
