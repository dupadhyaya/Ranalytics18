# Pipe Symbols in tidyverse

library(magrittr)
#
library(magrittr)

car_data <- 
  mtcars %>%
  subset(hp > 100) %>%
  aggregate(. ~ cyl, data = ., FUN = . %>% mean %>% round(2)) %>%
  transform(kpl = mpg %>% multiply_by(0.4251)) %>%
  print

#not a good alternative
car_data <- 
  transform(aggregate(. ~ cyl, 
                      data = subset(mtcars, hp > 100), 
                      FUN = function(x) round(mean(x, 2))), 
            kpl = mpg*0.4251)
car_data

#anonymous functions
head(car_data,1)
tail(car_data,1)
car_data %>%
  (function(x) {
    if (nrow(x) > 2) 
      rbind(head(x, 1), tail(x, 1))
    else x
  })

#shorthand notation of above
car_data %>%
{ 
  if (nrow(.) > 0)
    rbind(head(., 1), tail(., 1))
  else .
}

#useful but less used
1:10 %>% (substitute(f(), list(f = sum)))

#tee----
#returns the left-hand side value, and not the result of the right-hand side operation.
set.seed(1234)
rnorm(200) %>%
  matrix(ncol = 2) %T>%
  plot %>% # plot usually does not return anything. 
  colSums
set.seed(1234)
x=rnorm(200) 
m=matrix(x, ncol=2)  #tee applied after this to skip 1 function for print
plot(m)
colSums(m)



#$operator-----
iris %>%
  subset(Sepal.Length > mean(Sepal.Length)) %$%
  cor(Sepal.Length, Sepal.Width)

data.frame(z = rnorm(100)) %$% 
  ts.plot(z)



#%<>%----
#shorthand notation for expressions like foo <- foo %>% bar %>% baz, which boils down to foo %<>% bar %>% baz

mpgwt <- mtcars %>% filter(mpg > 25) %>% select(mpg, wt) %>% print
mpgwt <- mpgwt %>% transform(mpg = mpg * 2)  %>% print
mpgwt %<>% transform(mpg = mpg * 2) %>% print

#aliases ------
set.seed(1234)
rnorm(1000)    %>%
  multiply_by(5) %>%
  add(5)         %>%
  { 
    cat("Mean:", mean(.), 
        "Variance:", var(.), "\n")
    head(.)
  }

#alternative
set.seed(1234)
rnorm(100) %>% `*`(5) %>% `+`(5) %>% 
{
  cat("Mean:", mean(.), "Variance:", var(.),  "\n")
  head(.)
}
