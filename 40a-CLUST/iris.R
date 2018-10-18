

data(iris)
library(dplyr)
library(tidyr)

# The easy way, if your data allows, is to tidy the data, find the max in
# each group, and join the results back in
iris_id = iris %>% mutate(id=1:nrow(.))
iris_id
iris_id %>%
  gather('attribute', 'value', Sepal.Length:Petal.Width) %>%
  group_by(id) %>%
  summarize(max_attribute=max(value)) %>%
  right_join(iris_id, by='id') %>%
  head(3)
