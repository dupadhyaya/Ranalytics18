#dplyr

library(dplyr)

# set rnd df
set.seed(10)
N <- 5
my.df <- data.frame(COL1 = runif(N), 
                    COL2 = runif(N), 
                    G = runif(N),
                    B = runif(N))

# select columns with dplyr::select
my.temp.df <- select(my.df, COL1, G)
print(my.temp.df)
