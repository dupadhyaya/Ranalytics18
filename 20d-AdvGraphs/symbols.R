require(stats); require(grDevices)
x <- 1:10
y <- sort(10*runif(10))
z <- runif(10)
z3 <- cbind(z, 2*runif(10), runif(10))
x;y;z
symbols(x, y, thermometers = cbind(.5, 1, z), inches = .5, fg = 1:10)
symbols(x, y, thermometers = z3, inches = FALSE)
text(x, y, apply(format(round(z3, digits = 2)), 1, paste, collapse = ","),
     adj = c(-.2,0), cex = .75, col = "purple", xpd = NA)
symbols(x, y , circles=z, inches=.2)

## Note that  example(trees)  shows more sensible plots!
N <- nrow(trees)
with(trees, {
  ## Girth is diameter in inches
  symbols(Height, Volume, circles = Girth/24, inches = FALSE,
          main = "Trees' Girth") # xlab and ylab automatically
  ## Colours too:
  op <- palette(rainbow(N, end = 0.9))
  symbols(Height, Volume, circles = Girth/16, inches = FALSE, bg = 1:N,
          fg = "gray30", main = "symbols(*, circles = Girth/16, bg = 1:N)")
  palette(op)
})

head(trees)
with(trees, symbols(Height, Volume, circles = Girth/24, inches = FALSE,
                    main = "Trees' Girth") )
op <- palette(rainbow(N, end = 0.9)) 
with(trees, symbols(Height, Volume, circles = Girth/16, inches = FALSE, bg = 1:N, fg = "gray30", main = "symbols(*, circles = Girth/16, bg = 1:N)"))
