sessionInfo()

libs <- c("bupaR", 
          "edeaR", 
          "eventdataR", 
          "processmapR",
          "processmonitR",
          "xesreadR",
          "petrinetR")
ip <- installed.packages(fields = c("Package", "Version"))
ip <- as.data.frame(ip)
ip <- ip[ip[,c("Package")] %in% libs,]
paste(ip[,c("Package")],ip[,c("Version")])

install.packages("bupaR")
install.packages("edeaR")
install.packages("eventdataR")
install.packages("processmapR")
install.packages("processmonitR")
install.packages("xesreadR")
install.packages("petrinetR")

library(bupaR)

eventdataR::sepsis %>%
  trace_explorer()

eventdataR::patients %>%
  resource_map()
