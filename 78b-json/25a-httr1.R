#httr package to import data from webpages

#Load the httr package
library("httr")
get_http <- GET("http://httpbin.org/get")
str(get_http, list.len = 3)


arg_pars <- list(country = "UK", manufacturer = "Mars")
arg_resp <- GET("https://httpbin.org/get", query = arg_pars)
print(arg_resp)
#Status: 200, means successful request

#POST request
post_http <- POST(url="http://httpbin.org/post", body="This message is from strboul")
print(post_http)


#You are expected to be reasonable and respect the API service1, for sure. APIs have access tokens to control the misuse of their services, which usually limit the number of requests coming by unique users or sessions making the servers very busy or locked. Giving an example, Twitter controls the number of requests to the server by rate-limiting. That makes available GET requests in two ways: “15 calls every 15 minutes, and 180 calls every 15 minutes.” To correspond this request time, you can use Sys.sleep() function in a for loop in order to send expressions in a specified time interval.
