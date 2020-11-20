library(readxl)
data <- read_excel("data.xls")
head(data)

data$Treat <- as.factor(data$Treat)
data <- data[,-1]
head(data)


#Memisahkan data treatment A dan treatment AB

data_A <- data[which(data$Treat == 'A'),-1:-2]
data_AB <- data[which(data$Treat == 'AB'),-1:-2]
head(data_A)
head(data_AB)


#Modifikasi Tabel
diff_data <- data.frame("Treat" = data$Treat , "week5" = data$QoL1-data$QoL0, "week10" = data$QoL2-data$QoL1, 
                        "week15" = data$QoL3-data$QoL2)
head(diff_data)

library(writexl)
write_xlsx(diff_data, "tabel selisih.xlsx")
