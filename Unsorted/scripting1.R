# Looping
#ex1

i <- 0
repeat{
  i <- i + 2
  print(i)
  if(i == 10) {
    break
  }
}

#ex2
msg <- c("Hello")
i <- 1
repeat {
  i <- i + 1
  print(c(msg,i))
  if(i > 5) {
    break
  }
}

# Ex3
i <- 1
while(i < 8) {
  print(i)
  i <- i + 2
}

# Ex4
msg <- c("Hello")
i <- 1

while (i < 7) {
  print(msg)
  i = i + 1
}

#ex5
x <- c(7, 4, 3, 8, 9, 25)
for(i in 1:4) {
  print(x[i])
}

#ex6
y <- c("q", "w", "e", "r", "z", "c")
for(letter in y) {
  print(letter)
}

#ex7
i <- 1
while(i < 5) {
  i <- i + 1
  if (i == 3) break
  print(i)
}

#ex8
for (a in 1:3)
{
  for (b in 1:3)
  {
    print(c(a, b))
    if (b == 2) break
  }
}

#ex9
i <- 1
while(i < 5) {
  i <- i + 1
  if (i == 3) {
    next
  }
  print(i)
}

#ex10
i <- 1:5
for (val in i) {
  if (val == 3){
    next
  }
  print(val)
}