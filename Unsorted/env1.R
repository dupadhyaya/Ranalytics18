# Session Info


sessionInfo()
toLatex(sessionInfo(), locale = FALSE)



#http://adv-r.had.co.nz/memory.html

library(pryr)
mem_used()


library(pryr)
object_size(1:10)
## 88 B
object_size(mean)
## 832 B
object_size(mtcars)
## 6.74 kB

rm(list=ls())
sizes <- sapply(0:50, function(n) object_size(seq_len(n)))
plot(0:50, sizes, xlab = "Length", ylab = "Size (bytes)", 
     type = "s")


object_size(numeric())
## 40 B
object_size(logical())
## 40 B
object_size(raw())
## 40 B
object_size(list())
## 40 B

plot(0:50, sizes - 40, xlab = "Length", 
     ylab = "Bytes excluding overhead", type = "n")
abline(h = 0, col = "grey80")
abline(h = c(8, 16, 32, 48, 64, 128), col = "grey80")
abline(a = 0, b = 4, col = "grey90", lwd = 4)
lines(sizes - 40, type = "s")

x <- 1:1e6
object_size(x)
## 4 MB
y <- list(x, x, x)
object_size(y)
## 4 MB


sort( sapply(ls(),function(x){object.size(get(x))})) 


#https://stackoverflow.com/questions/1395270/determining-memory-usage-of-objects

memory.profile()
lsos()
gc
memory.size()
object.size(1)
#32 bytes
object.size("Hello world!")
#72 bytes
#object.size(audioscrobbler)
#39374504 bytes