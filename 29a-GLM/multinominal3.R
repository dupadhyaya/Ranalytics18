#multinomial3
#https://www.r-bloggers.com/how-to-multinomial-regression-models-in-r/
#
n <- 1000
df1 <- data.frame(x1=runif(n,0,100),x2=runif(n,0,100))
head(df1)
df1 <- transform(df1, y=1+ifelse(100 - x1 - x2 + rnorm(n,sd=10) < 0, 0,
       ifelse(100 - 2*x2 + rnorm(n,sd=10) < 0, 1, 2)),   set="Original")
head(df1)
df1
# Load the neural network package and fit the model
library(nnet)
mod <- multinom(y ~ x1 + x2, df1)

predict(mod)

predict(mod,df1,"probs")


# Function to predict multinomial logit choice model outcomes
# model = nnet class multinomial model
# newdata = data frame containing new values to predict
predictMNL <- function(model, newdata) {
  
  # Only works for neural network models
  if (is.element("nnet",class(model))) {
    # Calculate the individual and cumulative probabilities
    probs <- predict(model,newdata,"probs")
    cum.probs <- t(apply(probs,1,cumsum))
    
    # Draw random values
    vals <- runif(nrow(newdata))
    
    # Join cumulative probabilities and random draws
    tmp <- cbind(cum.probs,vals)
    
    # For each row, get choice index.
    k <- ncol(probs)
    ids <- 1 + apply(tmp,1,function(x) length(which(x[1:k] < x[k+1])))
    
    # Return the values
    return(ids)
  }
}


# Make up some new data
n <- 200
df <- data.frame(x1=runif(n,0,100),
                 x2=runif(n,0,100),
                 set="Model")
y2 <- predictMNL(mod,df)
df2 <- cbind(df,y=y2)

