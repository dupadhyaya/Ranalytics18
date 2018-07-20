par(mfrow=c(2, 2))
par(mar=c(7, 0, 3, 1))
par(mex=0.7)
dotchart(t(VADeaths[1:3,]), xlim = c(0,40), cex=0.6,
         labels=c("RM", "RF", "UM", "UF"))

par(mex=1)
par(mar=c(5, 3, 2, 1))
sunflowerplot(x=sort(round(rnorm(100))), y= round(rnorm(100),0),
              xlab="", ylab="", xlim=c(-3, 3), ylim=c(-3, 3), cex=0.5,
              size=1/12, seg.lwd=1, seg.col="grey",
              axes=FALSE)
axis(1, at=seq(-3, 3, 3))
axis(2, at=seq(-3, 3, 3))


hc <- hclust(dist(USArrests), "ave")
dend1 <- as.dendrogram(hc)
dend2 <- cut(dend1, h=70)
par(cex=0.7)
par(mar=c(1, 0, 2, 5.5))
#  dend2$lower is *NOT* a dendrogram, but a list of .. :
plot(dend2$lower[[3]], 
     horiz = TRUE, type = "tr", axes=FALSE, cex=0.8)
par(mar=c(6, 0, 2, 0))
# "inner" and "leaf" edges in different type & color :
plot(dend2$lower[[2]], 
     edgePar = list(col=c("black", "grey")), edge.root=TRUE, 
     axes=FALSE, cex=0.8)

library(lattice)
trellis.par.set(theme = canonical.theme("postscript", col=FALSE))
trellis.par.set(list(dot.symbol=list(pch=4)))
print(
  xyplot(lat ~ long, data=quakes, pch="*")
  
)
tplot <- xyplot(lat ~ long, data=quakes, pch=".")



trellis.par.set(theme = canonical.theme("postscript", col=FALSE))
trellis.par.set(list(dot.symbol=list(pch=1)))
print(
  update(tplot, 
         main="Earthquakes in the Pacific Ocean\n(since 1964)")
  
)

trellis.par.set(theme = canonical.theme("postscript", col=FALSE))
trellis.par.set(list(fontsize=list(text=9, points=8)))
show.settings()
library(grid)
pushViewport(plotViewport(c(5, 4, 2, 2)))
pushViewport(dataViewport(pressure$temperature,
                          pressure$pressure,
                          name="plotRegion"))
pushViewport(plotViewport(c(3,34,2,3)))
?pushViewport
# push the same viewport several times
grid.newpage()
vp <- viewport(width=0.5, height=0.5)
pushViewport(vp)
grid.rect(gp=gpar(col="blue"))
grid.text("Quarter of the device",
          y=unit(1, "npc") - unit(1, "lines"), gp=gpar(col="blue"))
pushViewport(vp)
grid.rect(gp=gpar(col="red"))
grid.text("Quarter of the parent viewport",
          y=unit(1, "npc") - unit(1, "lines"), gp=gpar(col="red"))
popViewport(2)
# push several viewports then navigate amongst them
grid.newpage()
grid.rect(gp=gpar(col="grey"))
