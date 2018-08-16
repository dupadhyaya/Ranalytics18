
##======================================================##
##                                                      ##
##    NetSciX School of Code Workshop                   ##
##    Network analysis with R and igraph                ##
##    Wroclaw, Poland, January 10 2016                  ##
##                                                      ##
##    Katya Ognyanova, katya@ognyanova.net              ##
##    www.kateto.net/netscix2016                        ##
##                                                      ##
##======================================================##


# Handouts and example data: bitly.com/netscix2016  
# Online version of the tutoiral: kateto.net/netscix2016

# CONTENTS
# 1. A quick R introduction/refresher
# 2. Networks in igraph
# 3. Reading network data from files
# 4. Turning networks into igraph objects
# 5. Plotting networks with igraph
# 6. Network and node descriptives
# 7. Distances and paths
# 8. Subgroups and communities
# 9. Assortativity and Homophily


# Install the package "igraph" if you don't have its latest version (1.0.1) 
# The package (www.igraph.org) is maintained by Gabor Csardi and Tamas Nepusz.

 install.packages("igraph") 


# ================ 1. A quick R introduction/reminder ================


# You can assign a value to an object using assign(),  "<-", or "=".

x <- 3         # Assignment
x              # Evaluate the expression and print result

y <- 4         # Assignment
y + 5          # Evaluation, y remains 4

z <- x + 17*y  # Assignment
z              # Evaluation

rm(z)          # Remove z: deletes the object.
z              # Error!


#  ------->> Value comparisons: --------

# Comparisons return boolean values: TRUE or FALSE (often abbreviated to T and F)
 
2==2  # Equality
2!=2  # Inequality
x <= y # less than or equal: "<", ">", and ">=" also work


#  ------->> Special constants -------- 

# NA, NULL, Inf, -Inf, NaN

# NA - missing or undefined data
5 + NA      # When used in an expression, the result is generally NA
is.na(5+NA) # Check if missing

# NULL - an empty object, e.g. a null/empty list
10 + NULL     # use returns an empty object (length zero)
is.null(NULL) # check if NULL

# Inf and -Inf represent positive and negative infinity
# They can be returned by  mathematical operations like division of a number by zero:

5/0
is.finite(5/0) # Check if a number is finite

# NaN (Not a Number) - the result of an operation that cannot be reasonably defined 
0/0
is.nan(0/0)


#  ------->> Vectors --------  

v1 <- c(1, 5, 11, 33)       # Numeric vector, length 4
v2 <- c("hello","world")    # Character vector, length 2 (a vector of strings)
v3 <- c(TRUE, TRUE, FALSE)  # Logical vector, same as c(T, T, F)

# Combining different types of elements in one vector will coerce the elements 
# to the least restrictive type:

v4 <- c(v1,v2,v3,"boo") 	# All elements turn into strings

# Other ways to create vectors:
v <- 1:7         # same as c(1,2,3,4,5,6,7)  
v <- rep(0, 77)  # repeat zero 77 times: v is a vector of 77 zeroes
v <- rep(1:3, times=2) # Repeat 1,2,3 twice  
v <- rep(1:10, each=2) # Repeat each element twice  
v <- seq(10,20,2) # sequence: numbers between 10 and 20, in jumps of 2  

length(v)        # check the length of the vector

v1 <- 1:5         # 1,2,3,4,5
v2 <- rep(1,5)    # 1,1,1,1,1 

# Element-wise operations:
v1 + v2      # Element-wise addition
v1 + 1       # Add 1 to each element
v1 * 2       # Multiply each element by 2
v1 + c(1,7)  # This doesn't work: (1,7) is a vector of different length

# Mathematical operations:
sum(v1)      # The sum of all elements
mean(v1)     # The average of all elements
sd(v1)       # The standard deviation
cor(v1,v1*5) # Correlation between v1 and v1*5 

# Logical operations:
v1 > 2       # Each element is compared to 2, returns logical vector
v1==v2       # Are corresponding elements equivalent, returns logical vector.
v1!=v2       # Are corresponding elements *not* equivalent? Same as !(v1==v2)
(v1>2) | (v2>0)   # | is the boolean OR, returns a vector.
(v1>2) & (v2>0)   # & is the boolean AND, returns a vector.
(v1>2) || (v2>0)  # || is the boolean OR, returns a single value
(v1>2) && (v2>0)  # && is the boolean AND, ditto

# Vector elements
v1[3]             # third element of v1
v1[2:4]           # elements 2, 3, 4 of v1
v1[c(1,3)]        # elements 1 and 3 - note that your indexes are a vector
v1[c(T,T,F,F,F)]  # elements 1 and 2 - only the ones that are TRUE
v1[v1>3]          # v1>3 is a logical vector TRUE for elements >3

# NOTE: If you are used to languages indexing from 0, R will surprise you by indexing from 1.

# To add more elements to a vector, simply assign them values.
v1[6:10] <- 6:10

# We can also directly assign the vector a length:
length(v1) <- 15 # the last 5 elements are added as missing data: NA


#  ------->> Factors --------

# Factors are used to store categorical data.

eye.col.v <- c("brown", "green", "brown", "blue", "blue", "blue")         #vector
eye.col.f <- factor(c("brown", "green", "brown", "blue", "blue", "blue")) #factor
eye.col.v
eye.col.f

# R will identify the different levels of the factor - e.g. all distinct values. 
# The data is stored internally as integers - each number corresponding to a factor level.

levels(eye.col.f)  # The levels (distinct values) of the factor (categorical variable)

as.numeric(eye.col.f)  # The factor as numeric values: 1 is  blue, 2 is brown, 3 is green
as.numeric(eye.col.v)  # The character vector, however, can not be coerced to numeric

as.character(eye.col.f)  
as.character(eye.col.v) 

#  ------->> Matrces & Arrays --------  

