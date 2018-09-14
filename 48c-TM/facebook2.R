# Facebook Analytics
#http://thinktostart.com/analyzing-facebook-with-r/
  
#install.packages("devtools")
library(devtools)
install_github("Rfacebook", "pablobarbera", subdir="Rfacebook")

require (Rfacebook)
fb_oauth <- fbOAuth(app_id="289287295005213", app_secret="b624856b1b54d3146e8d9d93b5d667fa",extended_permissions = TRUE)

save(fb_oauth, file="fb_oauth")

load("fb_oauth")
me <- getUsers("me",token=fb_oauth)
my_likes <- getLikes(user="me", token=fb_oauth)

token <- 'YOUR AUTHENTICATION TOKEN'
me <- getUsers("me", token, private_info=TRUE)

getUsers(c("barackobama", "donaldtrump"), token)
