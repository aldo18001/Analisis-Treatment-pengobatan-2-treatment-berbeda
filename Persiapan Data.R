library(readxl)
data <- read_excel("data.xls")
View(data)

#Memisahkan data treatment A dan treatment AB

data_A <- data[which(data$Treat == 'A'),]
data_B <- data[which(data$Treat == 'AB'),]
head(data_A)
head(data_B)
