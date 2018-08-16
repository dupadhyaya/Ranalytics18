#titles

title(main="main title", sub="sub-title", 
      xlab="x-axis label", ylab="y-axis label")

# Add a red title and a blue subtitle. Make x and y 
# labels 25% smaller than the default and green. 
plot(x=1)
title(main="My Title", col.main="red", 
      sub="My Sub-title", col.sub="blue", 
      xlab="My X label", ylab="My Y label",
      col.lab="green", cex.lab=0.75)
