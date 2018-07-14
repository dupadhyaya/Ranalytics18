#https://www.r-bloggers.com/tidy-time-series-analysis-part-2-rolling-functions/
library(tidyquant)  # Loads tidyverse, tidyquant, financial pkgs, xts/zoo
library(cranlogs)   # For inspecting package downloads over time

library(tidyquant)

custom_stat_fun_2 <- function(x, na.rm = TRUE) {
  # x     = numeric vector
  # na.rm = boolean, whether or not to remove NA's
    m  <- mean(x, na.rm = na.rm)
  s  <- sd(x, na.rm = na.rm)
  hi <- m + 2*s
  lo <- m - 2*s
  ret <- c(mean = m, stdev = s, hi.95 = hi, lo.95 = lo) 
  return(ret)
}



tidyverse_downloads_rollstats <- tidyverse_downloads %>%
  tq_mutate(
    select     = count,
    mutate_fun = rollapply, 
    # rollapply args
    width      = 30,
    align      = "right",
    by.column  = FALSE,
    FUN        = custom_stat_fun_2,
    # FUN args
    na.rm      = TRUE
  )
class(tidyverse_downloads)

tidyverse_downloads_rollstats
print(tbl_df(tidyverse_downloads_rollstats), n=40)
tq_mutate_fun_options() %>% str()

#----
# tidyverse packages (see my laptop stickers from last post) ;)
pkgs <- c(
  "tidyr", "lubridate", "dplyr", 
  "broom", "tidyquant", "ggplot2", "purrr", 
  "stringr", "knitr"
)

# Get the downloads for the individual packages
tidyverse_downloads <- cran_downloads(
  packages = pkgs, 
  from     = "2017-01-01", 
  to       = "2017-06-30") %>%
  tibble::as_tibble() %>%
  group_by(package)

# Visualize the package downloads
tidyverse_downloads %>%
  ggplot(aes(x = date, y = count, color = package)) +
  # Data
  geom_point(alpha = 0.5) +
  facet_wrap(~ package, ncol = 3, scale = "free_y") +
  # Aesthetics
  labs(title = "tidyverse packages: Daily downloads", x = "",
       subtitle = "2017-01-01 through 2017-06-30",
       caption = "Downloads data courtesy of cranlogs package") +
  scale_color_tq() +
  theme_tq() +
  theme(legend.position="none")

# my case
head(data)
head(df)
names(df)
df2 = xts(df[1:4], order.by=df$timestamp2)
names(df2)

custom_stat_fun_3 <- function(x, na.rm = TRUE) {
  # x     = numeric vector
  # na.rm = boolean, whether or not to remove NA's
  m  <- mean(x, na.rm = na.rm)
  s  <- sd(x, na.rm = na.rm)
  hi <- m + 1*s
  lo <- m - 1*s
  ret <- c(mean = m, stdev = s, hi.95 = hi, lo.95 = lo) 
  return(ret)
}
class(df2)


df2_rollstats <- df %>%
  tq_mutate(
    select     = value,
    mutate_fun = rollapply, 
    # rollapply args
    width      = 30,
    align      = "right",
    by.column  = FALSE,
    FUN        = custom_stat_fun_3,
    # FUN args
    na.rm      = TRUE
  )


#timeAverage