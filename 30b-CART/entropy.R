# Entropy

library(entropy)

buys <- c("no", "no", "yes", "yes", "yes", "no", "yes", "no", "yes", "yes", "yes", "yes", "yes", "no")

freqs <- table(buys)/length(buys)
freqs
#Same this way
prop.table(table(buys))

# calculate shannon-entropy
-sum(freqs * log2(freqs))
#[1] 0.940286

entropy.empirical(freqs, unit="log2")
#0.940286
