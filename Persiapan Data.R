library(readxl)
data <- read_excel("data.xls")
head(data)

data$Treat <- as.factor(data$Treat)
data <- data[,-1]
head(data)

#Memisahkan data treatment A dan treatment AB

data_A <- data[which(data$Treat == 'A'),]
data_AB <- data[which(data$Treat == 'AB'),]
head(data_A)
head(data_AB)

#Modifikasi Tabel
diff_data_A <- data.frame("Treat" = data_A$Treat , "week5" = data_A$QoL1-data_A$QoL0, "week10" = data_A$QoL2-data_A$QoL1, 
                          "week15" = data_A$QoL3-data_A$QoL2)
head(diff_data_A)

diff_data_AB <- data.frame("Treat" = data_AB$Treat , "week5" = data_AB$QoL1-data_AB$QoL0, "week10" = data_AB$QoL2-data_AB$QoL1, 
                           "week15" = data_AB$QoL3-data_AB$QoL2)
head(diff_data_AB)

#Gabung data selisih
diff_data <- rbind(diff_data_A,diff_data_AB)
nrow(diff_data)
View(diff_data)

#Mencari outlier

'''
Batas Bawah = QB - 3/2 dq
Batas Atas = QA + 3/2 dq

dq = selisih quartil


summary(data)

#Untuk QoL0
QA0 = 64
QB0 = 52
dq0 = 64-52
BA0 = QA0 + 1.5*dq0
BB0 = QB0 - 1.5*dq0
BA0
BB0

data <- data[which(data$QoL0<BA0),]
data <- data[which(data$QoL0>BB0),]
data
nrow(data)

#Untuk QoL1
QA1 = 94
QB1 = 76
dq1 = QA1-QB1
BA1 = QA1 + 1.5*dq1
BB1 = QB1 - 1.5*dq1
BA1
BB1

data <- data[which(data$QoL1<BA1),]
data <- data[which(data$QoL1>BB1),]
data
nrow(data)

#Untuk QoL2
QA2 = 96
QB2 = 79.75
dq2 = QA2-QB2
BA2 = QA2 + 1.5*dq2
BB2 = QB2 - 1.5*dq2
BA2
BB2

data <- data[which(data$QoL2<BA2),]
data <- data[which(data$QoL2>BB2),]
data
nrow(data)

#Untuk QoL3
QA3 = 96.75
QB3 = 78
dq3 = QA3-QB3
BA3 = QA3 + 1.5*dq3
BB3 = QB3 - 1.5*dq3
BA3
BB3

data <- data[which(data$QoL3<BA3),]
data <- data[which(data$QoL3>BB3),]
data
nrow(data)
'''

'''
## Pencilan Data treatment A

summary(data_A)

#Untuk QoL0

QAA0 = 65.5
QBA0 = 52.5
dqA0 = QAA0-QBA0
BAA0 = QAA0 + 1.5*dqA0
BBA0 = QBA0 - 1.5*dqA0
BAA0
BBA0

data_A <- data_A[which(data_A$QoL0<BAA0),]
data_A <- data_A[which(data_A$QoL0>BBA0),]
data_A
nrow(data_A)

#Untuk QoL1

QAA1 = 94
QBA1 = 74.25
dqA1 = QAA1-QBA1
BAA1 = QAA1 + 1.5*dqA1
BBA1 = QBA1 - 1.5*dqA1
BAA1
BB1

data_A <- data_A[which(data_A$QoL1<BAA1),]
data_A <- data_A[which(data_A$QoL1>BBA1),]
data_A
nrow(data_A)

#Untuk QoL2

QAA2 = 92.75
QBA2 = 76.25
dqA2 = QAA2-QBA2
BAA2 = QAA2 + 1.5*dqA2
BBA2 = QBA2 - 1.5*dqA2
BAA2
BBA2

data_A <- data_A[which(data_A$QoL2<BAA2),]
data_A <- data_A[which(data_A$QoL2>BBA2),]
data_A
nrow(data_A)

#Untuk QoL2

QAA3 = 95.5
QBA3 = 78
dqA3 = QAA3-QBA3
BAA3 = QAA3 + 1.5*dqA3
BBA3 = QBA3 - 1.5*dqA3
BAA3
BBA3

data_A <- data_A[which(data_A$QoL3<BAA3),]
data_A <- data_A[which(data_A$QoL3>BBA3),]
data_A
nrow(data_A)

## Pencilan Data treatment AB

summary(data_AB)

#Untuk QoL0

QAB0 = 65.5
QBB0 = 52.5
dqB0 = QAB0-QBB0
BAB0 = QAB0 + 1.5*dqB0
BBB0 = QBB0 - 1.5*dqB0
BAB0
BBB0

data_AB <- data_AB[which(data_AB$QoL0<BAB0),]
data_AB <- data_AB[which(data_AB$QoL0>BBB0),]
data_AB
nrow(data_AB)

#Untuk QoL1

QAB1 = 98
QBB1 = 77
dqB1 = QAB1-QBB1
BAB1 = QAB1 + 1.5*dqB1
BBB1 = QBB1 - 1.5*dqB1
BAB1
BBB1

data_AB <- data_AB[which(data_AB$QoL1<BAB1),]
data_AB <- data_AB[which(data_AB$QoL1>BBB1),]
data_AB
nrow(data_AB)

#Untuk QoL2

QAB2 = 97
QBB2 = 82.5
dqB2 = QAB2-QBB2
BAB2 = QAB2 + 1.5*dqB2
BBB2 = QBB2 - 1.5*dqB2
BAB2
BBB2

data_AB <- data_AB[which(data_AB$QoL2<BAB2),]
data_AB <- data_AB[which(data_AB$QoL2>BBB2),]
data_AB
nrow(data_AB)

#Untuk QoL3

QAB3 = 95.5
QBB3 = 74.5
dqB3 = QAB3-QBB3
BAB3 = QAB3 + 1.5*dqB3
BBB3 = QBB3 - 1.5*dqB3
BAB3
BBB3

data_AB <- data_AB[which(data_AB$QoL3<BAB3),]
data_AB <- data_AB[which(data_AB$QoL3>BBB3),]
data_AB
nrow(data_AB)

#data baru gabungan
datan <- rbind(data_A, data_AB)
'''



