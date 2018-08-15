# Misc Commands
#https://www.r-project.org/help.html

#library for help-----
library(swirl)  # for online help
swirl()

#datasets-----
data()  # to see in built data sets

#? for help----
?mtcars
?mean

#help----
help(package="MASS")
help(rlm, package="MASS") # function in MASS package

help(package='dplyr')

#example on functions----
example(lm)
example(mean)


#vignette----
#Many packages include vignettes, which are discursive documents meant to illustrate and explain facilities in the package
browseVignettes()
#window opens in browser
browseVignettes(package="survival") #browser
vignette(package='survival') # text form
vignette("timedep")
vignette("timedep", package="survival")
vignette(package='dplyr')
browseVignettes(package="dplyr") #browser


#demo-----
#extended code demonstrations (“demos”). 
#demo() lists all demos for all packages in your library,
#demo(package="package-name")
demo(package='survival')  #no demo
demo(package='stats')  #avl demos
demo("nlm", package="stats")
demo(graphics)

#apropos-----
#apropos() function searches for objects, including functions, directly accessible in the current R session that have names that include a specified character string.
apropos('lm')

#help.search()----
#help.search() function scans the documentation for packages installed in your library.
help.search("^lm")

#help.start()-----
#help.start() starts and displays a hypertext based version of R’s online documentation in your default browser 
help.start()



#TeachingDemos library
#https://www.rdocumentation.org/packages/TeachingDemos/versions/2.10
