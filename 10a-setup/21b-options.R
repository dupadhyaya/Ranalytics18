#Options
#Allow the user to set and examine a variety of global options which affect the way in which R computes and displays its results.
#https://stat.ethz.ch/R-manual/R-devel/library/base/html/options.html


options() #what options avl
op = options()  #save options to reset later

getOption(x='width')
getOption(x='digits')
(x=pi)
#set options
options(digits=3)
x #3.14 instead of 3.14153
getOption(x='digits')

#reset options
options(op)
x

#
options('scipen')
#integer. A penalty to be applied when deciding to print numeric values in fixed or exponential notation. Positive values bias towards fixed and negative towards scientific notation

(x1=123.123456789123456789)
options(scipen = 999) #turn off
x1
options(scipen = 0) #turn on
x1

(x2 = c(1.810032e+09, 4.12345, 5) )
options("scipen"=-100, "digits"=4)
x2 #scientific
options("scipen"=100, "digits"=4)
x2  #min 4 digits shown with no scientific
options("scipen"=100, "digits"=3)
x2  #min 3 digits are shown



options(scipen = 5)
x1
options(scipen = -4)
x1

format(1810032000, scientific = FALSE)
format(1810032000, scientific = T)




#graphical parameters-----
par()
#parameters which can be changed
par(no.readonly = T)

stop('test it')
