#Mutate

library(plyr)
df=mtcars

#Case-ddply?----
ddply(df, .(am), mutate,  mgp2 = mpg*2 + 1)
ddply(df, .(mpg), mutate,  mgp2 = mpg*2 + 1)
base2
