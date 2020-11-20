##Homogenitas Variansi
library(biotools)
BM=boxM(diff_data[,-1], diff_data$Treat)
BM #Ho ditolak jika p value < alpha. jika Ho diterima, data tsb homogen

#Uji perbedaan rata-rata
t.test(week5 ~ Treat, diff_data, var.equal = TRUE)
t.test(week10 ~ Treat, diff_data, var.equal = TRUE)
t.test(week15 ~ Treat, diff_data, var.equal = TRUE)
#Tidak ada perbedaan rata-rata

#melihat boxplot
boxplot(week5 ~ Treat, diff_data)
boxplot(week10 ~ Treat, diff_data)
boxplot(week15 ~ Treat, diff_data)

#cek kolom means
colMeans(diff_data_A)
colMeans(diff_data_AB)

