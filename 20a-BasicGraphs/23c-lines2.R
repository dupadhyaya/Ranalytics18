#multiple lines plot

#base
# Create the data for the chart. rainfall two years
year1 <- c(7,12,28,3,41)
names(year1) = month.abb[6:10]
year2 <- c(14,7,6,19,3)

# store in file(file = "line_chart_2_lines.jpg")
# Plot the bar chart.
plot(year1,type = "o",col = "red", xlab = "Month/Year", ylab = "Rain fall",  main = "Rain fall chart")
lines(year2, type = "o", col = "blue")
legend("topleft", col=c('red','blue'), pch=1, legend=c('year1','year2')) # legend()
#dev.off() # Save the file.
?legend





#wide format
dat <- matrix(runif(40,1,20),ncol=4) # make data
dat
matplot(dat, type = c("b"),pch=1,col = 1:4) #plot
legend("topleft", legend = 1:4, col=1:4, pch=1) # optional legend


#ggplot
# dummy data
set.seed(45)
df <- data.frame(x=rep(1:5, 9), val=sample(1:100, 45), 
     variable=rep(paste0("category", 1:9), each=5))
# plot
df
ggplot(data = df, aes(x=x, y=val)) + geom_line(aes(colour=variable))


#lattice
library(lattice)
xyplot(val~x,type=c('l','p'),groups= variable,data=df,auto.key=T)
