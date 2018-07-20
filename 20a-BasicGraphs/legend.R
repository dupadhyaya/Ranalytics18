#Legend

counts <- table(mtcars$gear)
barplot(counts, main="Car Distribution", xlab="Number of Gears")
barplot(counts, beside=T, legend=T, 
        main="Car Distribution", xlab="Number of Gears",
        args.legend = list(x='right',bty='n'))
palette()  # current settings
# 3 series in this example 3,4,5
palette(gray(seq(0.5,1,len=3)))
palette()
palette('default')
palette(gray(seq(0.5,1,len=3)))
barplot(counts, beside=T, legend=T, col=palette(),
        args.legend = list(x='right',bty='n'))
#Other Method
barplot(counts, beside=T, col=palette())
legend(x= 'topright',legend = rownames(counts), fill=palette(),
       title='No of Gears')
?legend
legend(x, y = NULL, legend, fill = NULL, col = par("col"),
       border = "black", lty, lwd, pch,
       angle = 45, density = NULL, bty = "o", bg = par("bg"),
       box.lwd = par("lwd"), box.lty = par("lty"), box.col = par("fg"),
       pt.bg = NA, cex = 1, pt.cex = cex, pt.lwd = lwd,
       xjust = 0, yjust = 1, x.intersp = 1, y.intersp = 1,
       adj = c(0, 0.5), text.width = NULL, text.col = par("col"),
       text.font = NULL, merge = do.lines && has.pch, trace = FALSE,
       plot = TRUE, ncol = 1, horiz = FALSE, title = NULL,
       inset = 0, xpd, title.col = text.col, title.adj = 0.5,
       seg.len = 2)

# Other Color Palettes - rainbow, heat.colors, terrain.colors, 
# topo.colors, cm.colors, gray
palette(c('red','blue','green'))
barplot(counts, beside=T, col=palette())
legend(x= 2, y=15,legend = rownames(counts), fill=palette(),
       title='No of Gears')
# When plot with lines/ points , col=par('col'); pch= plotting symbol
#bty = border n,o, # 
