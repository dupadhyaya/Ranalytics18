#Switch

use.switch <- function(x)
{
  switch(x,'a' = 'First','b' = 'Second','c' =  'Third','other')
}

use.switch('a')
use.switch('b')
use.switch('other')
use.switch('6')
use.switch(6)  # nothing returned

switch(2, 'Red', 'Blue', 'Green')
colors = c('Red', 'Blue', 'Green')
switch(2,colors)  # does not work.. elements not vectorised

#collist = as.list(colors)
#collist
#switch(2, collist)

#-----

xlist = c("A","B", "C")
value = "B"
?alist
(myList <- alist(print(xlist[1]), print(xlist[2]), print(xlist[3]), print("Other !!!")))
(myList <- setNames(myList, c(xlist, '')))  # give names to list, last is blank

?do.call
do.call(switch, c(EXPR = value, myList))
#Examples:
value = "D"
do.call(switch, c(EXPR = value, myList))
#[1] "Other !!!"
value = "A"
do.call(switch, c(EXPR = value, myList))
#[1] "A"
value = "C"
do.call(switch, c(EXPR = value, myList))
#[1] "C"
value = "B"
do.call(switch, c(EXPR = value, myList))
#[1] "B"
