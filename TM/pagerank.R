#Page Rank

#install.packages('igraph')
library(igraph)

mygraph = graph(c('A','B',
                  'A','D',
                  'B','A',
                  'B','B',
                  'B','C',
                  'C','C',
                  'A','D',
                  'C','D',
                  'C','A'), directed=T)
plot(mygraph, cex=1.5)
