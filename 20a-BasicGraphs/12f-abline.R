#abline

abline(h=yvalues, v=xvalues)

Other graphical parameters (such as line type, color, and width) can also be specified in the abline( ) function.

# add solid horizontal lines at y=1,5,7 
abline(h=c(1,5,7))
# add dashed blue verical lines at x = 1,3,5,7,9
abline(v=seq(1,10,2),lty=2,col="blue")

Note: You can also use the grid( ) function to add reference lines.
