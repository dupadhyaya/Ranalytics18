#https://cran.r-project.org/web/packages/gridExtra/vignettes/tableGrob.html

library(gridExtra)
library(grid)
d <- head(iris[,1:3])
grid.table(d)

d[2,3] <- "this is very wwwwwide"
d[1,2] <- "this\nis\ntall"
colnames(d) <- c("alpha*integral(xdx,a,infinity)",
                 "this text\nis high", 'alpha/beta')

tt <- ttheme_default(colhead=list(fg_params = list(parse=TRUE)))
grid.table(d, theme=tt)


tt1 <- ttheme_default()
tt2 <- ttheme_minimal()
tt3 <- ttheme_minimal(
  core=list(bg_params = list(fill = blues9[1:4], col=NA),
            fg_params=list(fontface=3)),
  colhead=list(fg_params=list(col="navyblue", fontface=4L)),
  rowhead=list(fg_params=list(col="orange", fontface=3L)))

grid.arrange(
  tableGrob(iris[1:4, 1:2], theme=tt1),
  tableGrob(iris[1:4, 1:2], theme=tt2),
  tableGrob(iris[1:4, 1:2], theme=tt3),
  nrow=1)


t1 <- ttheme_default(core=list(
  fg_params=list(fontface=c(rep("plain", 4), "bold.italic")),
  bg_params = list(fill=c(rep(c("grey95", "grey90"),
                              length.out=4), "#6BAED6"),
                   alpha = rep(c(1,0.5), each=5))
))
grid.newpage()
grid.table(iris[1:5, 1:3], theme = t1)


tt1 <- ttheme_default()
tt2 <- ttheme_default(core=list(fg_params=list(hjust=1, x=0.9)),
                      rowhead=list(fg_params=list(hjust=1, x=0.95)))
tt3 <- ttheme_default(core=list(fg_params=list(hjust=0, x=0.1)),
                      rowhead=list(fg_params=list(hjust=0, x=0)))
grid.arrange(
  tableGrob(mtcars[1:4, 1:2], theme=tt1),
  tableGrob(mtcars[1:4, 1:2], theme=tt2),
  tableGrob(mtcars[1:4, 1:2], theme=tt3),
  nrow=1)


g <- g2 <- tableGrob(iris[1:4, 1:3], cols = NULL, rows=NULL)
g2$widths <- unit(rep(1/ncol(g2), ncol(g2)), "npc")
grid.arrange(rectGrob(), rectGrob(), nrow=1)
grid.arrange(g, g2, nrow=1, newpage = FALSE)


d1 <- PlantGrowth[1:3,1, drop=FALSE]
d2 <- PlantGrowth[1:2,1:2]

g1 <- tableGrob(d1)
g2 <- tableGrob(d2)

haligned <- gtable_combine(g1,g2, along=1)
valigned <- gtable_combine(g1,g2, along=2)
grid.newpage()
grid.arrange(haligned, valigned, ncol=2)


library(gtable)
g <- tableGrob(iris[1:4, 1:3], rows = NULL)
g <- gtable_add_grob(g,
                     grobs = rectGrob(gp = gpar(fill = NA, lwd = 2)),
                     t = 2, b = nrow(g), l = 1, r = ncol(g))
g <- gtable_add_grob(g,
                     grobs = rectGrob(gp = gpar(fill = NA, lwd = 2)),
                     t = 1, l = 1, r = ncol(g))
grid.draw(g)
