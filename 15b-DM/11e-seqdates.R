#Value Generation  - year/months

month.abb[1:12]
month.name[1:10]
month
seq.Date(from='2018/01/07', to='2018/01/07')
month[4]

seq(from, to, by, length.out = NULL, along.with = NULL, ...)
#from / to - start date(reqd), end date(Optional)
#by	increment of the sequence. Optional. See ‘Details’.
#length.out	- integer, optional. Desired length of the sequence.
#along.with	- take the length from the length of this argument.

## first days of years
seq(as.Date("2000/1/1"), as.Date("2018/7/1"), "years")
## by month
seq(as.Date("2018/1/1"), by = "month", length.out = 7)
## quarters
seq(as.Date("2018/1/1"), as.Date("2018/7/1"), by = "quarter")
seq(as.Date("2018/7/1"), as.Date("2018/7/22"), by = "day")
