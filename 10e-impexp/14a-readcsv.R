# Read csv

# How to read CSV File

read.csv(file, header = TRUE, sep = ",", quote = "\"",
         dec = ".", fill = TRUE, comment.char = "")

ir<- read.csv(file="./data/iris.csv",header = TRUE,sep = ",")
str(ir)

is <- read.table(file="./data/iris.csv",header = TRUE,sep = ",")
str(is)

ii <- read.delim(file="./data/iris.csv",header = TRUE,sep = ",")
str(ii)
