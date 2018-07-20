# Find Interval

table<- data.frame(population=c(100, 300, 5000, 2000, 900, 2500), 
                   habitat=c(1,2,3,4,5,6))
table
table$size <- findInterval(table$population, c(0, 500, 1000, 2000, 3000, 5000), rightmost.closed = TRUE)
table
