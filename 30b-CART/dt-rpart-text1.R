# Text Rpart
library(rpart)
freen.tr <- rpart(y ~ ., freeny)
par(xpd = TRUE)
plot(freen.tr)
text(freen.tr, use.n = TRUE, all = TRUE)
labels(freen.tr, digits = 4, minlength = 1L, pretty, collapse = TRUE)
