# Basic Data Manipulation in mtcars
# Adding Columns, Deleting them, Removing them, Selecting them

df3 = mtcars
head(df3)

#adding variables
df3$mpgplus = df3$mpg + 2
head(df3)

#selected variables
varnames = c('mpg', 'wt', 'cyl')
df3[varnames]
#columns to be from any of these
(selected = names(df3) %in% varnames)
df3[selected]

#other than selected columns
df3[-selected]

#remove the column
df3$mpgplus = NULL
head(df3)  