## Pencilan Data treatment A (selisih dengan pengukuran QoL sebelumnya)

summary(diff_data_A)

#Untuk week5

QAA0 = 38.5
QBA0 = 15
dqA0 = QAA0-QBA0
BAA0 = QAA0 + 1.5*dqA0
BBA0 = QBA0 - 1.5*dqA0
BAA0
BBA0

diff_data_A <- diff_data_A[which(diff_data_A$week5<BAA0),]
diff_data_A <- diff_data_A[which(diff_data_A$week5>BBA0),]
diff_data_A
nrow(diff_data_A)

#Untuk week10

QAA1 = 4
QBA1 = -0.75
dqA1 = QAA1-QBA1
BAA1 = QAA1 + 1.5*dqA1
BBA1 = QBA1 - 1.5*dqA1
BAA1
BBA1

diff_data_A <- diff_data_A[which(diff_data_A$week10<BAA1),]
diff_data_A <- diff_data_A[which(diff_data_A$week10>BBA1),]
diff_data_A
nrow(diff_data_A)

#Untuk week15

QAA2 = 4
QBA2 = -2
dqA2 = QAA2-QBA2
BAA2 = QAA2 + 1.5*dqA2
BBA2 = QBA2 - 1.5*dqA2
BAA2
BBA2

diff_data_A <- diff_data_A[which(diff_data_A$week15<BAA2),]
diff_data_A <- diff_data_A[which(diff_data_A$week15>BBA2),]
diff_data_A
nrow(diff_data_A)


## Pencilan Data treatment AB (selisih dengan pengukuran QoL sebelumnya)

summary(diff_data_AB)

#Untuk week5

QAB0 = 38
QBB0 = 19.5
dqB0 = QAB0-QBB0
BAB0 = QAB0 + 1.5*dqB0
BBB0 = QBB0 - 1.5*dqB0
BAB0
BBB0

diff_data_AB <- diff_data_AB[which(diff_data_AB$week5<BAB0),]
diff_data_AB <- diff_data_AB[which(diff_data_AB$week5>BBB0),]
diff_data_AB
nrow(diff_data_AB)

#Untuk week10

QAB1 = 5
QBB1 = -1
dqB1 = QAB1-QBB1
BAB1 = QAB1 + 1.5*dqB1
BBB1 = QBB1 - 1.5*dqB1
BAB1
BBB1

diff_data_AB <- diff_data_AB[which(diff_data_AB$week10<BAB1),]
diff_data_AB <- diff_data_AB[which(diff_data_AB$week10>BBB1),]
diff_data_AB
nrow(diff_data_AB)

#Untuk week15

QAB2 = 2
QBB2 = -7
dqB2 = QAB2-QBB2
BAB2 = QAB2 + 1.5*dqB2
BBB2 = QBB2 - 1.5*dqB2
BAB2
BBB2

diff_data_AB <- diff_data_AB[which(diff_data_AB$week15<BAB2),]
diff_data_AB <- diff_data_AB[which(diff_data_AB$week15>BBB2),]
diff_data_AB
nrow(diff_data_AB)


#data baru gabungan
diff_data <- rbind(diff_data_A, diff_data_AB)


library(writexl)
write_xlsx(diff_data_A, "tabel selisih A.xlsx")
write_xlsx(diff_data_AB, "tabel selisih AB.xlsx")
write_xlsx(diff_data, "tabel selisih gabungan.xlsx")


library(normtest)
library(nortest)
lillie.test(diff_data$week15)
