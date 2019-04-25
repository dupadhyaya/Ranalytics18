
t1 <- read.table(text = "ID1     Name1     Type1     Name2
1       A1         T1        B1
2       A2         T2        B2
3       A3         T1        B3_a
4       A4         T3        B4_a", header = T)

t1

t2 <- read.table(text = "NameBank     TypeBank
A1             T1
A2             T2
A3             T1
A4             T3
B1             T1
B2             T4
B3             T2
B4             T3", header = T)

t2
t1;t2

library(dplyr)
#charmatch which seeks matches for the elements of its first argument among those of its second.:
t2[1,]
t1[1,]
chrs <- charmatch(t2$NameBank, t1$Name2)
chrs
cbind(
  t1[chrs[!is.na(chrs)],],
  t2[which(!is.na(chrs)),]
)

t1$Type2 <- NA_character_
t1
library(stringr)
for( row in seq_len( nrow( t2 ) ) ) {
  t1$Type2[ substr( t1$Name2, 0, nchar( t2$NameBank[row] ) ) == t2$NameBank[row] ] <- t2$TypeBank[row]
}
