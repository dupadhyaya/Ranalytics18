# Data for Classfication

# dataset for Classification
#https://github.com/kabacoff/RiA2/blob/master/Ch17%20Classification.R

breast = read.table('http://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/breast-cancer-wisconsin.data', sep=',', header=F, na.strings='?')
names(breast)

names(breast) <- c("ID", "clumpThickness", "sizeUniformity",
                   "shapeUniformity", "maginalAdhesion", 
                   "singleEpithelialCellSize", "bareNuclei", 
                   "blandChromatin", "normalNucleoli", "mitosis", "class")
names(breast)

df <- breast[-1]
df$class <- factor(df$class, levels=c(2,4), labels=c("benign", "malignant"))



set.seed(1234)
train <- sample(nrow(df), 0.7*nrow(df))
df.train <- df[train,]
df.validate <- df[-train,]
table(df.train$class)
table(df.validate$class)