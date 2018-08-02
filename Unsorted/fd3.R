#FD3





# cum relative Freq Graph
duration = faithful$eruptions 
breaks = seq(1.5, 5.5, by=0.5) 
duration.cut = cut(duration, breaks, right=FALSE) #closed on left
duration.freq = table(duration.cut) 
duration.cumfreq = cumsum(duration.freq) 
duration.cumfreq
duration.cumrelfreq = duration.cumfreq / nrow(faithful)

cumrelfreq0 = c(0, duration.cumrelfreq) 
cumrelfreq0
plot(breaks, cumrelfreq0, 
   main="Old Faithful Eruptions",  # main title 
   xlab="Duration minutes", 
   ylab="Cumulative eruption proportion") 
lines(breaks, cumrelfreq0)        # join the points


#Eg3
Fn = ecdf(duration) 
?ecdf
plot(Fn, 
   main="Old Faithful Eruptions", 
   xlab="Duration minutes", 
   ylab="Cumulative eruption proportion")
