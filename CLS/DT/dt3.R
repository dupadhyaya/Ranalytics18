#https://www.r-project.org/conferences/useR-2009/slides/Hothorn+Zeileis.pdf

library(ipred)
data(data=GlaucomaMVF , package = "ipred")
library("rpart")
g_rpart <- rpart(Class ~ ., data = GlaucomaMVF)
print(g_rpart)
plot(g_rpart)
text(g_rpart)

library("partykit")
g_party <- as.party(g_rpart)
print(g_party, header = FALSE)
print(g_party, header = T)
plot(g_party, type = "simple")
plot(g_party, type = "extended")
