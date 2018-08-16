#tick marks

# Add minor tick marks
library(Hmisc)
minor.tick(nx=n, ny=n, tick.ratio=n)


nx is the number of minor tick marks to place between x-axis major tick marks.
ny does the same for the y-axis. tick.ratio is the size of the minor tick mark relative to the major tick mark. The length of the major tick mark is retrieved from par("tck").
