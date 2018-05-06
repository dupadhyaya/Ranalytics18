#Strings using dplyr
#http://tidyr.tidyverse.org/reference/separate.html
# separate(data, col, into, sep = "[^[:alnum:]]+", remove = TRUE, convert = FALSE, extra = "warn", fill = "warn", ...)

library(dplyr)
library(tidyr)
df1 <- data.frame(x = c(NA, "a.b", "a.d", "b.c"))
df1
(df1 %>% separate(x, c("A", "B")))


# If every row doesn't split into the same number of pieces, use
# the extra and file arguments to control what happens
df2 <- data.frame(x = c("a", "a b", "a b c", NA))
df2
df2 %>% separate(x, c("a", "b"))
#> Warning: Expected 2 pieces. Additional pieces discarded in 1 rows [3].
#> Warning: Expected 2 pieces. Missing pieces filled with `NA` in 1 rows [1].

# The same behaviour but no warnings
df2 %>% separate(x, c("a", "b"), extra = "drop", fill = "right")

# Another option:
df2 %>% separate(x, c("a", "b"), extra = "merge", fill = "left")

# If only want to split specified number of times use extra = "merge"
df3 <- data.frame(x = c("x: 123", "y: error: 7"))
df3 %>% separate(x, c("key", "value"), ": ", extra = "merge")

#>   key    value
#> 1   x      123
#> 2   y error: 7

