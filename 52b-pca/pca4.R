#pca4

dat<-read.csv("http://faculty.missouri.edu/huangf/data/mvnotes/READING120n.csv")
str(dat) #just checking on our data

options(digits=3) #just so we don't get so many digits in our results
dat<-dat[,-1] #removing the first variable which is gender
head(dat,n=7)
(p<-ncol(dat)) #no of variables

R<-cor(dat) #saving the correlation matrix
R #displaying it-- note: if you put a parenthesis around your statement, it will also print the output as a default. Just showing it this way for clarity.

# if the variables were all orthogonal), there would be no way to combine the variables as factors or components. 


#Highlight from the function name to the ending bracket and run. After, a new function called bart will now be available. For now, don't have to worry about how that is created.
bart<-function(dat){ #dat is your raw data
  R<-cor(dat)
  p<-ncol(dat)
  n<-nrow(dat)
  chi2<- -((n-1)-((2*p)+5)/6 ) * log(det(R)) #this is the formula
  df<-(p*(p-1)/2)
  crit<-qchisq(.95,df) #critical value
  p<-pchisq(chi2,df,lower.tail=F) #pvalue
  cat("Bartlett's test of sphericity: X2(",
      df,")=",chi2,", p=",
      round(p,3),sep="" )   
}

bart(dat)
#p value is < .001 (not really 0!) and is statistically significant. PCA can be done
# Some Correlation exists

e<-eigen(R) #solving for the eigenvalues and eigenvectors from the correlation matrix
str(e)
e

(L<-e$values) #placing the eigenvalues in L
(Vm<-matrix(0,nrow=p,ncol=p)) #creating a p x p matrix with zeroes.
#Vm is an orthogonal matrix since all correlations between variable are 0.
(diag(Vm)<-L) #putting the eigenvalues in the diagonals
L
Vm #check-- matrix with eigenvalues on the diagonals
e$vectors #these are the eigenvectors-- these are the standardized regression weights

(loadings<-e$vectors %*% sqrt(Vm)) #these are the loadings
#or the correlation of the component variables with the original variables-- sometimes referred to as the P matrix. And PP` is the original correlation matrix.
#SPSS refers to this as the component matrix

cor(dat) #original correlation matrix

e$vectors %*% Vm %*% t(e$vectors) # V L V`


#This is the proportion of variance accounted for by each PC
L/length(L)


zdat<-scale(dat) #this is just to standardize the original data, M = 0, SD =1
pca.scores<- zdat %*% e$vectors #scaled values x vectors
colnames(pca.scores)<-c('pca1','pca2','pca3','pca4','pca5','pca6') #just quickly naming the columns
head(pca.scores) #just to show some component scores
round(colMeans(pca.scores),2) #each pca score has a mean of zero
apply(pca.scores,2,var) #if you get the variance PER column...

e$values #...it will be the same as the eigenvalues too

head(scale(pca.scores)[,1]) #check this with SPSS output- just the first 6 component scores
e$values/p 

round(cor(pca.scores),2) #that is not an error, I had it round to 2 decimal places to make it clearer. This is a correlation matrix. 

cor(dat[,1:6],pca.scores[,1]) #this is correlating the six original variables with the first PC.

comp.matrix<-e$vectors %*% sqrt(Vm) #sometimes referred to as P matrix
#or eigenvectors x sqrt(Vm): P %*% t(P) is equal to the R matrix.
comp.matrix

comp.matrix[,1]^2 #comp 1 accounts can account for 71% of the variance of the first variable
