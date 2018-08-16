#Basic Data Types

#Numeric ----
#Decimal values are called numerics in R. It is the default computational data type. If we assign a decimal value to a variable x as follows, x will be of numeric type.

x = 10.5       # assign a decimal value 
x              # print the value of x [1] 10.5 
class(x)       # print the class name of x [1] "numeric"

#Furthermore, even if we assign an integer to a variable k, it is still being saved as a numeric value.

(k = 1) #[1] 1 
class(k)       # print the class name of k [1] "numeric"
is.integer(k)  # is k an integer? FALSE

#INTEGER----
#invoke as.integer function 

(y = as.integer(3) )  # print the value of y [1] 3 
class(y)       # print the class name of y 
[1] "integer" 
is.integer(y)  # is y an integer? [1] TRUE

#coerce a numeric value into an integer with the same as.integer function.
as.integer(3.14)    # coerce a numeric value [1] 3

#And we can parse a string for decimal values in much the same way.
as.integer("5.27")  # coerce a decimal string [1] 5

as.integer(TRUE)    # the numeric value of TRUE [1] 1 
as.integer(FALSE)   # the numeric value of FALSE [1] 0

#CHARACTER----
#A character object is used to represent string values in R. We convert objects into character values with the as.character() function:
  
(x = as.character(3.14) )   # print the character string [1] "3.14" 
class(x)       # print the class name of x [1] "character"

fname = "Joe"; lname ="Smith" 
paste(fname, lname) #concatenate character values



#LOGICAL----
#A logical value is often created via comparison between variables.
x = 1; y = 2   # sample values 
z = x > y      # is x larger than y? 
z              # print the logical value [1] FALSE 
class(z)       # print the class name of z [1] "logical"

#Standard logical operations are "&" (and), "|" (or), and "!" (negation).
u = TRUE; v = FALSE 
u & v          # u AND v [1] FALSE 
u | v          # u OR v [1] TRUE 
!u             # negation of u [1] FALSE


#COMPLEX
#A complex value in R is defined via the pure imaginary value i.
(z = 1 + 2i)     # create a complex number, print the value of z 1+2i 
class(z)       # print the class name of z [1] "complex"
