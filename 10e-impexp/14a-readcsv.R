# Read csv

# How to read CSV File

#read.csv(file, header = TRUE, sep = ",", quote = "\"", dec = ".", fill = TRUE, comment.char= "")

read1 = read.csv(file="./data/iris.csv",header = TRUE,sep = ",")
str(read1)
class(read1)

read2 = read.table(file="./data/iris.csv",header = TRUE,sep = ",")
str(read2)
class(read2)

read3 = read.delim(file="./data/iris.csv",header = TRUE,sep = ",")
str(read3)
class(read3)