# A matrix is a vector with dimensions:
m <- rep(1, 20)   # A vector of 20 elements, all 1
dim(m) <- c(5,4)  # Dimensions set to 5 & 4, so m is now a 5x4 matrix

# Create a matrix using matrix():
m <- matrix(data=1, nrow=5, ncol=4)  # same matrix as above, 5x4, full of 1s
m <- matrix(1,5,4) 			             # same matrix as above
dim(m)                               # What are the dimensions of m?

# Create a matrix by combining vectors:
m <- cbind(1:5, 5:1, 5:9)  # Bind 3 vectors as columns, 5x3 matrix
m <- rbind(1:5, 5:1, 5:9)  # Bind 3 vectors as rows, 3x5 matrix

m <- matrix(1:10,10,10)

# Select matrix elements: 
m[2,3]  # Matrix m, row 2, column 3 - a single cell
m[2,]   # The whole second row of m as a vector
m[,2]   # The whole second column of m as a vector
m[1:2,4:6] # submatrix: rows 1 and 2, columns 4, 5 and 6
m[-1,]     # all rows *except* the first one

m[1,]==m[,1]  # Are elements in row 1 equivalent to corresponding elements from column 1? 
m>3           # A logical matrix: TRUE for m elements >3, FALSE otherwise
m[m>3]        # Selects only TRUE elements - that is ones greater than 3


t(m)          # Transpose m     
m <- t(m)     # Assign m the transposed m
m %*% t(m)    # %*% does matrix multiplication
m * m         # * does element-wise multiplication

# Arrays: more than 2 dimensions
# Created with the array() function:

a <- array(data=1:18,dim=c(3,3,2)) # 3d with dimensions 3x3x2
a <- array(1:18,c(3,3,2))          # the same array


#  ------->> Lists --------  

# Lists are collections of objects (e.g. of strings, vectors, matrices, other lists, etc.)

l1 <- list(boo=v1,foo=v2,moo=v3,zoo="Animals!")  # A list with four components
l2 <- list(v1,v2,v3,"Animals!")

l3 <- list()
l4 <- NULL

l1["boo"]      # Access boo: this returns a list.
l1[["boo"]]    # Access boo: this returns the numeric vector
l1[[1]]        # Returns the first component of the list, equivalent to above.
l1$boo         # Named elements can be accessed using the $ operator - equivalent to [[]]

# Add more elements to a list:
l3[[1]] <- 11 # add an element to the empty list l3
l4[[3]] <- c(22, 23) # add a vector as element 3 in the empty list l4. 
                     # Since we added element 3, elements 1 & 2 will be generated and empty (NULL)
l1[[5]] <- "More elements!" # The list l1 had 4 elements, we're adding a 5th here.
l1[[8]] <- 1:11 # We added an 8th element, but not 6th or 7th. Those will be created empty (NULL)
l1$Something <- "A thing"  # Adds a ninth element - "A thing", named "Something"


#  ------->> Data Frames --------  

# The data frame is a special kind of list used for storing dataset tables.
# Think of rows as cases, columns as variables. Each column is a vector or factor.

# Creating a dataframe:

dfr1 <- data.frame( ID=1:4,
                    FirstName=c("John","Jim","Jane","Jill"),
                    Female=c(F,F,T,T), 
                    Age=c(22,33,44,55) )

dfr1$FirstName   # Access the second column of dfr1. 
# Notice that R thinks this is a categorical variable 
# and so it's treating it like a factor, not a character vector.

# Let's get rid of the factor by telling R to treat FirstName as a vector:
dfr1$FirstName <- as.vector(dfr1$FirstName)

# Alternatively, you can tell R you don't like factors from the start using stringsAsFactors=FALSE
dfr2 <- data.frame(FirstName=c("John","Jim","Jane","Jill"), stringsAsFactors=FALSE)
dfr2$FirstName   # Success: not a factor.

# Access elements of the data frame
dfr1[1,]   # First row, all columns
dfr1[,1]   # First column, all rows
dfr1$Age   # Age column, all rows
dfr1[1:2,3:4] # Rows 1 and 2, columns 3 and 4 - the gender and age of John & Jim
dfr1[c(1,3),] # Rows 1 and 3, all columns

# Find the names of everyone over the age of 30 in the data
dfr1[dfr1$Age>30,2]

# Find the average age of all females in the data:
mean ( dfr1[dfr1$Female==TRUE,4] )



#  ------->> Flow Control --------

# if (condition) expr1 else expr2
x <- 5; y <- 10
if (x==0) y <- 0 else y <- y/x #  
y

# for (variable in sequence) expr
ASum <- 0; AProd <- 1
for (i in 1:x)  
{
  ASum <- ASum + i
  AProd <- AProd * i
}
ASum  # equivalent to sum(1:x)
AProd # equivalemt to prod(1:x)

# while (condintion) expr
while (x > 0) {print(x); x <- x-1;}

# repeat expr, use break to exit the loop
repeat { print(x); x <- x+1; if (x>10) break}



#  ------->> R plots and colors --------

# In most R functions, you can use named colors, hex, or rgb values:
# (In the simple base plot chart below x and y are point coordiantes, pch 
# is the point symbol shape, cex is the point size, and col is the color.
# to see the parameters for ploting in base R, check out ?par
plot(x=1:10, y=rep(5,10), pch=19, cex=5, col="dark red")
points(x=1:10, y=rep(6, 10), pch=19, cex=5, col="#557799")
points(x=1:10, y=rep(4, 10), pch=19, cex=5, col=rgb(.25, .5, .3))

# You may notice that rgb here ranges from 0 to 1. While this is the R default,
# you can also set it for the 0-255 range: 
rgb(10, 100, 100, maxColorValue=255) 

# We can also set the opacity/transparency using the parameter 'alpha' (range 0-1):
plot(x=1:5, y=rep(5,5), pch=19, cex=16, col=rgb(.25, .5, .3, alpha=.5), xlim=c(0,6))  

