# Mean Deviation
x = c(3, 6, 6, 7, 8, 11, 15, 16)
(mx = mean(x))
(mdev = x - mx)
abs(mdev)
(mabsdev = sum(abs(mdev)))/ length(x)
mad(x) # Direct from Formula



#Marks (out of 25): 7, 4, 10, 9, 15, 12, 7, 9, 7
# Calculate MD about Mean, Median, Mode
#http://www.emathzone.com/tutorials/basic-statistics/mean-deviation-and-its-coefficient.html

x = c(7, 4, 10, 9, 15, 12, 7, 9, 7)
mean(x)
median(x)
library(modeest)
md = mlv(x,  method = "mfv")

(MDmean = sum(abs(x - mean(x)))/ length(x))
(CoeffMDMean = MDmean/ mean(x) )

(MDmedian = sum(abs(x - median(x)))/ length(x))
(CoeffMDabtMedian = MDmedian/ median(x) )

md$M
(MDmode = sum(abs(x - md$M))/ length(x))
(CoeffMDabtMode = MDmode/ md$M)


