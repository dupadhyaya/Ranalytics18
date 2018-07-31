# Descriptive Analysis : mtcars  using : dplyr

df1 = mtcars # make a copy and do analysis on df
head(df1)
str(df)
#what ways we can have summary

# convert relevant cols to factor (can be ordered also)
factorcols = c('cyl','vs', 'am', 'gear', 'carb')

df1[factorcols] = lapply(df1[factorcols] ,factor, ordered=T)
sapply(df1, class)
str(df1)
unique(abbreviate(rownames(df1)))

# Now do summarisation
#attach(df1)
names(df1)
table(df1$cyl)  #cylinder wise summary
table(df1$am) #transmission wise

#combine it in single command 
sapply(df1[factorcols],table)


# Find Numeric Cols and numerical summaries on them
sapply(df1, is.numeric)
(numcols = sapply(df1, is.numeric))
class(numcols)
(numcols = names(df1[numcols]))
head(df1[numcols])

colSums(df1[numcols])
colSums(df1[numcols],dims=1)
colMeans(df1[numcols],dims=1)

colMeans(df1[c('mpg','disp', 'hp')])
colMeans(df1[numcols[c(1:3)]])

#Look for other summarisation and grouping
aggregate(df1[numcols], by=list(df1$cyl), FUN=mean)
aggregate(hp + disp ~ am, data=df1, FUN=mean)  #sum of 2 cols wrt 3 col
aggregate(hp + disp ~ am + cyl, data=df1, FUN=mean)  #sum of 2 cols wrt 2 col


#---------------------------------------------------------
#using dplyr package
library(dplyr)
library(tibble)


#Two ways of using dplyr
df1 %>% slice(1:4)  #pipe it
slice(df1, 1:4)  # use object inside command

#dplyr does not display rownames when do manipulation , so
df1 %>% tbl_df()
df1 %>% add_rownames()  #depreciated, will not be used in future
df1 %>% tibble::rownames_to_column()

# add column with abbreviated names
length(unique(abbreviate(rownames(df1))))
df1$name = abbreviate(rownames(df1))
head(df1)  

#all rows having numeric col values > 3
df1 %>%  filter_if(is.numeric, all_vars(. >= 3.5))

#Top mileage from each cyl type, what is its hp
df1 %>% select(cyl, mpg, hp, name) %>% group_by(cyl) %>% arrange(desc(mpg)) %>% top_n(n=1)

# Average Mileage & disp by cyl
df1 %>% group_by(cyl) %>% select(cyl, mpg) %>% summarize(mean_mpg = mean(mpg, na.rm = TRUE))

head(df1)
#groupby cyl,gear, carb: avg mpg, min disp
df1 %>% filter(am == 0) %>% group_by(cyl, gear,carb) %>% summarize(mpg_avg = mean(mpg, na.rm = TRUE), disp_min = min(disp, na.rm = TRUE))

#Count
df1 %>%   group_by(cyl) %>%  tally()
df1 %>%   group_by(cyl, am) %>%  tally()

#Filter
df1 %>% filter(cyl == 4 & mpg > 25) %>% select(name, mpg, cyl, wt)

#sample
df1 %>% sample_frac(0.2, replace = TRUE)  %>% select(name, mpg, cyl) #with replacement
df1 %>% sample_frac(0.2, replace = F)  %>% select(name, mpg, cyl) #w/o replacement
df1 %>% sample_n(3, replace = F)  %>% select(name, mpg, cyl) #numbers instead for %

#few rows
slice(df1, 10:15)

# Rows 
head(df1)
df1 %>% slice(1:5)
slice(df1, 1:5)
df1 %>% slice(-5) # -5th row
df1 %>% slice(-(5:10)) # -5th to 10th
df1 %>% slice(1:(n()-10)) 
df1 %>% slice(seq(1,n(),3)) #every 3rd



names(df1)
#defaults to the last variable in the table
df1 %>% group_by(cyl) %>% top_n(2)  #Rank not data qsec
# top_n(n = 5, wt = x)
df1 %>% group_by(cyl) %>% top_n(2,wt=mpg)  #Rank not data wrt mpg
#21mpg for 6 are 2 rows

df1 %>% top_n(-2, wt=mpg) %>% select(name, mpg,wt) #bottom 2 ranks - see 3 values

df1 %>% group_by(cyl) %>% tally()  #total count

df1 %>% select(name,mpg, cyl) %>% top_n(1, mpg)

#Selecting Columns
names(df1)
df1 %>% select(1:5)
df1 %>% select(contains('s'))  %>% head()
df1 %>% select(starts_with('d')) %>% head()
df1 %>% select(ends_with('s')) %>% head()
df1 %>% select(everything()) %>% head()
#first col is wt
df1 %>% select(wt, everything()) %>% select(1:5) %>% select(-2) %>% head()
names(df1)


# Summarise
df1 %>% summarise(mpg_ave = mean(mpg))
df1 %>% group_by(cyl) %>% summarise(mean_ave = mean(mpg),wt_sum = sum(wt))
df1 %>% group_by(cyl, am) %>% select(numcols) %>% summarise_each( funs(mean))
factorcols
df1 %>% group_by(cyl, vs) %>% count(am, gear)



#Summary Functions
v1 = df1$mpg
v1
v1 %>% first
v1 %>% last
v1 %>% sd
v1 %>% mean
v1 %>% n_distinct()



