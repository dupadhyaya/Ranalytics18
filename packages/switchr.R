#switchR for switching between libraries
#https://cran.r-project.org/web/packages/switchr/switchr.pdf

library(switchr)

#To switch to a different library, creating it if necessary, use the switchTo function:
  
switchTo("mynewlib")
#Then work normally, when you wish to switch back to your original library, use switchBack:
switchBack()

#-----------
.libPaths2()

#.libPaths2(fulllp, exclude.site = TRUE)

defaultRepos()

dep_repos('dplyr')

install_packages(pkgs, repos, versions = NULL, verbose = FALSE, ...)

library_paths(swtichr)
packages(dplyr)
