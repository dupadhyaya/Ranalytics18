#Achal 2 : String Extract

data = read.csv(file.choose())
data
str(data)

t = str_match_all(data$Group, "\\bCat_[a-zA-Z0-9_]+\\b")

for (i in 1:nrow(data))
  print(cbind(as.vector(data$User[i]),unlist(t[i]) ))


y  <- NULL
for (i in 1:nrow(data))
{ 
  tmp <- cbind(as.vector(data$User[i]),unlist(t[i]) )
  y <- rbind(y, tmp)
}
y
