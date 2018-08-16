#axis Labels and titles in R

plot(faithful, main = "Eruptions of Old Faithful",
     xlab = "Eruption time (min)",
      ylab = "Waiting time to next eruption (min)")

# Specify axis options within plot() 
plot(x, y, main="title", sub="subtitle",
     xlab="X-axis label", ylab="y-axix label",
     xlim=c(xmin, xmax), ylim=c(ymin, ymax))



#axis

axis(side, at=, labels=, pos=, lty=, col=, las=, tck=, ...)

# side	an integer indicating the side of the graph to draw the axis (1=bottom, 2=left, 3=top, 4=right)
# at	a numeric vector indicating where tic marks should be drawn
# labels	a character vector of labels to be placed at the tickmarks 
# (if NULL, the at values will be used)
# pos	the coordinate at which the axis line is to be drawn. 
# (i.e., the value on the other axis where it crosses)
# lty	line type
# col	the line and tick mark color
# las	labels are parallel (=0) or perpendicular(=2) to axis
# tck	length of tick mark as fraction of plotting region (negative number is outside graph, positive number is inside, 0 suppresses ticks, 1 creates gridlines) default is -0.01
# (...)


# A Silly Axis Example

# specify the data 
x <- c(1:10); y <- x; z <- 10/x

# create extra margin room on the right for an axis 
par(mar=c(5, 4, 4, 8) + 0.1)

# plot x vs. y 
plot(x, y,type="b", pch=21, col="red", 
     yaxt="n", lty=3, xlab="", ylab="")

# add x vs. 1/x 
lines(x, z, type="b", pch=22, col="blue", lty=2)

# draw an axis on the left 
axis(2, at=x,labels=x, col.axis="red", las=2)

# draw an axis on the right, with smaller text and ticks 
axis(4, at=z,labels=round(z,digits=2),
     col.axis="blue", las=2, cex.axis=0.7, tck=-.01)

# add a title for the right axis 
mtext("y=1/x", side=4, line=3, cex.lab=1,las=2, col="blue")

# add a main title and bottom and left axis labels 
title("An Example of Creative Axes", xlab="X values",
      ylab="Y=X")