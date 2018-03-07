library(readr)
maths = read_csv('./grades/grades.csv')
maths
str(maths)
names(maths)
head(maths)
dim(maths)
library(knitr)
kable(head(maths[,5:9]))


#subsetting & Cleaning
dim(maths)      # 100 rows, 13 colns
#general info like comments can be dropped
#dplyr - select, contains
library(dplyr)
names(maths)
maths2 = select(maths, `student`, contains('Internal ')
    , contains('Viva'), contains('Assignment'),  contains('Attendance')
    , contains('Final'), contains('Assessment')
    , contains('Grade'), - contains('Comment'))
maths2
names(maths2)
head(names(maths2))

# removing long names from anems
# stringr - str_sub, str_trim

library(stringr) 
dim(maths2)
names(maths2)[1:8]
str_sub(names(maths2)[2:3], start=1, end=-8) # only 2 & 3 have long names
names(maths2)[2:3] = str_sub(names(maths2)[2:3], start=1, end=-8)
names(maths2)

names(maths2) = str_trim(names(maths2)) # remove blank spaces
names(maths2)
dim(maths2)

# multiple colns - collapse - key value pairs
library(tidyr)
tidy_maths = gather(maths2, item,score,2:6)
head(tidy_maths)
dim(tidy_maths)

kable(tidy_maths)

#add another column based on certain values
tidy_maths2 = mutate(tidy_maths, type = ifelse(grepl('Internal', item), 'Internals',
    ifelse(grepl('Viva', item), 'Viva',
    ifelse(grepl('Attendance', item),'Attendance',
    ifelse(grepl('Assignment', item),'Assignment','Other' )))),
    result=ifelse(`Calculated Grade` > 60,'Passed', 'Failed'))

head(tidy_maths2)
table(tidy_maths2$type)

str(tidy_maths2)

library(magrittr)
str(tidy_maths2)
names(maths)
maths3 = maths[c('student', 'course', 'batch', 'gender')]
rich_maths = left_join(tidy_maths2, maths3, by='student')
rich_maths

rich_maths %>% filter(score > 0, type=='Viva') %>% group_by(student) %>%
  summarize(Viva_Mean = round(mean(score),2)) %>% arrange(desc(Viva_Mean)) %>% head(n=10) %>% kable()  

rich_maths %>% filter(score > 0, type=='Internals') %>% group_by(item) %>%
  summarize(Mean = mean(score), Median=median(score), Std_dev = sd(score)) %>% kable()  

table(rich_maths$type)
rich_maths %>% filter(score > 0, type=='Attendance' | type== 'Viva') %>%  
  group_by(gender, type) %>% summarize(Mean_Score= round(mean(score),2))

cor(rich_maths$score, rich_maths$Final)

# Correlation
rich_maths %>% group_by(item) %>% summarize(corr_to_final = round(cor(score,Final),2)) %>%
  arrange(corr_to_final) %>% head() %>% kable()
x1 = rich_maths %>% group_by(item)
names(x1)

library(ggplot2)
ggplot(rich_maths, aes(Final)) + geom_histogram(binwidth=5, fill='lightgreen', 
   color='black') + ggtitle('Histogram') + theme_minimal()

ggplot(rich_maths, aes(`Calculated Grade`)) + geom_histogram(binwidth=5, fill='lightgreen', 
      color='black') + ggtitle('Histogram') + theme_minimal()

ggplot(rich_maths, aes(`score`)) + geom_histogram(binwidth=2, fill='lightgreen', 
       color='black') + ggtitle('Histogram') + facet_wrap(~item) +
       theme_minimal()
  