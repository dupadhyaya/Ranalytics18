# Facebook posts
#http://thinktostart.com/analyzing-facebook-with-r/
#errorat authentication
#https://www.listendata.com/2017/03/facebook-data-mining-using-r.html

library(devtools)

install_github("Rfacebook", "pablobarbera", subdir="Rfacebook")

#require (Rfacebook)
library(Rfacebook)
library(RCurl)

require("Rfacebook")
#https://developers.facebook.com/apps/2208824636012038/settings/basic/
  
fb_oauth <- fbOAuth(app_id="2208824636012038", app_secret="xxx",extended_permissions = TRUE)
#Not working

save(fb_oauth, file="fb_oauth")

load("fb_oauth")