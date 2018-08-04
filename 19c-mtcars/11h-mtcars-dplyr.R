#dplyr - mtcars
library(dplyr)

#Filter----

filter(mtcars, cyl == 8)
filter(mtcars, cyl < 6)

# Multiple criteria
filter(mtcars, cyl < 6 & vs == 1)
filter(mtcars, cyl < 6 | vs == 1)

# Multiple arguments are equivalent to and
filter(mtcars, cyl < 6, vs == 1)


filter(mtcars, row_number() == 1L)
filter(mtcars, row_number() == n())
filter(mtcars, between(row_number(), 5, n()))



#mutate----
mutate(mtcars, displ_l = disp / 61.0237) #keeps other col
transmute(mtcars, displ_l = disp / 61.0237) #removes other cols
mutate(mtcars, cyl = NULL) #do not display cyl


#slice-----
slice(mtcars, 1L)
slice(mtcars, n())
slice(mtcars, 5:n())
slice(mtcars, c(2,4,5,10))

(by_cyl <- group_by(mtcars, cyl)) # ???
slice(by_cyl, 1:2)

#structure----
tbl_df(mtcars) # convert to tbl class
glimpse(mtcars)  # dense summary of tbl data
View(mtcars) # spreasheet like form base pacakge



#rownames----
df = tibble::rownames_to_column(df, var='cars')
df2 = mtcars
names(df)

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

mtcars %>% group_by(am) 
#nothing - just separation

mtcars %>% group_by(am) %>% summarise(mean(mpg), max(wt))


#summarise----
summarise(mtcars, mean(disp))  
summarise(group_by(mtcars, cyl), mean(disp)) 
summarise(group_by(mtcars, cyl), m = mean(disp), sd = sd(disp))


#summarise_all
mtcars %>% group_by(am, gear) %>% summarise_all(mean)
mtcars %>% group_by(am, gear)%>% summarise_all(c("min", "max"))
mtcars %>% group_by(am, gear)%>% summarise_all(funs(med = median))



#without Group
mtcars %>% summarise(mean(mpg), max(wt))
mtcars %>% summarise_all(mean)
mtcars %>% select(wt, gear)%>% summarise_all(c("min", "max"))
mtcars %>% summarise_all(funs(med = median))





mtcars %>% summarise_if(is.numeric, mean, na.rm = TRUE)
iris %>% summarise_if(is.numeric, mean, na.rm = TRUE)

#specific columns
mtcars %>% summarise_at(c("mpg", "wt"), mean, na.rm = TRUE)


#------------------------------------
#unsortd----
dplyr::tbl_df(iris)
print(dplyr::tbl_df(mtcars), n=20)  #display more columns and rows
#print(dplyr::tbl_df(mtcars), width=11)
tbl_df(mtcars) %>% print(n = Inf)
tbl_df(mtcars) %>% print(width = Inf)
tbl_df(mtcars) %>% as.data.frame(mtcars)

glimpse(mtcars)
df = mtcars
row.names(df) = NULL
df %>% select(mpg)
#head(mtcars)
select(mtcars, mpg, vs)
mtcars %>% dplyr::select(vs, mpg, wt)
mtcars %>% group_by(cyl) %>% summarise(avgwt = mean(wt), meanhp = mean(hp)) %>% arrange( desc(meanhp), avgwt)
mtcars

names(mtcars)
filter(mtcars, mpg > 23 | wt < 2)
mtcars %>% filter(mpg > 23 & wt > 2)
mtcars %>% select(mpg, wt) %>% filter(mpg > 23) 
mtcars %>% 
  
  filter(iris, Sepal.Length > 7)
filter(mtcars, cyl == 4)
distinct(mtcars)
df  = data.frame(a=c(2,2),b=c(2,2))
df
distinct(df)

sample_frac(mtcars, 0.2, replace=T)
sample_n(mtcars, 60, replace=T) %>% select(mpg)
slice(mtcars,10:14)
top_n(mtcars,-2, mpg)

select(mtcars, mpg) %>% arrange(desc(mpg))
#Columns
select(mtcars, mpg, wt)
select(mtcars, contains('a'))
names(mtcars)
select(mtcars, contains ='vs')
select(mtcars, everything())

mtcars %>% group_by(cyl, am) %>% summarise_all(mean)

df = data.frame(marks=c(1,2,3,7,1))
cbind(df, dplyr::mutate_each(df, funs(min_rank)))

