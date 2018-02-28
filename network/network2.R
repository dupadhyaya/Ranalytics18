#Network2

nodes <- read.csv("Dataset1-Media-Example-NODES.csv", header=T, as.is=T)
links <- read.csv("Dataset1-Media-Example-EDGES.csv", header=T, as.is=T)
head(nodes)
head(links)
nrow(nodes); length(unique(nodes$id))
nrow(links); nrow(unique(links[,c("from", "to")]))
links <- aggregate(links[,3], links[,-3], sum)
links <- links[order(links$from, links$to),]
colnames(links)[4] <- "weight"
rownames(links) <- NULL

#DATASET 2: matrix
nodes2 <- read.csv("Dataset2-Media-User-Example-NODES.csv", header=T, as.is=T)
links2 <- read.csv("Dataset2-Media-User-Example-EDGES.csv", header=T, row.names=1)
head(nodes2)
head(links2)
#We can see that links2 is an adjacency matrix for a two-mode network:
links2 <- as.matrix(links2)
dim(links2)
dim(nodes2)

#Turning networks into igraph objects
library(igraph)
net <- graph_from_data_frame(d=links, vertices=nodes, directed=T) 
class(net)
## [1] "igraph"
net

E(net)       # The edges of the "net" object
V(net)       # The vertices of the "net" object
E(net)$type  # Edge attribute "type"
V(net)$media # Vertex attribute "media"
#Now that we have our igraph network object, let’s make a first attempt to plot it.
plot(net, edge.arrow.size=.4,vertex.label=NA)
plot(net, edge.arrow.size=.4,vertex.label=links$from, vertex.label.cex=0.5)

net <- simplify(net, remove.multiple = F, remove.loops = T) 
as_edgelist(net, names=T)

as_adjacency_matrix(net, attr="weight")
#Or data frames describing nodes and edges:
as_data_frame(net, what="edges")
as_data_frame(net, what="vertices")

# DataSet2
head(nodes2)
head(links2)
net2 <- graph_from_incidence_matrix(links2)

table(V(net2)$type)
net2.bp <- bipartite.projection(net2)
as_incidence_matrix(net2)  %*% t(as_incidence_matrix(net2)) 

t(as_incidence_matrix(net2)) %*%   as_incidence_matrix(net2)
plot(net2.bp$proj1, vertex.label.color="black", vertex.label.dist=1,
     
vertex.size=7, vertex.label=nodes2$media[!is.na(nodes2$media.type)])
plot(net2.bp$proj2, vertex.label.color="black", vertex.label.dist=1,
     
     vertex.size=7, vertex.label=nodes2$media[ is.na(nodes2$media.type)])
