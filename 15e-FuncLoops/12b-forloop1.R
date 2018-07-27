# For Loop

for ( i in 1:10)
{  print(i)
}

print(1:10)


# controlling loop
#
for (i in 1:10)
{ 
  if ( i==3)
  {
    next
  }
  print(i)
}
# 3 was not printed


x = 0
for (i in 1:10)
{
  x = x + i
  print(c(i,x))
}

x = 1
for (v in c(3, 4, 7, 2))
{
  x = x*v
}
x

x = c(1,2,3)
for (v in c(4:6))
{
  print(c(x, v))
}
x

#create vector elements
x <- NULL
for(i in 1:5){
  x[i] <- i * 2
}
x
#substitute 2 and 3 position with zero values
for(i in 2:3){
  x[i] <- 0
}
x




x = c(1,2,3)
for (v in c(4:6))
{
  x = x * v
  print(x)
}
x

#-----------
y = 0
for (x in c(1,2,3)) {
  for (v in c(4:6))
  {
    y[x] = x * v
    print(paste(x,v, x))
  }
}
x;v; y

# ---------
x = 0
for (i in seq(4))
{
  for (j in seq(i))
  {
    x = x+i*j
    print(paste(i,j,x))
  }
}
x
1*1 + 2*1 + 2*2 + 3*1 + 3*2 + 3*3 + 4*1 + 4*2 + 4*3 + 4*4 #65

1*1 + 1*2 + 1*3 + 1*4
2*1 + 2*2 + 2*3 + 2*4
3*1 + 3*2 + 3*3 + 3*4
4*1 + 4*2 + 4*3 + 4*4

# ---------

#http://dept.stat.lsa.umich.edu/~kshedden/Courses/Stat600/Notes/R_introduction.pdf

x <- c(2,5,3,9,8,11,6);
count <- 0 ;
for (val in x) 
{ if(val %% 2 == 0)
  count =  count+1 ;  } 
print(count)
