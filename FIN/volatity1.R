#Asset Volatity

#https://rviews.rstudio.com/2017/07/12/introduction-to-volatility/

library(quantmod)
#A vector of symbol for our ETFs.
symbols <- sort(c("SPY","VGT","EFA","DBC","AGG"))

# Pipe them to getSymbols, extract the closing prices, and merge to one xts object. 
# Take a look at result before moving on to calculate the returns.
# Notice that we are only grabbing prices from 2013 to present, but that is 
# only to keep the loading time shorter for the post. 
prices <- 
  getSymbols(symbols, src = 'yahoo', from = "2016-01-01", 
             auto.assign = TRUE, warnings = FALSE)    
head(SPY)
head(VGT)

library(ti)

# We are going to make heavy use of the tidyquant package to get monthly returns.
portfolio_component_monthly_returns_xts <- 
  prices %>%  
  # Convert to tibble so can stay in the tidyquant/verse.
  as_tibble(preserve_row_names = TRUE) %>%
  # Add a date column. 
  mutate(date = ymd(row.names)) %>% 
  # Remove the row.names column; it's not needed anymore.
  select(-row.names) %>% 
  # I like to have the date column as the first column. 
  select(date, everything()) %>% 
  # We need to gather into long format in order to use tq_transmute().
  gather(asset, return, -date) %>%
  group_by(asset) %>% 
  # Use the function from tidyquant; note how easily we could change to
  # a different time period like weekly or yearly.
  tq_transmute(mutate_fun = periodReturn, period = "monthly") %>%
  # Put the results back to wide format.
  spread(asset, monthly.returns) %>% 
  # Convert back to an xts, so we can use the cov() and StdDev() functions.
  as_xts(date_col = date)

head(portfolio_component_monthly_returns_xts)
