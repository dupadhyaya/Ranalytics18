#ggplot - Line Graph
#http://www.cookbook-r.com/Graphs/Bar_and_line_graphs_(ggplot2)/

dat <- data.frame(
  time = factor(c("Lunch","Dinner"), levels=c("Lunch","Dinner")),
  total_bill = c(14.89, 17.23)
)
dat

# Load the ggplot2 package
library(ggplot2)

# Basic line graph
ggplot(data=dat, aes(x=time, y=total_bill, group=1)) +  geom_line()
## This would have the same result as above
ggplot(data=dat, aes(x=time, y=total_bill)) + geom_line(aes(group=1))

# Add points
ggplot(data=dat, aes(x=time, y=total_bill, group=1)) +  geom_line() + geom_point()

# Change color of both line and points
# Change line type and point type, and use thicker line and larger points
# Change points to circles with white fill
ggplot(data=dat, aes(x=time, y=total_bill, group=1)) +   geom_line(colour="red", linetype="dashed", size=1.5) +   geom_point(colour="red", size=4, shape=21, fill="white")

#---------------
# Change the y-range to go from 0 to the maximum value in the total_bill column, and change axis labels
ggplot(data=dat, aes(x=time, y=total_bill, group=1)) +  geom_line() +
  geom_point() +  expand_limits(y=0) +   xlab("Time of day") + ylab("Total bill") +  ggtitle("Average bill for 2 people")


#------
dat1 <- data.frame(  sex = factor(c("Female","Female","Male","Male")),  time = factor(c("Lunch","Dinner","Lunch","Dinner"), levels=c("Lunch","Dinner")),  total_bill = c(13.53, 16.81, 16.24, 17.42))
dat1
#time: x-axis, sex: color fill/ line color, total_bill: y-axis.

# Basic line graph with points
ggplot(data=dat1, aes(x=time, y=total_bill, group=sex)) +  geom_line() + geom_point()

# Map sex to color
ggplot(data=dat1, aes(x=time, y=total_bill, group=sex, colour=sex)) +  geom_line() +  geom_point()

# Map sex to different point shape, and use larger points
ggplot(data=dat1, aes(x=time, y=total_bill, group=sex, shape=sex)) +  geom_line() +  geom_point()


# Use thicker lines and larger points, and hollow white-filled points
ggplot(data=dat1, aes(x=time, y=total_bill, group=sex, shape=sex)) +  geom_line(size=1.5) +   geom_point(size=3, fill="white") + scale_shape_manual(values=c(22,21))

ggplot(data=dat1, aes(x=sex, y=total_bill, group=time, shape=time, color=time)) +  geom_line() +  geom_point()


#--- final graph
# A line graph
ggplot(data=dat1, aes(x=time, y=total_bill, group=sex, shape=sex, colour=sex)) + 
  geom_line(aes(linetype=sex), size=1) +     # Set linetype by sex
  geom_point(size=3, fill="white") +         # Use larger points, fill with white
  expand_limits(y=0) +                       # Set y range to include 0
  scale_colour_hue(name="Sex of payer",      # Set legend title
                   l=30)  +                  # Use darker colors (lightness=30)
  scale_shape_manual(name="Sex of payer",
                     values=c(22,21)) +      # Use points with a fill color
  scale_linetype_discrete(name="Sex of payer") +
  xlab("Time of day") + ylab("Total bill") + # Set axis labels
  ggtitle("Average bill for 2 people") +     # Set title
  theme_bw() +
  theme(legend.position=c(.7, .4))           # Position legend inside
# This must go after theme_bw

#----------------------- With a numeric x-axis
When the variable on the x-axis is numeric, it is sometimes useful to treat it as continuous, and sometimes useful to treat it as categorical. In this data set, the dose is a numeric variable with values 0.5, 1.0, and 2.0. It might be useful to treat these values as equal categories when making a graph.
datn <- read.table(header=TRUE, text='
supp dose length
  OJ  0.5  13.23
  OJ  1.0  22.70
  OJ  2.0  26.06
  VC  0.5   7.98
  VC  1.0  16.77
  VC  2.0  26.14
')
datn
#With x-axis treated as continuous: A simple graph might put dose on the x-axis as a numeric value. It is possible to make a line graph this way, but not a bar graph.

ggplot(data=datn, aes(x=dose, y=length, group=supp, colour=supp)) +  geom_line() +  geom_point()

#----------With x-axis treated as categorical
#If you wish to treat it as a categorical variable instead of a numeric one, it must be converted to a factor. This can be done by modifying the data frame, or by changing the specification of the graph.

# Copy the data frame and convert dose to a factor
datn2 <- datn
datn2$dose <- factor(datn2$dose)
ggplot(data=datn2, aes(x=dose, y=length, group=supp, colour=supp)) +  geom_line() + geom_point()

# Use the original data frame, but put factor() directly in the plot specification
ggplot(data=datn, aes(x=factor(dose), y=length, group=supp, colour=supp)) +  geom_line() +  geom_point()

#bar # Use the original data frame, but put factor() directly in the plot specification
ggplot(data=datn, aes(x=factor(dose), y=length, fill=supp)) + geom_bar(stat="identity", position=position_dodge())
