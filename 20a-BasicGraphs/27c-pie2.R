# Pie2
expenditure=c(600,300,150,100,200)
names(expenditure)=c('Housing','Food','Cloths','Entertainment',
            'Other') 
expenditure
pie(expenditure)

pie(expenditure,
    labels=as.character(expenditure),
    main="Monthly Expenditure Breakdown",
    col=c("red","orange","yellow","blue","green"),
    border="brown",
    clockwise=TRUE
)
