sessionInfo()

libs <- c("bupaR", 
          "edeaR", 
          "eventdataR", 
          "processmapR",
          "processmonitR",
          "xesreadR",
          "petrinetR",
          "DiagrammeRsvg",
          "rsvg")
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
install.packages("DiagrammeRsvg")
install.packages("rsvg")

