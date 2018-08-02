#CLT
sdm.sim <- function(n,src.dist=NULL,param1=NULL,param2=NULL) {
  r <- 10000  # Number of replications/samples - DO NOT ADJUST
  # This produces a matrix of observations with  
  # n columns and r rows. Each row is one sample:
  my.samples <- switch(src.dist,
                       "E" = matrix(rexp(n*r,param1),r),
                       "N" = matrix(rnorm(n*r,param1,param2),r),
                       "U" = matrix(runif(n*r,param1,param2),r),
                       "P" = matrix(rpois(n*r,param1),r),
                       "C" = matrix(rcauchy(n*r,param1,param2),r),
                       "B" = matrix(rbinom(n*r,param1,param2),r),
                       "G" = matrix(rgamma(n*r,param1,param2),r),
                       "X" = matrix(rchisq(n*r,param1),r),
                       "T" = matrix(rt(n*r,param1),r))
  all.sample.sums <- apply(my.samples,1,sum)
  all.sample.means <- apply(my.samples,1,mean)   
  all.sample.vars <- apply(my.samples,1,var) 
  par(mfrow=c(2,2))
  hist(my.samples[1,],col="gray",main="Distribution of One Sample")
  hist(all.sample.sums,col="gray",main="Sampling Distributionnof
       the Sum")
  hist(all.sample.means,col="gray",main="Sampling Distributionnof the Mean")
  hist(all.sample.vars,col="gray",main="Sampling Distributionnof
       the Variance")
}
sdm.sim(50,src.dist="E",param1=1)
set.seed(13)
fg <- sample(x=c(0,1),size=8*10,replace=TRUE,prob=c(.20,.80))
fgm <- matrix(fg,nrow=10)
fgmd <- cbind(fgm,apply(fgm,1,mean)*100)
fgmd

