
library(Hmisc)
find.matches(x, y, tol=rep(0, ncol(y)), scale=tol, maxmatch=10)

?find.matches

y <- rbind(c(.1, .2),c(.11, .22), c(.3, .4), c(.31, .41), c(.32, 5))
x <- rbind(c(.09,.21), c(.29,.39))
y
x
w <- find.matches(x, y, maxmatch=5, tol=c(.05,.05))
w
w$matches
w$distance
x;y
w1 <- find.matches(x, y, tol=c(.1,.01))
w1

find.matches(y, x, maxmatch=5, tol=c(.05,.05))


# NOT RUN {
agrep("lasy", "1 lazy 2")
agrep("lasy", c(" 1 lazy 2", "1 lasy 2"), max = list(sub = 0))
agrep("laysy", c("1 lazy", "1", "1 LAZY"), max = 2)
agrep("laysy", c("1 lazy", "1", "1 LAZY"), max = 2, value = TRUE)
agrep("laysy", c("1 lazy", "1", "1 LAZY"), max = 2, ignore.case = TRUE)
# }

agrep("dhiraj", 'Dhiraj Upadhyaya')
agrep("dhiraj", c('Dhiraj Upadhyaya','Dheeraj', 'Dhiru','D Upadhyaya', 'Dhiraj', 'DHIRAJ'))
agrep("dhiraj", c('Dhiraj Upadhyaya','Dheeraj', 'Dhiru','D Upadhyaya', 'Dhiraj', 'DHIRAJ'), ignore.case = T)
agrep("dhiraj", c('Dhiraj Upadhyaya','Dheeraj', 'Dhiru','D Upadhyaya', 'Dhiraj', 'DHIRAJ'), max.distance = 0)
agrep("dhiraj", c('Dhiraj Upadhyaya','Dheeraj', 'Dhiru','D Upadhyaya', 'Dhiraj', 'DHIRAJ', 'dhiraj'), max.distance = 0)
agrep("dhiraj", c('Dhiraj Upadhyaya','Dheeraj', 'Dhiru','D Upadhyaya', 'Dhiraj', 'DHIRAJ', 'dhiraj'), max.distance = 1)
agrep("dhiraj", c('Dhiraj Upadhyaya','Dheeraj', 'Dhiru','D Upadhyaya', 'Dhiraj', 'DHIRAJ', 'dhiraj'), max.distance = 2)
agrep("dhiraj", c('Dhiraj Upadhyaya','Dheeraj', 'Dhiru','D Upadhyaya', 'Dhiraj', 'DHIRAJ', 'dhiraj'), max.distance = 3)
agrep("dhiraj", c('Dhiraj Upadhyaya','Dheeraj', 'Dhiru','D Upadhyaya', 'Dhiraj', 'DHIRAJ', 'dhiraj'), max.distance = 6)
agrep("dhiraj", c('Dhiraj Upadhyaya','Dheeraj', 'Dhiru','D Upadhyaya', 'Dhiraj', 'DHIRAJ', 'dhiraj'), max.distance = 3, value=T)
#max expressed at absolute nos
agrep("dhiraj", c('Dhiraj Upadhyaya','Dheeraj', 'Dhiru','D Upadhyaya', 'Dhiraj', 'DHIRAJ', 'dhiraj'), max.distance = .1, value=T)
#expressed as decimal
agrep("dhiraj", c('Dhiraj Upadhyaya','Dheeraj', 'Dhiru','D Upadhyaya', 'Dhiraj', 'DHIRAJ', 'dhiraj'), max.distance = (del=2), value=T)
agrep("dhiraj", c('Dhiraj Upadhyaya','Dheeraj', 'Dhiru','D Upadhyaya', 'Dhiraj', 'DHIRAJ', 'dhiraj'), max.distance = (cost=3), value=T)
agrep("dhiraj", c('Dhiraj Upadhyaya','Dheeraj', 'Dhiru','D Upadhyaya', 'Dhiraj', 'DHIRAJ', 'dhiraj'), max.distance = (inser=3), value=T)



library(RecordLinkage)

ClosestMatch2 = function(string, stringVector){
  distance = levenshteinSim(string, stringVector);
  stringVector[distance == max(distance)]
}
word <- 'test'
words <- c('Teest','teeeest','New York City','yeast','text','Test')
ClosestMatch2(word,words)
