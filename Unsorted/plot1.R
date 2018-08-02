

# collect the values together, and assign them to a variable called y
c(6,10,10,17,7,12,7,11,6,16,3,8,13,8,7,12,6,5,10,9) -> y
hist( y ) -> h # do a histogram of y and assign its info to h
h$counts <- cumsum(h$counts) # replace the cell freq.s by cumulative freq.s
plot( h ) # plot a cumulative histogram of y


plot(sort(y), 1:length(y)) # plot rank on value of y

plot(y, rank(y))

n <- length(y)
p <- (.5:n)/n
plot(sort(y),p)
points(sort(y),1-p)
abline(v=median(y))
