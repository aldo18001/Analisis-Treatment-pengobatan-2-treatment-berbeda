'''
## Berdasarkan QoL

##Homogenitas Variansi

library(biotools)
BM=boxM(datan[,-1], datan$Treat)
BM #Ho ditolak jika p value < alpha. jika Ho diterima, data tsb homogen


#Uji perbedaan rata-rata
t.test(QoL0 ~ Treat, datan, var.equal = TRUE)
t.test(QoL1 ~ Treat, datan, var.equal = TRUE)
t.test(QoL2 ~ Treat, datan, var.equal = TRUE)
t.test(QoL3 ~ Treat, datan, var.equal = TRUE)
#Tidak ada perbedaan rata-rata
'''

## Berdasarkan Selisih QoL

##Homogenitas Variansi

library(biotools)
BM=boxM(diff_data[,-1], diff_data$Treat)
BM #Ho ditolak jika p value < alpha. jika Ho diterima, data tsb homogen

#Uji perbedaan rata-rata
t.test(week5 ~ Treat, diff_data, var.equal = TRUE)
t.test(week10 ~ Treat, diff_data, var.equal = TRUE)
t.test(week15 ~ Treat, diff_data, var.equal = TRUE)
#Tidak ada perbedaan rata-rata


#cek kolom means
colMeans(diff_data_A[,-1])
colMeans(diff_data_AB[,-1])

#melihat boxplot
boxplot(week5 ~ Treat, diff_data)
boxplot(week10 ~ Treat, diff_data)
boxplot(week15 ~ Treat, diff_data)

t.test(diff_data_A$week15, mu=mean(diff_data_AB$week15), alternative = c("greater"))




'''
H0 : Ma$w15 <= Mab$w15
H1 : Ma > Mab
'''

##Test Multivariat Normal
library(MVN)
mvn(data=diff_data_A[,-1],mvnTest="mardia")
mvn(data=diff_data_AB[,-1],mvnTest="mardia")
mvn(data=diff_data[,-1],mvnTest="mardia")
