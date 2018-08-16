# Timing Calculations
#install.packages("ggmap")
#http://aakarner.github.io/blog/2015/03/17/comparing-gtfs-results-from-two-different-sources/

library(ggmap)

#input Origin Destination (it accepts Lat Long info)
from <- c("houston", "houston", "dallas")
to <- c("waco, texas", "san antonio", "houston")

mapdist(from, to, mode = c("transit"))
mapdist(from, to, mode = c("driving"))

from <- c("delhi")
to <- c("noida")
mapdist(from, to, mode = c('walking'))
from <- c("haldwani")
to <- c("kathgodam")
mapdist(from, to, mode = c('walking'))