# If we have a hex color representation, we can set the transparency alpha 
# using 'adjustcolor' from package 'grDevices'. For fun, let's also set the
# the plot background to gray using the par() function for graphical parameters.
par(bg="black")
col.tr <- grDevices::adjustcolor("#557799", alpha=0.7)
plot(x=1:5, y=rep(5,5), pch=19, cex=20, col=col.tr, xlim=c(0,6)) 
par(bg="white")

# If you plan on using the built-in color names, here's what they are: 
colors()
grep("blue", colors(), value=T)

# In many cases, we need a number of contrasting colors, or multiple shades of a color.
# R comes with some predefined palette function that can generate those for us.
pal1 <- heat.colors(5, alpha=1)   # generate 5 colors from the heat palette, opaque
pal2 <- rainbow(5, alpha=.5)      # generate 5 colors from the heat palette, semi-transparent
plot(x=1:10, y=1:10, pch=19, cex=10, col=pal1)
plot(x=10:1, y=1:10, pch=19, cex=10, col=pal2)

# We can also generate our own gradients using colorRampPalette.
# Note that colorRampPalette returns a *function* that we can use 
# to generate as many colors from that palette as we need.

palf <- colorRampPalette(c("gray70", "red")) 
plot(x=10:1, y=1:10, pch=19, cex=10, col=palf(100)) 

# To add transparency to colorRampPalette, you need to add a parameter `alpha=TRUE`:
palf <- colorRampPalette(c(rgb(1,1,1, .2),rgb(.8,0,0, .7)), alpha=TRUE)
plot(x=10:1, y=1:10, pch=19, cex=10, col=palf(10)) 


#  ------->> R troubleshooting --------

# While I generate many (and often very creative) errors in R, there are three
# simple things that will most often go wrong for me. Those include: 

# 1) Capitalization. R is case sensitive - a graph vertex named "Jack" is not the same
# as one named "jack". The function "rowSums" won't work as "rowsums" or "RowSums".
#
# 2) Object class. While many functions are willing to take anything you throw
# at them, some will still surprisingly require character vector or a factor instead of
# a numeric vector, or a matrix instead of a data frame. Functions will also occasionally
# return results in an unexpected formats.
#
# 3) Package namespaces. Occasionally problems will arise when different packages
# contain functions with the same name. R may warn you about this by saying something
# like "The following object(s) are masked from 'package:igraph'" as you load a package.
# One way to deal with this is to call functions from a package explicitly using '::'.
# For instance, if function 'blah' is present in packages A and B, you can call
# A::blah and B::blah. In other cases the problem is more complicated, and you may
# have to load packages in certain order, or not use them together at all.
# For example (and pertinent to this workshop), igraph and statnet packages cause
# some problems when loaded at the same time. It is best to detach one before loading
# the other.

 library(igraph)          # load a package
 detach(package:igraph)   # detach a package

# For more advanced troubleshooting, check out try(), tryCatch(), and debug().
?tryCatch



# ================ 2. Networks in igraph ================

rm(list = ls()) # Remove all the objects we created so far.

library(igraph) # Load the igraph package


#  ------->> Create networks --------

g1 <- graph( edges=c(1,2, 2,3, 3,1), n=3, directed=F ) # an undirected graph with 3 edges
# The numbers are interpreted as vertex IDs, so the edges are 1-->2, 2-->3, 3-->1
plot(g1) # A simple plot of the network - we'll talk more about plots later
class(g1)
g1

g2 <- graph( edges=c(1,2, 2,3, 3,1), n=10 ) # now with 10 vertices, and directed by default
plot(g2)   
g2

g3 <- graph( c("John", "Jim", "Jim", "Jill", "Jill", "John")) # named vertices
# When the edge list has vertex names, the number of nodes is not needed
plot(g3)
g3

g4 <- graph( c("John", "Jim", "Jim", "Jack", "Jim", "Jack", "John", "John"), 
             isolates=c("Jesse", "Janis", "Jennifer", "Justin") )  
# In named graphs we can specify isolates by providing a list of their names.

plot(g4, edge.arrow.size=.5, vertex.color="gold", vertex.size=15, 
     vertex.frame.color="gray", vertex.label.color="black", 
     vertex.label.cex=1.5, vertex.label.dist=2, edge.curved=0.2) 

# Small graphs can also be generated with a description of this kind:
# '-' for undirected tie, "+-' or "-+" for directed ties pointing left & right, 
# "++" for a symmetric tie, and ":" for sets of vertices

plot(graph_from_literal(a---b, b---c)) # the number of dashes doesn't matter
plot(graph_from_literal(a--+b, b+--c))
plot(graph_from_literal(a+-+b, b+-+c)) 
plot(graph_from_literal(a:b:c---c:d:e))

gl <- graph_from_literal(a-b-c-d-e-f, a-g-h-b, h-e:f:i, j)
plot(gl)



#  ------->> Edge, vertex, and network attributes --------

# Access vertices and edges:
E(g4) # The edges of the object
V(g4) # The vertices of the object


# You can also manipulate the network matrix directly:
g4[]
g4[1,]
g4[3,3] <- 10
g4[5,7] <- 10

# Add attributes to the network, vertices, or edges:
V(g4)$name # automatically generated when we created the network.
V(g4)$gender <- c("male", "male", "male", "male", "female", "female", "male")
E(g4)$type <- "email" # Edge attribute, assign "email" to all edges
E(g4)$weight <- 10    # Edge weight, setting all existing edges to 10

# Examine attributes
edge_attr(g4)
vertex_attr(g4)
graph_attr(g4)

# Another way to set attributes
# (you can similarly use set_edge_attr(), set_vertex_attr(), etc.)
g4 <- set_graph_attr(g4, "name", "Email Network")
g4 <- set_graph_attr(g4, "something", "A thing")

