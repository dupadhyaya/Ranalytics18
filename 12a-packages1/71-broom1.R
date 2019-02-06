
library(tidyr)
library(dplyr)
library(broom)
mdply(expand.grid(mean = 1:5, sd = 1:5), as.data.frame(rnorm), n = 10)
mtcars %>%   group_by(cyl) %>%  summarise(hp_mean = list(tidy(lm(hp ~ 1, data  = .))))

apply_lm <- function(df){ tidy(lm(data = df, hp ~ 1)) }
d <- mtcars %>%   group_by(cyl) %>% nest() %>%  mutate(hp_mean = purrr::map(.f = apply_lm, . = data)) 
d
d %>% unnest(hp_mean)

mtcars %>%  group_by(cyl) %>% dplyr::group_split() %>% map_dfr(~lm(hp ~ 1, data = .) %>% tidy())

#https://data-se.netlify.com/2018/12/10/new-split-apply-combine-variant-in-dplyr-group-split/
library(dplyr)


library(magrittr)
library(dplyr)
mtcars %>%  filter(wt > 2) %$%  cor.test(hp, mpg)

all_letters <- c(letters, LETTERS) %>%  sort %T>% write.csv(file = "all_letters.csv")
read.csv("all_letters.csv") %>% head()

#%T>% (tee operator) allows you to forward a value into a side-effect-producing function while keeping the original lhs value intact. In other words: the tee operator works like %>%, except the return values is lhs itself, and not the result of the rhs function/expression.
