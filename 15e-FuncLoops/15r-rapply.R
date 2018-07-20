#apply RAPPLY

#rapply - For when you want to apply a function to each element 
#of a nested list structure, recursively.

#rapply is best illustrated with a user-defined function to apply:
#Append ! to string, otherwise increment

myFun <- function(x){
  if (is.character(x)){
  return(paste(x,"!",sep=""))  # add character
  }
  else{
  return(x + 1)  #inc by 1
  }
}

#A nested list structure
(l <- list(a = list(a1 = "Boo", b1 = 2, c1 = "Eeek"), b = 3, c = "Yikes", 
   d = list(a2 = 1, b2 = list(a3 = "Hey", b3 = 5))))


#Result is named vector, coerced to character           
rapply(l,myFun)

#Result is a nested list like l, with values altered
rapply(l, myFun, how = "replace")