graph_attr_names(g4)
graph_attr(g4, "name")
graph_attr(g4)

g4 <- delete_graph_attr(g4, "something")
graph_attr(g4)

plot(g4, edge.arrow.size=.5, vertex.label.color="black", vertex.label.dist=1.5,
     vertex.color=c( "pink", "skyblue")[1+(V(g4)$gender=="male")] ) 

# g4 has two edges going from Jim to Jack, and a loop from John to himself.
# We can simplify our graph to remove loops & multiple edges between the same nodes.
# Use 'edge.attr.comb' to indicate how edge attributes are to be combined - possible 
# options include "sum", "mean", "prod" (product), min, max, first/last (selects 
# the first/last edge's attribute). Option "ignore" says the attribute should be 
# disregarded and dropped.

g4s <- simplify( g4, remove.multiple = T, remove.loops = F, 
                 edge.attr.comb=list(weight="sum", type="ignore") )
plot(g4s, vertex.label.dist=1.5)
g4s

# Let's take a look at the description of the igraph object.
# Those will typically start with up to four letters:
# 1. D or U, for a directed or undirected graph
# 2. N for a named graph (where nodes have a name attribute)
# 3. W for a weighted graph (where edges have a weight attribute)
# 4. B for a bipartite (two-mode) graph (where nodes have a type attribute)
#
# The two numbers that follow refer to the number of nodes and edges in the graph. 
# The description also lists graph, node & edge attributes, for example:
# (g/c) - graph-level character attribute
# (v/c) - vertex-level character attribute
# (e/n) - edge-level numeric attribute


# ------->> Specific graphs and graph models --------

# Empty graph
eg <- make_empty_graph(40)
plot(eg, vertex.size=10, vertex.label=NA)

# Full graph
fg <- make_full_graph(40)
plot(fg, vertex.size=10, vertex.label=NA)

# Star graph 
st <- make_star(40)
plot(st, vertex.size=10, vertex.label=NA) 

# Tree graph
tr <- make_tree(40, children = 3, mode = "undirected")
plot(tr, vertex.size=10, vertex.label=NA) 

# Ring graph
rn <- make_ring(40)
plot(rn, vertex.size=10, vertex.label=NA)

# Erdos-Renyi random graph 
# ('n' is number of nodes, 'm' is the number of edges)
er <- sample_gnm(n=100, m=40) 
plot(er, vertex.size=6, vertex.label=NA)  

# Watts-Strogatz small-world graph
# Creates a lattice with 'dim' dimensions of 'size' nodes each, and rewires edges 
# randomly with probability 'p'. You can allow 'loops' and 'multiple' edges.
# The neighborhood in which edges are connected is 'nei'.
sw <- sample_smallworld(dim=2, size=10, nei=1, p=0.1)
plot(sw, vertex.size=6, vertex.label=NA, layout=layout_in_circle)
 
# Barabasi-Albert preferential attachment model for scale-free graphs
# 'n' is number of nodes, 'power' is the power of attachment (1 is linear)
# 'm' is the number of edges added on each time step 
 ba <-  sample_pa(n=100, power=1, m=1,  directed=F)
 plot(ba, vertex.size=6, vertex.label=NA)
 
#igraph can also give you some notable historical graphs. For instance:
 zach <- graph("Zachary") # the Zachary carate club
 plot(zach, vertex.size=10, vertex.label=NA)
 
  # Rewiring a graph
 # 'each_edge()' is a rewiring method that changes the edge endpoints
 # uniformly randomly with a probability 'prob'.
 rn.rewired <- rewire(rn, each_edge(prob=0.1))
 plot(rn.rewired, vertex.size=10, vertex.label=NA)
 
 # Rewire to connect vertices to other vertices at a certain distance. 
 rn.neigh = connect.neighborhood(rn, 5)
 plot(rn.neigh, vertex.size=8, vertex.label=NA) 
 
 
 # Combine graphs (disjoint union, assuming separate vertex sets): %du%
 plot(rn, vertex.size=10, vertex.label=NA) 
 plot(tr, vertex.size=10, vertex.label=NA) 
 plot(rn %du% tr, vertex.size=10, vertex.label=NA) 

  
 
# ================ 3. Reading network data from files ================

 
rm(list = ls()) # clear the workspace again

# Download the archive with the data files from http://bitly.com/netscix2016 
 
# Set the working directory to the folder containing the workshop files:
setwd("C:/DOCS/Conferences/2016-NetSciX/NetSciX Workshop")  
 
# DATASET 1: edgelist 

nodes <- read.csv("Dataset1-Media-Example-NODES.csv", header=T, as.is=T)
links <- read.csv("Dataset1-Media-Example-EDGES.csv", header=T, as.is=T)

# Examine the data:
head(nodes)
head(links)
nrow(nodes); length(unique(nodes$id))
nrow(links); nrow(unique(links[,c("from", "to")]))

# Collapse multiple links of the same type between the same two nodes
# by summing their weights, using aggregate() by "from", "to", & "type":
# (we don't use "simplify()" here so as not to collapse different link types)
links <- aggregate(links[,3], links[,-3], sum)
links <- links[order(links$from, links$to),]
colnames(links)[4] <- "weight"
rownames(links) <- NULL


# DATASET 2: matrix 

nodes2 <- read.csv("Dataset2-Media-User-Example-NODES.csv", header=T, as.is=T)
links2 <- read.csv("Dataset2-Media-User-Example-EDGES.csv", header=T, row.names=1)

# Examine the data:
head(nodes2)
head(links2)

# links2 is an adjacency matrix for a two-mode network:
links2 <- as.matrix(links2)
dim(links2)
dim(nodes2)


# ================ 4. Turning networks into igraph objects ================ 
 
library(igraph)

#  ------->> DATASET 1 -------- 

