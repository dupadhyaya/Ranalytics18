# Liberty Case for Clustering

custid = 1:12
trans = c(5,10,15,2,18,9,14,8,7,9,1,6)
totpurch = c(450,800,900,50, 900, 200, 500, 300, 250, 1000, 30, 700)
income = c(90,82,77,30, 60, 45, 82, 22, 90, 80,60, 80)
df = data.frame(custid, trans, totpurch, income)
apply(df, 2, FUN=length)
#Right no of clusters
#Centeriod for the clusters


