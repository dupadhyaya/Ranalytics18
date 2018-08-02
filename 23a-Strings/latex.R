library(Hmisc)
d1 = data.frame(drugId = c(11, 22, 33), drugInfo = c("$36.",
                                                     "2 for $11", "50% sale"), stringsAsFactors = FALSE)
d1$drugInfo = gsub("\\$", "\\\\$", d1$drugInfo)
d1$drugInfo = gsub("\\%", "\\\\%", d1$drugInfo)
d1

latex(d1, rowname = NULL, colheads = c("Drug ID", "Drug Price"),
      file = "")
