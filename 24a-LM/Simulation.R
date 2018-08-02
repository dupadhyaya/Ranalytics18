# Simulation
x = c(1, 3, 5)
px = c(0.6, 0.3, 0.1)
draws = sample(x, size = 500, replace = TRUE, prob = px)
draws
hist(draws, breaks = seq(1, 5, by = 0.25), main = "1000 discrete draws")
var(draws)
draws = sample(x, size = 4 * 500,replace = TRUE, prob = px)
draws = matrix(draws, 4)
drawmeans = apply(draws, 2, mean)
hist(drawmeans, breaks = seq(1, 5, by = 0.25), main = "1000 means of 4 draws")

var(drawmeans)
drawmeans = apply(matrix(sample(x, size = 16 * 500, replace = TRUE, prob = px), 16), 2, mean)
hist(drawmeans, breaks = seq(1, 5, by = 0.25), main = "1000 means of 16 draws")
var(drawmeans)


-----------
  p.die <- rep(1/6,6)
sum(p.die)
die <- 1:6
sample(die, size=10, prob=p.die, replace=T)
s <- table(sample(die, size=1000, prob=p.die, replace=T))
lbls = sprintf("%0.1f%%", s/sum(s)*100)
barX <- barplot(s, ylim=c(0,200))
text(x=barX, y=s+10, label=lbls)

generate.sample.means <- function(n) {
  sample.means <- numeric()
  for (i in 1:1000) { 
    sample.means <- append(sample.means, sum(sample(die, size=n, prob=p.die, replace=T))/n)
  }
  return (sample.means)
}
sample.means <- generate.sample.means(100)
plot(density(sample.means), main="Distribution of sample means",xlab="sample mean", col="orange")

