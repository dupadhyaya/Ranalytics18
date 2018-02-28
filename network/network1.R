# Network i graph
#http://kateto.net/networks-r-igraph
library(igraph) # Load the igraph package
g1 <- graph( edges=c(1,2, 2,3, 3, 1), n=3, directed=F ) 
plot(g1)
class(g1)
g1
# Now with 10 vertices, and directed by default:
g2 <- graph( edges=c(1,2, 2,3, 3, 1), n=10 )
plot(g2)  

g3 <- graph( c("John", "Jim", "Jim", "Jill", "Jill", "John")) # named vertices
# When the edge list has vertex names, the number of nodes is not needed
plot(g3)

g4 <- graph( c("John", "Jim", "Jim", "Jack", "Jim", "Jack", "John", "John"), 
             isolates=c("Jesse", "Janis", "Jennifer", "Justin") )  
# In named graphs we can specify isolates by providing a list of their names.
plot(g4, edge.arrow.size=.5, vertex.color="gold", vertex.size=15,     
     vertex.frame.color="gray", vertex.label.color="black", 
     vertex.label.cex=0.8, vertex.label.dist=2, edge.curved=0.2) 
plot(graph_from_literal(a---b, b---c)) # the number of dashes doesn't matter
plot(graph_from_literal(a--+b, b+--c))
plot(graph_from_literal(a+-+b, b+-+c)) 
plot(graph_from_literal(a:b:c---c:d:e))
gl <- graph_from_literal(a-b-c-d-e-f, a-g-h-b, h-e:f:i, j)
plot(gl)

#Edge, vertex, and network attributes -------------------------
E(g4) # The edges of the object
## + 4/4 edges (vertex names):
## [1] John->Jim  Jim ->Jack Jim ->Jack John->John
V(g4) # The vertices of the object
## + 7/7 vertices, named:
## [1] John     Jim      Jack     Jesse    Janis    Jennifer Justin
g4[]
g4[1,] 

V(g4)$name # automatically generated when we created the network.
## [1] "John"     "Jim"      "Jack"     "Jesse"    "Janis"    "Jennifer"

## [7] "Justin"
V(g4)$gender <- c("male", "male", "male", "male", "female", "female", "male")
E(g4)$type <- "email" # Edge attribute, assign "email" to all edges
E(g4)$weight <- 10    # Edge weight, setting all existing edges to 10

#Examine attributes:
edge_attr(g4)
## $type
## [1] "email" "email" "email" "email"
## 
## $weight
## [1] 10 10 10 10
vertex_attr(g4)

graph_attr(g4)
## named list()
#Another way to set attributes (you can similarly use set_edge_attr(), set_vertex_attr(), etc.):
g4 <- set_graph_attr(g4, "name", "Email Network")
g4 <- set_graph_attr(g4, "something", "A thing")
graph_attr_names(g4)

graph_attr(g4, "name")
## [1] "Email Network"
graph_attr(g4)
## $name
## [1] "Email Network"
## $something
## [1] "A thing"
g4 <- delete_graph_attr(g4, "something")
graph_attr(g4)

## $name
## [1] "Email Network"
plot(g4, edge.arrow.size=.5, vertex.label.color="black", vertex.label.dist=1.5,
     vertex.color=c( "pink", "skyblue")[1+(V(g4)$gender=="male")] ) 

g4s <- simplify( g4, remove.multiple = T, remove.loops = F, 
                 edge.attr.comb=c(weight="sum", type="ignore") )
plot(g4s, vertex.label.dist=1.5)
g4s

#2.3 Specific graphs and graph models ----------------
eg <- make_empty_graph(40)
plot(eg, vertex.size=10, vertex.label=NA)
eg <- make_empty_graph(100)
plot(eg, vertex.size=6, vertex.label=1:100)

# Full Graph
fg <- make_full_graph(40)
plot(fg, vertex.size=10, vertex.label=NA)

#Simple star graph
st <- make_star(40)
plot(st, vertex.size=10, vertex.label=NA) 

#Tree graph
tr <- make_tree(40, children = 4, mode = "undirected")
plot(tr, vertex.size=10, vertex.label=NA) 

#Ring graph
rn <- make_ring(40)
plot(rn, vertex.size=10, vertex.label=NA)

#Erdos-Renyi random graph model (‘n’ is number of nodes, ‘m’ is the number of edges).
er <- sample_gnm(n=100, m=40) 
plot(er, vertex.size=6, vertex.label=NA)  
