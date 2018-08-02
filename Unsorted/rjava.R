# Java in R
# 

Sys.getenv("PATH")
Sys.getenv("JAVA_HOME")
#JAVA_HOME path to the jre folder inside "jdk1.8.0_121"
#

install.packages('rJava')
library(rJava)

#https://support.microsoft.com/en-us/help/3103813/qa-when-i-try-to-load-the-rjava-package-using-the-library-command--i-g
# Linux
# https://stackoverflow.com/questions/3311940/r-rjava-package-install-failing
# http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html
# 
# 
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_144\\bin')

remove.packages('rJava')
?remove
.rs.restartR()

#https://stackoverflow.com/questions/43788788/another-rjava-library-install-error-rjava-rdb-is-corrupt
#