# Converting the data to an igraph object:
# The graph.data.frame function, which takes two data frames: 'd' and 'vertices'.
# 'd' describes the edges of the network - it should start with two columns 
# containing the source and target node IDs for each network tie.
# 'vertices' should start with a column of node IDs.
# Any additional columns in either data frame are interpreted as attributes.

net <- graph_from_data_frame(d=links, vertices=nodes, directed=T) 

# Examine the resulting object:
class(net)
net 

# We can look at the nodes, edges, and their attributes:
E(net)
V(net)
E(net)$type
V(net)$media

plot(net, edge.arrow.size=.4,vertex.label=NA)

# Removing loops from the graph:
net <- simplify(net, remove.multiple = F, remove.loops = T) 

# If you need them, you can extract an edge list or a matrix from igraph networks.
as_edgelist(net, names=T)
as_adjacency_matrix(net, attr="weight")

# Or data frames describing nodes and edges:
as_data_frame(net, what="edges")
as_data_frame(net, what="vertices")


#  ------->> DATASET 2 --------

head(nodes2)
head(links2)

net2 <- graph_from_incidence_matrix(links2)

# A built-in vertex attribute 'type' shows which mode vertices belong to.
table(V(net2)$type)

plot(net2,vertex.label=NA)

# To transform a one-mode network matrix into an igraph object,
# use graph_from_adjacency_matrix()

# We can also easily generate bipartite projections for the two-mode network:
# (co-memberships are easy to calculate by multiplying the network matrix by
# its transposed matrix, or using igraph's bipartite.projection function)

net2.bp <- bipartite.projection(net2)

# We can calculate the projections manually as well:
#   as_incidence_matrix(net2)  %*% t(as_incidence_matrix(net2))
# t(as_incidence_matrix(net2)) %*%   as_incidence_matrix(net2)

plot(net2.bp$proj1, vertex.label.color="black", vertex.label.dist=1,
     vertex.label=nodes2$media[!is.na(nodes2$media.type)])

plot(net2.bp$proj2, vertex.label.color="black", vertex.label.dist=1,
     vertex.label=nodes2$media[ is.na(nodes2$media.type)])


# ================ 5. Plotting networks with igraph ================

 
#  ------->> Plot parameters in igraph --------

# Plotting with igraph: node options (starting with 'vertex.') and edge options
# (starting with 'edge.'). A list of options is included in your handout.
?igraph.plotting

# We can set the node & edge options in two ways - one is to specify
# them in the plot() function, as we are doing below.

# Plot with curved edges (edge.curved=.1) and reduce arrow size:
plot(net, edge.arrow.size=.4, edge.curved=.1)

# Set node color to orange and the border color to hex #555555
# Replace the vertex label with the node names stored in "media"
plot(net, edge.arrow.size=.2, edge.curved=0,
     vertex.color="orange", vertex.frame.color="#555555",
     vertex.label=V(net)$media, vertex.label.color="black",
     vertex.label.cex=.7) 

# The second way to set attributes is to add them to the igraph object.

# Generate colors based on media type:
colrs <- c("gray50", "tomato", "gold")
V(net)$color <- colrs[V(net)$media.type]

# Set node size based on audience size:
V(net)$size <- V(net)$audience.size*0.7

# The labels are currently node IDs.
# Setting them to NA will render no labels:
V(net)$label.color <- "black"
V(net)$label <- NA

# Set edge width based on weight:
E(net)$width <- E(net)$weight/6

#change arrow size and edge color:
E(net)$arrow.size <- .2
E(net)$edge.color <- "gray80"

plot(net) 

# We can also override the attributes explicitly in the plot:
plot(net, edge.color="orange", vertex.color="gray50") 


# We can also add a legend explaining the meaning of the colors we used:
plot(net) 
legend(x=-1.1, y=-1.1, c("Newspaper","Television", "Online News"), pch=21,
       col="#777777", pt.bg=colrs, pt.cex=2.5, bty="n", ncol=1)


# Sometimes, especially with semantic networks, we may be interested in 
# plotting only the labels of the nodes:

plot(net, vertex.shape="none", vertex.label=V(net)$media, 
     vertex.label.font=2, vertex.label.color="gray40",
     vertex.label.cex=.7, edge.color="gray85")


# Let's color the edges of the graph based on their source node color.
# We'll get the starting node for each edge with "ends()".
edge.start <- ends(net, es=E(net), names=F)[,1]
edge.col <- V(net)$color[edge.start]

plot(net, edge.color=edge.col, edge.curved=.1)


#  ------->> Network Layouts --------

# Network layouts are algorithms that return coordinates for each
# node in a network.

# Let's generate a slightly larger 80-node graph.

net.bg <- sample_pa(80, 1.2) 
V(net.bg)$size <- 8
V(net.bg)$frame.color <- "white"
V(net.bg)$color <- "orange"
V(net.bg)$label <- "" 
E(net.bg)$arrow.mode <- 0
plot(net.bg)

# You can set the layout in the plot function:
plot(net.bg, layout=layout_randomly)

# Or calculate the vertex coordinates in advance:
l <- layout_in_circle(net.bg)
plot(net.bg, layout=l)

# l is simply a matrix of x,y coordinates (N x 2) for the N nodes in the graph. 
# You can generate your own:
l
l <- cbind(1:vcount(net.bg), c(1, vcount(net.bg):2))
plot(net.bg, layout=l)

# This layout is just an example and not very helpful - thankfully
# igraph has a number of built-in layouts, including:

# Randomly placed vertices
l <- layout_randomly(net.bg)
plot(net.bg, layout=l)

# Circle layout
l <- layout_in_circle(net.bg)
plot(net.bg, layout=l)

# 3D sphere layout
l <- layout_on_sphere(net.bg)
plot(net.bg, layout=l)

# The Fruchterman-Reingold force-directed algorithm 
# Nice but slow, most often used in graphs smaller than ~1000 vertices. 
l <- layout_with_fr(net.bg)
plot(net.bg, layout=l)

