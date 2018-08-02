#Panel Data

set.seed(25)

# number of obs for each case
(nT <- 5)

# set number of groups
(N <- 12)

# set possible cases
(possible.cases <- LETTERS[1:N])

# set parameters
(my.alphas <- seq(-10,10,length.out = N))
(my.beta <- 1.5)

# set indep var (x) and dates
rep(nT,N)
sapply(5,rnorm)

(indep.var <- sapply(rep(nT,N), rnorm))
(my.dates <- Sys.Date() + 1:nT)

# create response matrix (y)
(response.matrix <- matrix(rep(my.alphas,nT), nrow = nT, 
  byrow = TRUE) + indep.var*my.beta + sapply(rep(nT,N),rnorm, sd = 0.25) )

# set df
(sim.df <- data.frame(G = as.character(sapply(possible.cases, 
        rep, times=nT )), dates = rep(my.dates, times=N),
        y = as.numeric(response.matrix),   x = as.numeric(indep.var), 
        stringsAsFactors = FALSE))

# print result
print(str(sim.df))

#Plot
library(ggplot2)
#one Plot
(dataA = sim.df[sim.df$G=='A',])
plot(x ~ y, dataA)

#Multiple Plots
p <- ggplot(sim.df, aes(x=x, y=y))
p <- p + geom_point()
p <- p + facet_wrap(~G)
print(p)


library(plm)

# estimate panel data model with fixed effects
my.pdm <- plm(data = sim.df, 
              formula = y ~ x, 
              model = 'within',
              index = c('G','dates'))

# print result
print(summary(my.pdm,))
print(fixef(my.pdm))



#Case Study
library(plm)

# data from Grunfeld
data("Grunfeld")

# print it
print(str(Grunfeld))
head(Grunfeld)



my.fct <- function(df) {
  # Estimates a linear model from Grunfeld data
  # Args: #   df - dataframe from Grunfeld
  #Returns: #   lm object
  my.model <- lm(data = df,  formula = inv ~  value + capital)
  return(my.model)
}
summary(Grunfeld)
head(Grunfeld)
Grunfeld$firm
# estimate model for each firm
my.l <- by(Grunfeld, INDICES = Grunfeld$firm, FUN = my.fct)

# print result
my.coefs <- sapply(my.l, coef)
print(my.coefs)

# test if all coef are the same across firms
my.pooltest <- pooltest(inv~value+capital, 
                        data = Grunfeld, 
                        model = "pooling")

# print result
print(my.pooltest)


# set options for Hausman test
my.formula <- inv ~ value + capital
my.index <- c('firm','year')

# do Hausman test
my.hausman.test <- phtest(x = my.formula, 
                          data = Grunfeld,
                          model = c('within', 'random'),
                          index = my.index)

# print result
print(my.hausman.test)


# set panel data model with random effects
my.model <- 'random'
my.formula <- inv ~ value + capital
my.index <- c('firm','year')

# estimate it
my.pdm.random <- plm(data = Grunfeld, 
                     formula = my.formula, 
                     model = my.model,
                     index = my.index)

# print result
print(summary(my.pdm.random))


library(systemfit)

# set pdataframe
(p.Grunfeld <- pdata.frame(Grunfeld, c( "firm", "year" )))

# estimate sur
my.SUR <- systemfit(formula = inv ~value + capital,
            method =  "SUR",  data = p.Grunfeld)
print(my.SUR)
