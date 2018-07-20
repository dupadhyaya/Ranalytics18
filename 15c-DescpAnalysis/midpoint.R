# Mid Point


df<- data.frame(lon1=c(-4.568,-4.3980), 
                lat1=c(59.235,56.369), 
                lon2=c(-5.123,-4.698), 
                lat2=c(60.258,59.197) )
df
df$midlong <- apply(df[,c(1,3)], 1, mean) 
df$midlat <- apply(df[,c(2,4)], 1, mean) 
df 



#
library(geosphere) 
#library(midpoint)

(p1 <- matrix(c(df$lon1,df$lat1), ncol=2  ) )
(p2 <- matrix(c(df$lon2,df$lat2), ncol=2  ) )

(midpoint <- as.data.frame(midPoint(p1,p2) ) )