# You will also notice that the layout is not deterministic - different runs 
# will result in slightly different configurations. Saving the layout in l
# allows us to get the exact same result multiple times.
par(mfrow=c(2,2), mar=c(1,1,1,1))
plot(net.bg, layout=layout_with_fr)
plot(net.bg, layout=layout_with_fr)
plot(net.bg, layout=l)
plot(net.bg, layout=l)
dev.off()

# By default, the coordinates of the plots are rescaled to the [-1,1] interval
# for both x and y. You can change that with the parameter "rescale=FALSE"
# and rescale your plot manually by multiplying the coordinates by a scalar.
# You can use norm_coords to normalize the plot with the boundaries you want.

# Get the layout coordinates:
l <- layout_with_fr(net.bg)
# Normalize them so that they are in the -1, 1 interval:
l <- norm_coords(l, ymin=-1, ymax=1, xmin=-1, xmax=1)

par(mfrow=c(2,2), mar=c(0,0,0,0))
plot(net.bg, rescale=F, layout=l*0.4)
plot(net.bg, rescale=F, layout=l*0.8)
plot(net.bg, rescale=F, layout=l*1.2)
plot(net.bg, rescale=F, layout=l*1.6)
dev.off()

# Another popular force-directed algorithm that produces nice results for
# connected graphs is Kamada Kawai. Like Fruchterman Reingold, it attempts to 
# minimize the energy in a spring system.

l <- layout_with_kk(net.bg)
plot(net.bg, layout=l)

# The LGL algorithm is for large connected graphs. Here you can specify a root - 
# the node that will be placed in the middle of the layout.
plot(net.bg, layout=layout_with_lgl)

# By default, igraph uses a layout called layout_nicely which selects
# an appropriate layout algorithm based on the properties of the graph. 

# Check out all available layouts in igraph:
?igraph::layout_

layouts <- grep("^layout_", ls("package:igraph"), value=TRUE)[-1] 
# Remove layouts that do not apply to our graph.
layouts <- layouts[!grepl("bipartite|merge|norm|sugiyama|tree", layouts)]

par(mfrow=c(3,3), mar=c(1,1,1,1))

for (layout in layouts) {
  print(layout)
  l <- do.call(layout, list(net)) 
  plot(net, edge.arrow.mode=0, layout=l, main=layout) }

dev.off()


-----------------------------------
# * TASK FOR WORKSHOP PARTICIPANTS:

# Plot the Zachary karate club network with four different layouts of your choice.

-----------------------------------

  

# ------->> Improving network plots --------

plot(net)

# Notice that this network plot is still not too helpful.
# We can identify the type and size of nodes, but cannot see
# much about the structure since the links we're examining are so dense.
# One way to approach this is to see if we can sparsify the network.

hist(links$weight)
mean(links$weight)
sd(links$weight)

# There are more sophisticated ways to extract the key edges,
# but for the purposes of this excercise we'll only keep ones
# that have weight higher than the mean for the network.

# We can delete edges using delete_edges(net, edges)
cut.off <- mean(links$weight) 
net.sp <- delete_edges(net, E(net)[weight<cut.off])
plot(net.sp) 

# Another way to think about this is to plot the two tie types 
# (hyperlik & mention) separately:

E(net)$width <- 2
plot(net, edge.color=c("dark red", "slategrey")[(E(net)$type=="hyperlink")+1],
      vertex.color="gray40", layout=layout_in_circle)

# Another way to delete edges:  
net.m <- net - E(net)[E(net)$type=="hyperlink"]
net.h <- net - E(net)[E(net)$type=="mention"]

# Plot the two links separately:
par(mfrow=c(1,2))

plot(net.h, vertex.color="orange", main="Tie: Hyperlink")
plot(net.m, vertex.color="lightsteelblue2", main="Tie: Mention")

dev.off()

# Make sure the nodes stay in place in both plots:
par(mfrow=c(1,2),mar=c(1,1,4,1))

l <- layout_with_fr(net)
plot(net.h, vertex.color="orange", layout=l, main="Tie: Hyperlink")
plot(net.m, vertex.color="lightsteelblue2", layout=l, main="Tie: Mention")

dev.off()


# ------->> Interactive plotting with tkplot -------- 

# R and igraph offer interactive plotting capabilities
# (mostly helpful for small networks)

tkid <- tkplot(net) #tkid is the id of the tkplot
l <- tkplot.getcoords(tkid) # grab the coordinates from tkplot
tk_close(tkid, window.close = T)
plot(net, layout=l)


# ------->> Heatmaps as a way to represent networks -------- 

# A quick reminder that there are other ways to represent a network:

# Heatmap of the network matrix:
netm <- get.adjacency(net, attr="weight", sparse=F)
colnames(netm) <- V(net)$media
rownames(netm) <- V(net)$media

palf <- colorRampPalette(c("gold", "dark orange")) 
heatmap(netm[,17:1], Rowv = NA, Colv = NA, col = palf(20), 
        scale="none", margins=c(10,10) )


# ------->> Plotting two-mode networks with igraph --------  

head(nodes2)
head(links2)

net2
plot(net2)

# This time we will make nodes look different based on their type.
V(net2)$color <- c("steel blue", "orange")[V(net2)$type+1]
V(net2)$shape <- c("square", "circle")[V(net2)$type+1]
V(net2)$label <- ""
V(net2)$label[V(net2)$type==F] <- nodes2$media[V(net2)$type==F] 
V(net2)$label.cex=.6
V(net2)$label.font=2

plot(net2, vertex.label.color="white", vertex.size=(2-V(net2)$type)*8) 

plot(net2, vertex.label=NA, vertex.size=7, layout=layout_as_bipartite) 

 
# Using text as nodes:
par(mar=c(0,0,0,0))
plot(net2, vertex.shape="none", vertex.label=nodes2$media,
     vertex.label.color=V(net2)$color, vertex.label.font=2, 
     vertex.label.cex=.95, edge.color="gray70",  edge.width=2)

