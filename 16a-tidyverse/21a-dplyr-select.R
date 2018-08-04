# Select only selected variabels

iris4 = iris
head(iris4)
head(iris <- tbl_df(iris)) # so it prints a little nicer
select(iris, starts_with("Petal"))  # column name starts with
select(iris, ends_with("Width"))
select(iris, contains("etal"))
select(iris, matches(".t."))
select(iris, Petal.Length, Petal.Width)
vars <- c("Petal.Length", "Petal.Width")
select(iris, one_of(vars))

df <- as.data.frame(matrix(runif(100), nrow = 10))
df
df <- tbl_df(df[c(3, 4, 7, 1, 9, 8, 5, 2, 6, 10)])
df
select(df, V4:V6)
select(df, num_range("V", 4:6))


#select-----

