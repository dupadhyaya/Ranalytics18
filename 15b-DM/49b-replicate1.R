#replicate
#
?replicate
replicate(n, expr, simplify = "array")
replicate(3,4)
#[1] 4 4 4
replicate(4,3)
#[1] 3 3 3 3
x = c(1:5)
replicate(3,x)
replicate(x,3)  # Invalid length
?replicate
rnorm(5)
replicate(4, rnorm(5))
j=0
(x<-unlist(replicate(5, for(i in 1:5){
  print(paste(' Hello Dhiraj: i- ' , i,sep=': '))
  })))

replicate(5, 'Hello')
replicate(5, mean(1:5))

seq(1,5,1)
replicate(5, seq(1,5,1))


rep(1:4,len=20)
replicate(1:4, length=20)
?replicate

(x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE)))

# compute the list mean for each list element
lapply(x, mean)

# median and quartiles for each list element
1:3/4
lapply(x, quantile, probs = 1:3/4)

sapply(x, quantile) # on list items

(i39 <- sapply(3:9, seq) ) # list of vectors


sapply(i39, fivenum)

vapply(i39, fivenum,
       c(Min. = 0, "1st Qu." = 0, Median = 0, "3rd Qu." = 0, Max. = 0))

## sapply(*, "array") -- artificial example
(v <- structure(10*(5:8), names = LETTERS[1:4]))

f2 <- function(x, y) outer(rep(x, length.out = 3), y)
(a2 <- sapply(v, f2, y = 2*(1:5), simplify = "array"))
a.2 <- vapply(v, f2, outer(1:3, 1:5), y = 2*(1:5))
stopifnot(dim(a2) == c(3,5,4), all.equal(a2, a.2),
          identical(dimnames(a2), list(NULL,NULL,LETTERS[1:4])))

hist(replicate(100, mean(rexp(10))))







## use of replicate() with parameters:
foo <- function(x = 1, y = 2) c(x, y)

# does not work: bar <- function(n, ...) replicate(n, foo(...))
bar <- function(n, x) replicate(n, foo(x = x))
bar(5, x = 3)



data1 = c(3, 60, 19, 9, 4 , 5)

labels1 = c('Building training sets', 'Cleaning and Organising Data', 'Collecting Data sets', 'Mining data for patterns', 'Refining Algorithms', 'Others')
pie(data1, labels= labels1)

barplot(data1)
pie(data1,labels=NA,   clockwise=TRUE,
    col=rainbow(6),  border="white",  radius=1.2,
    cex=0.8,  main="Average Time Spent by Data Scientists")
legend("bottomright",legend=pielabels,bty="n", # horiz = T,
       fill=rainbow(6))
barplot(data1, col=rainbow(6), names.arg=pielabels, 
        cex.names = 1, horiz=T, angle=90, 
        main="Average Time Spent by Data Scientists"
)
text(1:6, data1, labels= labels1)
?barplot



browsers<-read.table("browsers.txt",header=TRUE)
browsers<-data1
browsers
pielabels <- sprintf("%s = %3.1f%s", labels1, browsers, "%")
pielabels
?sprintf
library(RColorBrewer)
pie(browsers,
    labels=NA,
    clockwise=TRUE,
    col=brewer.pal(6,"Set1"),
    border="white",
    radius=1,
    cex=0.8,
    main="Percentage Share of Internet Browser usage")
legend("bottomleft",legend=labels1,bty="n",
       fill=brewer.pal(6,"Set1"))
