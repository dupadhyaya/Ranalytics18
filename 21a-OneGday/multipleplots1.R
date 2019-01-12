#multiple Plots

library(ggplot2)
p1 <- qplot(mpg, wt, data = mtcars, colour = cyl)
p2 <- qplot(mpg, data = mtcars) + ggtitle("title")
p3 <- qplot(mpg, data = mtcars, geom = "dotplot")
p4 <-
  p1 + facet_wrap( ~ carb, nrow = 1) + theme(legend.position = "none") +
  ggtitle("facetted plot")
p4

grid.arrange(p1, p2, nrow = 1)

gl=list(p1,p2,p3,p4)
grid.arrange(
  grobs = gl,
  widths = c(2, 1, 1),
  layout_matrix = rbind(c(1, 2, NA),
                        c(3, 3, 4))
)

library(grid)
g <- ggplotGrob(qplot(1, 1) + theme(plot.background = element_rect(colour = "black")))
g
qplot(1:10, 1:10) +
  annotation_custom(grob = g, xmin = 1, xmax = 5, ymin = 5, ymax = 10  ) +
  annotation_custom(grob = rectGrob(gp = gpar(fill = "white")), xmin = 7.5,  xmax = Inf,ymin = -Inf,ymax = 5  )


library(gtable)
g2 <- ggplotGrob(p2)
g3 <- ggplotGrob(p3)
g <- rbind(g2, g3, size = "first")
g$widths <- unit.pmax(g2$widths, g3$widths)
grid.newpage()
grid.draw(g)


library(ggpubr)
p1 <- ggplot(mtcars, aes(mpg, wt, colour = factor(cyl))) +
  geom_point()
p2 <- ggplot(mtcars, aes(mpg, wt, colour = factor(cyl))) +
  geom_point() + facet_wrap(~ cyl, ncol = 2, scales = "free") +
  guides(colour = "none") +
  theme()

ggarrange(p1, p2, widths = 1:2)

grid.arrange( p3, p3, p3, nrow = 1,  top = "Title of the page",
  bottom = textGrob("this footnote is right-justified", gp = gpar(fontface = 3, fontsize = 9),  hjust = 1,   x = 1  ))


grid.arrange( tableGrob(mtcars[1:4, 1:4]),  p2, ncol = 2, widths = c(1.5, 1),
  clip = FALSE )
