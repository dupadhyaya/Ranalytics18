
#Exercise 1
#Create a vector named v which contains 10 random integer values between -100 and +100.
(v = runif(10, -100, 100))

#Create a Vector of characters: CAPITAL alphabets 10 to 20
(v2 = LETTERS[10:20])

#Exercise 2
#Create a 3-dimensional 5×5 of 2 matrix array named a comprised of sequence of even integers greater than 25. Find mean of each matrix
(x2 = seq(from=26,to=100,by=2))
(a1 = array(x2, dim=c(5,5,2)))
apply(a1, 3, mean)


#Exercise 3
#create a Matrix 4 Rows x 6 Columns with odd numbers from 1 and calculate its Column Sum and Row Means : What is sum of all values
(x3 = seq(1,100,2))
(m3 = matrix(x3[1:24], nrow=4, ncol=6))
sum(m3)
colSums(m3)
rowMeans(m3)

Exercise 4

Without running commands in R, answer the following questions:
Exercise 6

Find the difference between elements in l[["a"]] and l[["b"]]. Find the intersection between them. Is there number 33 in their union?
  
  Exercise 7

Create 5×5 matrix named m and fill it with random numeric values rounded to two decimal places, ranging from 1.00 to 100.00.

Exercise 8

Answer the following question without running R command, then check the result.

What will be the class of data structure if you convert matrix m to:
  
  vector
list
data frame
array?
  Exercise 9

Transpose array l$b and then convert it to matrix.