mtcars %>% lead() %>% lag()
dplyr::n(mtcars)
select(mtcars, mpg2 = mpg)

df = mtcars[1:4]
names(df) = c('MPG','C1','C2','C3')
df= rename(df, C5=C1)
names(df)
df
rename(df, marks2 = marks)
df %>% mutate(marks2 = marks + 2, marks3 = marks + 4)
df %>% transmute(marks2 = marks + 2, marks3 = marks + 4)

library(nycflights13)
data(flights)


destinations <- group_by(flights, dest)
destinations
summarise(destinations,
          planes = n_distinct(tailnum),
          flights = n()
)


select(iris, -ends_with("Width")) %>% head
vars <- c("Petal.Length", "Petal.Width1")
select(iris, from=1, to=n()) 
filter(mtcars, row_number() == n())
filter(mtcars, between(row_number(), 5, n()))

mtcars %>% group_by(cyl) %>% filter(1:3)
> mtcars %.% group_by(cyl) %.% filter(sample(n(), 10))
group_by( mtcars, cyl ) %>% integer_filter(1:2)
?integer_filter


# Select odd
mtcars %>% slice(from = 1, to = n(), by = 2)
# Select even
slice(mtcars, from = 2, to = n(), by = 2)
# Select first 10
slice(mtcars, from = 1, to = 10)
# Select last 10
slice(mtcars, n()-10: n())
slice(mtcars, 1:4)
mtcars

df <- tibble(
  g1 = c(1, 1, 2, 2, 2),
  g2 = c(1, 2, 1, 2, 1),
  a = sample(5), 
  b = sample(5)
)
df
df %>%  slice(n()-2:n())

var1 <- quo(letters[1:5])
var1
quo(toupper(!!var1))

# Here we capture `letters[1:5]` as an expression:
quo(toupper(letters[1:5]))
#> ~toupper(letters[1:5])

# Here we capture the value of `letters[1:5]`
quo(toupper(!!letters[1:5]))
#> ~toupper(c("a", "b", "c", "d", "e"))
quo(toupper(UQ(letters[1:5])))
#> ~toupper(c("a", "b", "c", "d", "e"))
#
toupper(letters[1:5])
quote(toupper(letters[1:5]))

head(mtcars)
slice(mtcars, 1:5)
slice(mtcars, 1)  #rowno missing, first row
slice(mtcars, 1L)

tail(mtcars,n=5)
slice(mtcars, n()-5:n())
slice(mtcars, n()) #last row
slice(mtcars, n() - 1) #2nd last row

mtcars %>% top_n(2)
mtcars %>% top_n(-2)
mtcars %>% group_by(cyl) %>% tally(cyl) %>% top_n(1, cyl)
dim(mtcars)
bind_rows(mtcars, mtcars)
bind_cols(mtcars,mtcars)
gtable_combine(list(mtcars, mtcars))
dim_desc(mtcars)

# combine applies the same coercion rules
f1 <- factor("a")
f2 <- factor("b")
c(f1, f2)
unlist(list(f1, f2))

gtable_combine(f1, f2)
gtable_combine(list(f1, f2))

slice( mtcars, c(1L,3L,2L,7L)) 

by_cyl <- mtcars %>% group_by(cyl)
# Select first row in each group
mtcars %>% slice(1)
by_cyl %>% slice(1)
# Select last row in each group
mtcars %>% slice(n())
by_cyl %>% slice(n())
# Rows not present in group silently ignored
mtcars %>% slice(10)
by_cyl %>% slice(10)

# Select arbitrary rows
mtcars %>% slice(1:9)
by_cyl %>% slice(1:3)

mtcars %>% slice(c(1, 3, 9))
by_cyl %>% slice(c(1, 3, 5))

# Select even rows
mtcars %>% slice(seq(2, n(), by = 2))
by_cyl %>% slice(seq(2, n(), by = 2)) %>% select(cyl, everything())

# Drop first row in each group
mtcars %>% group_by(cyl, am) %>% slice(1)
by_cyl %>% slice(1)

# Returns all values
by_cyl %>% slice()




df <- data.frame(x = c(10, 4, 1, 6, 3, 1, 1))
df %>% top_n(2)

# Negative values select bottom from group. Note that we get more
# than 2 values here because there's a tie: top_n() either takes
# all rows with a value, or none.
df %>% top_n(-2)



