#Hierarchical Clustering 

#Marks
A=c(1,1.5,3,5,3.5,4.5,3.5)
B=c(1,2,4,7,5,5,4.5)
marks=data.frame(A,B)
marks

hc <- hclust(dist(marks), "ave")
plot(hc)
plot(hc, hang = -1)


