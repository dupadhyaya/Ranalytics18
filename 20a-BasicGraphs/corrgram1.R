#correloggram

# First Correlogram Example

library(corrgram)
corrgram(mtcars, order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt,
         main="Car Milage Data in PC2/PC1 Order")
cor(mtcars[1:5])
corrgram(mtcars[1:5], order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt)



#https://www.statmethods.net/advgraphs/correlograms.html


# Second Correlogram Example
library(corrgram)
corrgram(mtcars[1:5], order=TRUE, lower.panel=panel.ellipse,
         upper.panel=panel.pts, text.panel=panel.txt,
         diag.panel=panel.minmax)
