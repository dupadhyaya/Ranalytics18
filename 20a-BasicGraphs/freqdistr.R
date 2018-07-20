# Frequency Distribution

duration = faithful$eruptions 
range(duration)
breaks = seq(1.5, 5.5, by=0.5)    # half-integer sequence 
breaks 
duration.cut = cut(duration, breaks, right=FALSE)
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
