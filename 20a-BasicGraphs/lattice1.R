# Lattice Package - improves base graphs
library(lattice)
head(df1)
names(df1)
lattice::densityplot(~ df1$sales)
lattice::densityplot(~ df1$sales | df1$coy)
lattice::densityplot(~ df1$sales | df1$coy, layout=c(1,3))
#lattice::densityplot(df1$loc ~ df1$sales | df1$coy, layout=c(1,3))
str(df1)
lattice::bwplot(df1$loc ~ df1$sales | df1$coy, layout=c(1,3))
lattice::xyplot(df1$adtv ~ df1$adweb | df1$loc )
lattice::cloud(df1$adweb ~ df1$salesman * df1$loc )
lattice::dotplot(df1$sales ~ df1$adtv | df1$coy, layout=c(1,3) )
lattice::splom(df1[c(sales, adtv, coy),] )

#formula Method
#
