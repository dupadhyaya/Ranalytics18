# dplyr row names
library(dplyr)

head(iris)
iris %>% head()

head(mtcars)
mtcars[1:2]
mtcars %>% select(mpg,wt)
df = mtcars
df2 = mtcars
head(df)
df = tibble::rownames_to_column(df, var='cars')
names(df)
df %>% select(mpg,wt,cars)

#has
tibble::has_rownames(mtcars)
tibble::has_rownames(df)

#remove rownames  
#see without rownames
head(df2[1:5])
tibble::remove_rownames(df2)



#rowid as column
tibble::rowid_to_column(df, var = "rowid")

#column to rownames
head(df[1:5])
tibble::column_to_rownames(df, var = "cars")
