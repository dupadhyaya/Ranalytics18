# FD

#Eg2 https://cnx.org/contents/yTlmgmzh@4/Frequency-Relative-Frequency-a
# Entering the data : 20 records
hours.worked = c(5, 6, 3, 3, 2, 4, 7, 5, 2, 3, 5, 6, 
                 5, 4, 4, 3, 5, 2, 5, 3)

# A general frequency table
table(hours.worked)
## hours.worked
## 2 3 4 5 6 7 
## 3 5 3 6 2 1

# Relative frequency table
length(hours.worked)
table(hours.worked)/length(hours.worked)
## hours.worked
##    2    3    4    5    6    7 
## 0.15 0.25 0.15 0.30 0.10 0.05

# To get cumulative frequencies, we need to put
# the hours into different intervals
x = table(cut(hours.worked, breaks = c(1:7)))
x
# Cumulative frequencies
cumsum(x)
## (1,2] (2,3] (3,4] (4,5] (5,6] (6,7] 
##     3     8    11    17    19    20

# Cumulative relative frequencies
cumsum(x)/length(hours.worked)
## (1,2] (2,3] (3,4] (4,5] (5,6] (6,7] 
##  0.15  0.40  0.55  0.85  0.95  1.00


