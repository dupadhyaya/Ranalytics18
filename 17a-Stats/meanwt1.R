#mean Weighted

wt = c(5,  5,  4,  1 )
rwt = wt/ sum(wt)
pie(rwt)
rwt  # relative weight of each subject
x = c(3.7,3.3,3.5,2.8)  #marks of subject
(xm = weighted.mean(x, rwt)) # Grade Point Average

(xm2 = sum(x * rwt))
