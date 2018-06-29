# Data description ----
#http://cmdlinetips.com/2018/03/skimr-a-r-package-to-skim-summary-data-effortlessly/

# install.packages("devtools")
devtools::install_github("ropenscilabs/skimr")

library(gapminder)
library(dplyr)
library(skimr)

x = seq(1000)
y = rnorm(1000,mean=3)
df = data.frame(x,y)
skim(df)

skim(gapminder, lifeExp, gdpPercap) 
skim(mtcars)

funs <- list(
  min = min,
  max = max,
  mean = mean
)
skim_with(numeric = funs, append = FALSE)

gapminder %>% 
  filter(year==2007) %>%
  select(continent,lifeExp,gdpPercap)%>%
  group_by(continent) %>%
  skim()

# Restore defaults
skim_with_defaults()
