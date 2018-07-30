# Sort Order Rank

set.seed(123)
(marks = ceiling(runif(11,5,10)))

# sort
sort(marks)

sort(marks, decreasing = TRUE)
sort(-marks)  # wrong
rev(sort(marks))

# NA values and sort later ----

# order
order(marks) # indices
marks
marks[c(6,7,10)]
marks[order(marks)]  # similar to sort(x)
order(marks, decreasing = T)
order(-marks)  # decreasing, this works

length(marks)
marks2 = marks
#insert missing value
marks2[5] = NA  # check with NA Value  : display, position
marks2
order(marks2)  # NA is last
order(marks2, na.last = NA)  # removed
length(marks)  # length is same
is.na(marks2)  # logical vector if NA
anyNA(marks2)  # is there is any NA

order(marks2, na.last = NA)  # 5 removed
order(marks2, na.last = FALSE)   # 5 is first
order(marks2, na.last = TRUE)   # 5 is last
length(order(marks2, na.last = TRUE))   # 5 is last

length(order(marks2, na.last = NA))   # 5 is not there

# rank handles tied values
?rank
marks   # 10-3 times, 8 & - 2 times
sort(marks)
table(marks)

#[1]  6  6  7  8  8  9  9 10 10 10 10
#     1  2  3  4  5  6  7  8  8  9 10  
rank(marks) # ties method = avg, first, last, random , max, min
?rank
table(marks)  # check freq
marks
rank(marks, ties.method='first') # 2-6s - 1,2
#6-1, 6-2, 7-3, 8-4, 8-5, 9-6, 9-7, 10-8, 10-9, 10-10, 10-11
rank(marks, ties.method='average')  # default 2-6's - 5
#all 6s : (1+2)/2 = 3/2=1.5 ; (8+9+10+11)/4= 37/3 = 9.5
rank(marks, ties.method='max')  # 2 6's - 7
#Two 6 -1,2 -> 2 (max): Four 10s - 8,9,10,11 -> 11
rank(marks, ties.method='random')  # put them in unique order
sort(rank(marks, ties.method='random'))

table(marks)
marks

marks2  #  Now check with NA values

sort(marks2)  #NA value missing
length(marks2)
length(sort(marks2))   # 1 less

marks2

# NA values - sort and rank
sort(marks2, na.last=TRUE)  # NA last - 11
sort(marks2, na.last=FALSE)  # NA first  - 11
sort(marks2, na.last='keep')  # Nothing . not shown - 10
length(sort(marks2, na.last='keep'))

marks2
length(marks2)
rank(marks2, na.last=TRUE)  # No effect - avg; NA - largest 11
length(rank(marks2, na.last=TRUE))  # No effect

rank(marks2, na.last=FALSE)  # No effect - Avg; NA - smallest 1
rank(marks2, na.last='keep')  # NA shown as NA


mean(marks2)  # does not work with NA values
mean(marks2, na.rm=T)  # add na.rm=T