dev.off()


# ================ 6. Network and node descriptives ================


# Density
# The proportion of present edges from all possible ties.
edge_density(net, loops=F)
ecount(net)/(vcount(net)*(vcount(net)-1)) #for a directed network

# Reciprocity
# The proportion of reciprocated ties (for a directed network).
reciprocity(net)
dyad_census(net) # Mutual, asymmetric, and null node pairs
2*dyad_census(net)$mut/ecount(net) # Calculating reciprocity

# Transitivity
# global - ratio of triangles (direction disregarded) to connected triples
# local - ratio of triangles to connected triples each vertex is part of
transitivity(net, type="global")  # net is treated as an undirected network
transitivity(as.undirected(net, mode="collapse")) # same as above
transitivity(net, type="local")
triad_census(net) # for directed networks

# Triad types (per Davis & Leinhardt):
# 
# 003  A, B, C, empty triad.
# 012  A->B, C 
# 102  A<->B, C  
# 021D A<-B->C 
# 021U A->B<-C 
# 021C A->B->C
# 111D A<->B<-C
# 111U A<->B->C
# 030T A->B<-C, A->C
# 030C A<-B<-C, A->C.
# 201  A<->B<->C.
# 120D A<-B->C, A<->C.
# 120U A->B<-C, A<->C.
# 120C A->B->C, A<->C.
# 210  A->B<->C, A<->C.
# 300  A<->B<->C, A<->C, completely connected.


# Diameter (longest geodesic distance)
# Note that edge weights are used by default, unless set to NA.
diameter(net, directed=F, weights=NA)
diameter(net, directed=F)
diam <- get_diameter(net, directed=T)
diam

# Note: vertex sequences asked to behave as a vector produce numeric index of nodes
class(diam)
as.vector(diam)

# Color nodes along the diameter:
vcol <- rep("gray40", vcount(net))
vcol[diam] <- "gold"
ecol <- rep("gray80", ecount(net))
ecol[E(net, path=diam)] <- "orange" 
# E(net, path=diam) finds edges along a path, here 'diam'
plot(net, vertex.color=vcol, edge.color=ecol, edge.arrow.mode=0)

# Node degrees
# 'degree' has a mode of 'in' for in-degree, 'out' for out-degree,
# and 'all' or 'total' for total degree. 
deg <- degree(net, mode="all")
plot(net, vertex.size=deg*3)
hist(deg, breaks=1:vcount(net)-1, main="Histogram of node degree")

# Degree distribution
deg.dist <- degree_distribution(net, cumulative=T, mode="all")
plot( x=0:max(deg), y=1-deg.dist, pch=19, cex=1.2, col="orange", 
      xlab="Degree", ylab="Cumulative Frequency")


# Centrality & centralization

# Centrality functions (vertex level) and centralization functions (graph level).
# The centralization functions return "res" - vertex centrality, "centralization", 
# and "theoretical_max" - maximum centralization score for a graph of that size.
# The centrality functions can run on a subset of nodes (set with the "vids" parameter)

# Degree (number of ties)
degree(net, mode="in")
centr_degree(net, mode="in", normalized=T)

# Closeness (centrality based on distance to others in the graph)
# Inverse of the node's average geodesic distance to others in the network
closeness(net, mode="all", weights=NA) 
centr_clo(net, mode="all", normalized=T) 

# Eigenvector (centrality proportional to the sum of connection centralities)
# Values of the first eigenvector of the graph adjacency matrix
eigen_centrality(net, directed=T, weights=NA)
centr_eigen(net, directed=T, normalized=T) 

# Betweenness (centrality based on a broker position connecting others)
# (Number of geodesics that pass through the node or the edge)
betweenness(net, directed=T, weights=NA)
edge_betweenness(net, directed=T, weights=NA)
centr_betw(net, directed=T, normalized=T)



-----------------------------------
# * TASK FOR WORKSHOP PARTICIPANTS:

# Compute the degree, closeness, eigenvector, and betweenness centrality of
# the actors in the Zachary karate club network. Plot the network, sizing the
# nodes based on the different centrality types.

-----------------------------------

  

# Hubs and authorities

# The hubs and authorities algorithm developed by Jon Kleinberg was initially used 
# to examine web pages. Hubs were expected to contain catalogues with a large number 
# of outgoing links; while authorities would get many incoming links from hubs, 
# presumably because of their high-quality relevant information. 

hs <- hub_score(net, weights=NA)$vector
as <- authority_score(net, weights=NA)$vector

par(mfrow=c(1,2))
 plot(net, vertex.size=hs*50, main="Hubs")
 plot(net, vertex.size=as*30, main="Authorities")
dev.off()


# ================ 7. Distances and paths ================


# Average path length 
# The mean of the shortest distance between each pair of nodes in the network 
# (in both directions for directed graphs). 
mean_distance(net, directed=F)
mean_distance(net, directed=T)

# We can also find the length of all shortest paths in the graph:
distances(net) # with edge weights
distances(net, weights=NA) # ignore weights

# We can extract the distances to a node or set of nodes we are interested in.
# Here we will get the distance of every media from the New York Times.
dist.from.NYT <- distances(net, v=V(net)[media=="NY Times"], to=V(net), weights=NA)

# Set colors to plot the distances:
oranges <- colorRampPalette(c("dark red", "gold"))
col <- oranges(max(dist.from.NYT)+1)
col <- col[dist.from.NYT+1]

plot(net, vertex.color=col, vertex.label=dist.from.NYT, edge.arrow.size=.6, 
     vertex.label.color="white")

# We can also find the shortest path between specific nodes.
# Say here between MSNBC and the New York Post:
news.path <- shortest_paths(net, 
                            from = V(net)[media=="MSNBC"], 
                             to  = V(net)[media=="New York Post"],
                             output = "both") # both path nodes and edges

