#if else
<<<<<<< HEAD
as.numeric(TRUE)

as.numeric(FALSE)
1==1
1< 1

toCheck = 1
if ( toCheck ==1) 
{ 
  print("hello")
}
tocheck=2
tocheck
check.bool <- function(x)
{if ( x ==1) 
  { 
    print("hello")
  } else
  { 
    print("No is not 1")
  }
}
check.bool(1)
check.bool(0)



# ifelse

ifelse(1 == 1, 'Yes', 'No')


# Compound Test
#
a = c(1,1,0,1)
b = c(2,1,0,1)
ifelse( a== 1 & b == 1, 'Yes', 'No')
# check each element of a with corr element of b
ifelse( a== 1 && b == 1, 'Yes', 'No')
# only first element checked
=======

var <- c("Private", "Private", "?", "Private")
df <- data.frame(var)
df$var[which(df$var == "?")] = "Private"
df


#
L3 <- LETTERS[1:3]
dat1 <- data.frame(x=rep(1,6),y=rep(1:3,2), fac=sample(L3, 6, replace=TRUE))
dat1

dat1[dat1$x==1 & dat1$y==1 , 1:2] <- NA
dat1

# Run from start
cond <- with(dat1, x==1 & y==1)
cond
is.na(dat1$x) <- cond
is.na(dat1$y) <- cond
dat1


#

table<- data.frame(population=c(100, 300, 5000, 2000, 900, 2500), 
                   habitat=c(1,2,3,4,5,6))
table1 = table
## Solution 1 
table$size[table$population<500]<-1
table$size[table$population>=500 & table$population<1000]<-2
table$size[table$population>=1000 & table$population<2000]<-3
table$size[table$population>=2000 & table$population<3000]<-4
table$size[table$population>=3000 & table$population<=5000]<-5
table


## Solution 2 Nested ifelse
table = table1
table$size1<-ifelse(table$population<500,1,
                    ifelse(table$population>=500 & table$population<1000,2,
                           ifelse(table$population>=1000 & table$population<2000,3,
                                  ifelse(table$population>=2000 & table$population<3000,4,5
                                  ))))

table

#

table<- data.frame(population=c(100, 300, 5000, 2000, 900, 2500), 
                   habitat=c(1,2,3,4,5,6))
table
table$size <- findInterval(table$population, c(0, 500, 1000, 2000, 3000, 5000), rightmost.closed = TRUE)
table
#>>>>>>> 50c058778f06851438b41e2cc02aecbdfb90c903

x=c(1,NA,2,3)
dplyr::if_else(x%%2==0, "Multiple of 2", "Not a multiple of 2", "Missing")


#sqldf package----
df=data.frame(k=c(2,NA,3,4,5))
#library(sqldf)
sqldf::sqldf(
  "SELECT *,
  CASE WHEN (k%2)=0  THEN 'Multiple of 2'
  WHEN  k is NULL  THEN 'Missing'
  ELSE 'Not a multiple of 2'
  END AS T
  FROM df"
)
