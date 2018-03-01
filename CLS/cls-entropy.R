# Entropy

buys <- c("no", "no", "yes", "yes", "yes", "no", "yes", "no", "yes", "yes", "yes", "yes", "yes", "no")

credit <- c("fair", "excellent", "fair", "fair", "fair", "excellent", "excellent", "fair", "fair", "fair", "excellent", "excellent", "fair", "excellent")

student <- c("no", "no", "no","no", "yes", "yes", "yes", "no", "yes", "yes", "yes", "no", "yes", "no")

income <- c("high", "high", "high", "medium", "low", "low", "low", "medium", "low", "medium", "medium", "medium", "high", "medium")

age <- c(25, 27, 35, 41, 48, 42, 36, 29, 26, 45, 23, 33, 37, 44) # we change the age from categorical to numeric

df = data.frame(age, student, income, credit, buys)
df

#M1
freqs <- table(buys)/length(buys)
freqs
sum(freqs)
#info(freqs)  #[1] 0.940286

#M2
# calculate shannon-entropy
-sum(freqs * log2(freqs))    #[1] 0.940286

#M3
entropy::entropy.empirical(freqs, unit="log2")  #[1] 0.940286

6/16
10/16
6/8; 2/8
