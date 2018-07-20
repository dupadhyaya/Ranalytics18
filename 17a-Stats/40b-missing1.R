#misssing data

#NA
z = c(1, 2, NA, 8 , 3, NA, 3)
z
is.na(z)

x = c('A',NA,'B')
is.na(x)

# NULL
x1 = c(1, NULL, 3)
x1
is.null(x1)

#NULL cannot be part of vector
x= 1/0
y = x + 2
is.nan(x)
is.nan(y)
 
  