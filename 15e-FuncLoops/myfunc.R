x = C(0.90,0.95,0.975,0.99,0.995)
log2 <-
function(x) log(x,base=3)
cummedian = function(x) {
  tmp = seq_along(x)
  for (i in 1:length(tmp)) tmp[i] = median(x[1:i])
  print(tmp)
  }
cummedian(df1)

interest = function(p,r,t=1) return((p * r * t) / 100 )

mapply(function(p,r,t=1) return((p * r * t) / 100 ),p,r)


cl2 = c(0.90,0.95,0.975,0.99,0.995)
qnorm(cl2)






t.single = function(obs.mean, mu, SD, n) {
  t.obt = (obs.mean - mu) / (SD / sqrt(n))
  p.value = pt(abs(t.obt), df=n-1, lower.tail=F)
  print(c(t.obt = t.obt, p.value = p.value))
  warning("P-value is one-sided. Double for two-sided.")
}

ttest <- function(sample_mean, pop_mean, sample_sd, n) {
  t <- (sample_mean - pop_mean) / (sample_sd/sqrt(n))
}


# Blank Function
my.fun = function() {
  for (i in 1:1000) {
    ...
    for (j in 1:20) {
      ...
    }
  }
  return(output)
}
