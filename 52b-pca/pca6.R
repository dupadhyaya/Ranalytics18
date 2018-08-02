# pca6

library(psych)
hozdatamatrix <- matrix(c(
  1.000, .696, .743, .369, .184, .230,
  .696, 1.000, .724, .335, .179, .367,
  .743, .724, 1.000, .326, .211, .343,
  .369, .335, .326, 1.000, .492, .492,
  .184, .179,.211, .492, 1.000, .483,
  .230, .367, .343, .492, .483, 1.000), ncol = 6, byrow = TRUE)

hozdatamatrix
# now give the columns and rows names
colnames(hozdatamatrix)<- c("wordmean", "sentence", "paragrap", "lozenges", "cubes", "visperc")
rownames(hozdatamatrix)<- c("wordmean", "sentence", "paragrap", "lozenges", "cubes", "visperc")
######### you can NOT use the standard cor function i.e. cor(hozdatamatrix)
# With a correlaion matrix as it produces correlations or the correlations.
# you can produce a correlation plot by using the cor.plot function
# the darker the shading for the cell the highter the correlation
cor.plot(hozdatamatrix)
# According to the psych package manual you should be able to use the function
#below to obtain p values for the associated correlation matrix
# but these values appear very different to those produced by SPSS
# corr.p(r = hozdatamatrix, n= 73)
# In contrast using the determinant function det()
# gives same answer as using the raw data 0.07374609
det(hozdatamatrix)

# above gives same answer as using using raw data 0.07374609
# To carry out a PCA analysis using a correlation matrix need to
# tell the principal function how many observations formed the
# basis oc the correlations specifying a value for the the n.obs parameter
model1<- principal(hozdatamatrix, nfactors = 6, n.obs = 73, rotate = "none")
model1
# produces the same output as with the previous analysis with the raw data
# to carry out a factor analysis using a correlation matrix
# adapt the fa function in a similar way:
modelb <- fa(hozdatamatrix, nfactors = 2, fm = "pa", n.obs = 73, rotate = "none")
modelb
# The above shows how easy it is to adapt to either using raw data or the correlation matric
# in R for PCA and factor analysis in R

#You can also use the table2matrix() function in the psych package to convert a R table to a matrix. Also in the
#psych package is various read.clipboard() functions which allow you to copy and paste a matrix of correlations in
#something like Excel or word and then paste directly into R (see the psych package manual for details. 
                                                             