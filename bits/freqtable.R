# Frequency Distribution

duration = faithful$eruptions 
range(duration)
breaks = seq(1.5, 5.5, by=0.5)# half-integer sequence 
breaks 
duration.cut = cut(duration, breaks, right=FALSE)
#left side not closed [1.5-2.0) ie 1.5 to 1.9999
#value of 2 will go into [2-2.5) interval
duration.cut
duration.freq = table(duration.cut)
duration.freq
cbind(duration.freq) 


# Relative Freq
duration.relfreq = duration.freq / nrow(faithful)
duration.relfreq

old = options(digits=1) 
duration.relfreq 
options(old) # restore
duration.relfreq 
cbind(duration.freq, duration.relfreq) 

# Cumulative freq
duration.cumfreq = cumsum(duration.freq)

#graphically-----
#using histogram
h = hist(faithful$eruptions)
h$breaks
h$counts
#compare with
cbind(duration.freq) 
h$mids


#right=T
duration.cut.R = cut(duration, breaks, right=T)
##value of 2 will go into (1.5-2] interval
duration.cut.R
duration.freq.R = table(duration.cut.R)
duration.freq.R
cbind(duration.freq.R) 
h$counts  #same

