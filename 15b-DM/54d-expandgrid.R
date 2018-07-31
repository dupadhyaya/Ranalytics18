# Expand Grid
expand.grid(height = seq(60, 80, 5), weight = seq(100, 300, 50),
            sex = c("Male","Female"))

x <- seq(0, 10, length.out = 100)
y <- seq(-1, 1, length.out = 20)
d1 <- expand.grid(x = x, y = y)
d1
d2 <- expand.grid(x = x, y = y, KEEP.OUT.ATTRS = FALSE)
d2
object.size(d1) - object.size(d2)
##-> 5992 or 8832 (on 32- / 64-bit platform)
