# Splitting Data into 2 or more frames
data(mtcars)
mtcars
## 75% of the sample size
smp_size <- floor(0.75 * nrow(mtcars))
smp_size
## set the seed to make your partition reproductible
set.seed(123)
train_ind <- sample(seq_len(nrow(mtcars)), size = smp_size)
train_ind
train <- mtcars[train_ind, ]
train
test <- mtcars[-train_ind, ]


# Another Code ---------
bound <- floor((nrow(df)/4)*3)         #define % of training and test set

df <- df[sample(nrow(df)), ]           #sample rows 
df.train <- df[1:bound, ]              #get training set
df.test <- df[(bound+1):nrow(df), ]    #get test set