# Generate edge color variable to plot the path:
ecol <- rep("gray80", ecount(net))
ecol[unlist(news.path$epath)] <- "orange"
# Generate edge width variable to plot the path:
ew <- rep(2, ecount(net))
ew[unlist(news.path$epath)] <- 4
# Generate node color variable to plot the path:
vcol <- rep("gray40", vcount(net))
vcol[unlist(news.path$vpath)] <- "gold"

plot(net, vertex.color=vcol, edge.color=ecol, 
     edge.width=ew, edge.arrow.mode=0)


# Identify the edges going into or out of a vertex, for instance the WSJ.
# For a single node, use 'incident()', for multiple nodes use 'incident_edges()'
inc.edges <- incident(net, V(net)[media=="Wall Street Journal"], mode="all")

# Set colors to plot the selected edges.
ecol <- rep("gray80", ecount(net))
ecol[inc.edges] <- "orange"
vcol <- rep("grey40", vcount(net))
vcol[V(net)$media=="Wall Street Journal"] <- "gold"
plot(net, vertex.color=vcol, edge.color=ecol)


# We can also easily identify the immediate neighbors of a vertex, say WSJ.
# The 'neighbors' function finds all nodes one step out from the focal actor.
# To find the neighbors for multiple nodes, use 'adjacent_vertices()'.
# To find node neighborhoods going more than one step out, use function 'ego()'
# with parameter 'order' set to the number of steps out to go from the focal node(s).

neigh.nodes <- neighbors(net, V(net)[media=="Wall Street Journal"], mode="out")

# Set colors to plot the neighbors:
vcol[neigh.nodes] <- "#ff9d00"
plot(net, vertex.color=vcol)

# Special operators for the indexing of edge sequences: %--%, %->%, %<-%
# E(network)[X %--% Y] selects edges between vertex sets X and Y, ignoring direction
# E(network)[X %->% Y] selects edges from vertex sets X to vertex set Y
# E(network)[X %->% Y] selects edges from vertex sets Y to vertex set X

# For example, select edges from newspapers to online sources:
E(net)[ V(net)[type.label=="Newspaper"] %->% V(net)[type.label=="Online"] ]

# Cocitation (for a couple of nodes, how many shared nominations they have)
cocitation(net)



# ================ 8. Subgroups and communities ================

# Converting 'net' to an undirected network.
# There are several ways to do that: we can create an undirected link between any pair
# of connected nodes (mode="collapse), or create an undirected link for each directed
# one (mode="each"), or create an undirected link for each symmetric link (mode="mutual").
# In cases when A -> B and B -> A are collapsed into a single undirected link, we
# need to specify what to do with the edge attributes. Here we have said that
# the 'weight' of links should be summed, and all other edge attributes ignored.

net.sym <- as.undirected(net, mode="collapse", edge.attr.comb=list(weight="sum", "ignore"))


#  ------->> Cliques --------

 # Find cliques (complete subgraphs of an undirected graph)
cliques(net.sym) # list of cliques       
sapply(cliques(net.sym), length) # clique sizes
largest_cliques(net.sym) # cliques with max number of nodes

vcol <- rep("grey80", vcount(net.sym))
vcol[unlist(largest_cliques(net.sym))] <- "gold"
plot(net.sym, vertex.label=V(net.sym)$name, vertex.color=vcol)



#  ------->> Communities --------

# A number of algorithms aim to detect groups that consist of densely connected nodes
# with fewer connections across groups. 

# Community detection based on edge betweenness (Newman-Girvan)
# High-betweenness edges are removed sequentially (recalculating at each step)
# and the best partitioning of the network is selected.
ceb <- cluster_edge_betweenness(net) 
dendPlot(ceb, mode="hclust")
plot(ceb, net) 

# Let's examine the community detection igraph object:
class(ceb)
length(ceb)     # number of communities
membership(ceb) # community membership for each node
crossing(ceb, net)   # boolean vector: TRUE for edges across communities
modularity(ceb) # how modular the graph partitioning is

# High modularity for a partitioning reflects dense connections within communities 
# and sparse connections across communities.


# Community detection based on propagating labels
# Assigns node labels, randomizes, and replaces each vertex's label with
# the label that appears most frequently among neighbors. Repeated until
# each vertex has the most common label of its neighbors.
clp <- cluster_label_prop(net)
plot(clp, net)

# Community detection based on greedy optimization of modularity
cfg <- cluster_fast_greedy(as.undirected(net))
plot(cfg, as.undirected(net))
 
# We can also plot the communities without relying on their built-in plot:
V(net)$community <- cfg$membership
colrs <- adjustcolor( c("gray50", "tomato", "gold", "yellowgreen"), alpha=.6)
plot(net, vertex.color=colrs[V(net)$community])


-----------------------------------
# * TASK FOR WORKSHOP PARTICIPANTS:

# Plot the results of the three different community detection algorithms 
#  applied to  the Zachary karate club network. 
  
-----------------------------------


# K-core decomposition
# The k-core is the maximal subgraph in which every node has degree of at least k
# This also means that the (k+1)-core will be a subgraph of the k-core.
# The result here gives the coreness of each vertex in the network.
kc <- coreness(net, mode="all")
plot(net, vertex.size=kc*6, vertex.label=kc, vertex.color=colrs[kc])


# ================ 9. Assortativity and Homophily ================

# Assortativity (homophily)
# The tendency of nodes to connect to others who are similar on some variable.
# assortativity_nominal() is for categorical variables (labels)
# assortativity() is for ordinal and above variables
# assortativity_degree() checks assortativity in node degrees

V(net)$type.label
V(net)$media.type

assortativity_nominal(net, V(net)$media.type, directed=F)

assortativity(net, V(net)$audience.size, directed=F)

assortativity_degree(net, directed=F)


# ================ The End ================




