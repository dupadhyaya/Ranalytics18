# Hypo Test on ND data
#https://www.r-bloggers.com/hypothesis-testing-on-normally-distributed-data-in-r/
#interested in knowing if the average value of a certain parameter differs significantly from 
#a given value within a well defined confidence level: 
#Ho : U = Uo
#Ha : U != Uo
#mutually Exclusive Hypothesis
#First, we should check what kind of distribution our data follows. 
#Roughly speaking, if the number of samples is > 30 we can plot 
#a histogram to get a visual grasp of the distribution and then 
#run a few simple function, 
#to assess the skewness and kurtosis of the distribution. 

The code below can be used to perform a z-test under the following
# assumptions:
# 1. The data is normally distributed
# 2. Samples are iid
# 
# Remember that:
# 1.Low pvalue: strong empirical evidence against h0
# 2.High pvalue: little or 'no' empirical evidence against h0
#
# Generally, as a rule of thumb pvalue < 0.05 can be considered low 
# however it depends on many factors and I'd rather not dive into 
# this :)

# Data to perform the test on
data_vector <- c(63, 75, 84, 58, 52, 96, 63, 55, 76, 83)

# Left tail test
# H0: mu >= mu0
# H1: mu < mu0
t.test.left <- function(data, mu0, alpha)
{
  t.stat <- (mean(data) - mu0) / (sqrt(var(data) / length(data)))
  dof <- length(data) - 1
  t.critical <- qt(alpha, df= dof) #Es alpha 0.05 -> -1.64 (df=Inf)
  p.value <- pt(t.stat, df= dof)
  
  if(t.stat <= t.critical)
  {
    print("Reject H0")
  }
  else
  {
    print("Accept H0")
  }
  print('T statistic')
  print(t.stat)
  print('T critical value')
  print(t.critical)
  print('P value')
  print(p.value)
  print("#####################")
  
  return(t.stat)
}

t.test.left(data_vector, 73, 0.05)

# Right tail test
# H0: mu <= mu0
# H1: mu > mu0
t.test.right <- function(data, mu0, alpha)
{
  t.stat <- (mean(data) - mu0) / (sqrt(var(data) / length(data)))
  dof <- length(data) - 1
  t.critical <- qt(1-alpha, df= dof) #Es alpha 0.05 -> 1.64 (df=Inf)
  p.value <- 1 - pt(t.stat, df= dof)
  
  if(t.stat >= t.critical)
  {
    print("Reject H0")
  }
  else
  {
    print("Accept H0")
  }
  print('T statistic')
  print(t.stat)
  print('T critical value')
  print(t.critical)
  print('P value')
  print(p.value)
  print("#####################")
  
  return(t.stat)
}

t.test.right(data_vector, 73, 0.05)


# Two tail z test
# H0: mu = mu0
# H1: mu != mu0
t.test.twoTails <- function(data, mu0, alpha)
{
  t.stat <- abs((mean(data) - mu0)) / (sqrt(var(data) / length(data)))
  dof <- length(data) - 1
  t.critical <- qt(1-alpha/2, df= dof) #Es alpha 0.05 -> -1.9599 (df=Inf)
  p.value <- 2*(1-pt(t.stat, df= dof))
  
  if(t.stat >= t.critical)
  {
    print("Reject H0")
  }
  else
  {
    print("Accept H0")
  }
  print('T statistic')
  print(t.stat)
  print('T critical values')
  print(c(-t.critical,t.critical))
  print('P value')
  print(p.value)
  print("#####################")
  
  return(t.stat)
}

t.test.twoTails(data_vector, 73, 0.05)

#Plot of Student Distribution
dfs <- length(data_vector)-1
x_ <- seq(-8,8,0.1)
y <- dt(x_,dfs)
t.val <- qt(1-0.05,df=dfs)
plot(x_,y,type='l',lwd=3,col='blue',xlab='x',
     ylab='Density',main='Student distribution \n 9 Degree of Freedom')
abline(v=0)
abline(v=t.val,lwd=2,col='red')
points(t.val,dt(t.val,dfs),lwd=3,col='red')
