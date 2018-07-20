# Bar Plot
# Simple Bar Plot 
counts <- table(mtcars$gear)
barplot(counts, main="Car Distribution",  xlab="Number of Gears")
#which cars have max type of gears

# Simple Horizontal Bar Plot with Added Labels 
counts <- table(mtcars$gear)
counts
barplot(counts, main="Car Distribution", horiz=TRUE,
        names.arg=c("3 Gears", "4 Gears", "5 Gears"))

# Stacked Bar Plot with Colors and Legend
counts <- table(mtcars$vs, mtcars$gear)
counts
barplot(counts, main="Car Distribution by Gears and VS",
        xlab="Number of Gears", col=c("darkblue","red"),
        legend = rownames(counts))
#what is distribution of Engine Type for each gear type
#which type of engines are max in gear3

# Grouped Bar Plot
counts <- table(mtcars$vs, mtcars$gear)
counts
barplot(counts, main="Car Distribution by Gears and VS",
        xlab="Number of Gears", col=c("darkblue","red"),
        legend = rownames(counts), beside=TRUE)

# Fitting Labels 
par(las=2) # make label text perpendicular to axis
par(mar=c(5,8,4,2)) # increase y-axis margin.

counts <- table(mtcars$gear)
barplot(counts, main="Car Distribution", horiz=TRUE, names.arg=c("3 Gears", "4 Gears", "5   Gears"), cex.names=0.8)

