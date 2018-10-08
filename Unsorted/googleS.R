# Google Places
#https://stackoverflow.com/questions/28026897/google-place-with-r


library(googleway)

# NOT RUN {
## query restaurants in Melbourne (will return 20 results)
api_key <- 'your_api_key'

res <- google_places(search_string = "Restaurants in Melbourne, Australia",  key = api_key)


## melbourne, AU  
df_places <- google_places(search_string = "cafe",    location = c(-37.81827, 144.9671),   key = key)

df_places$results$name
## use the 'next_page_token' from the previous search to get the next 20 results
res_next <- google_places(search_string = "Restaurants in Melbourne, Australia",  page_token = res$next_page_token, key = api_key)

## search for a specific place type
google_places(location = c(-37.817839,144.9673254),place_type = "bicycle_store", radius = 20000, key = api_key)

## search for places that are open at the time of query
google_places(search_string = "Bicycle shop, Melbourne, Australia", open_now = TRUE, key = api_key)

# }