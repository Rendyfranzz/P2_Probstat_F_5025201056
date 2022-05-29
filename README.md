# PRAKTIKUM PROBSTAT MODUL2 2022 KELAS F

#### Nama    : Rendi Dwi Francisko
#### NRP     : 5025201056

</br>

## PENJELASAN 
### Nomor 1 

#### 1a
Langkah pertama penyelesaian adalah memasukkan semua data yang ada pada tabel pada sebuah variabel sebagai berikut
```
before <- c(78, 75, 67, 77, 70, 72, 28, 74, 77)
after <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
```
Selanjutnya mencari standar deviasinya. Standar deviasi sebelum dan sesudah aktivitas adalah
```
sd_sebelum <- sd(before)
sd_sesudah <- sd(after)
sd_sebelum
sd_sesudah
```
Maka hasilnya : 
</br>
<img width="121" alt="image" src="https://user-images.githubusercontent.com/90760961/170852587-44e983c5-3292-4da3-a744-d2369a989cf6.png">


#### 1b
cari nilai t (p-value)

</br>

Untuk mencari nilai p-value maka bisa menggunakan fungsi `t.test` yaitu sebagai berikut
```
t.test(before, after, alternative = "greater", var.equal = FALSE)
```
Maka hasilnya adalah:
</br>
<img width="487" alt="image" src="https://user-images.githubusercontent.com/90760961/170852662-4f23b574-21fb-4239-b22c-8cc98e448f9c.png">

#### 1c

Langkah pertama yaitu melihat hasil komparasi dua variabel berikut
```
var.test(before, after)
```

</br>
<img width="487" alt="image" src="https://user-images.githubusercontent.com/90760961/170852689-59861f58-e976-4bac-b301-630c237632dd.png">

Selanjutnya, untuk melihat pengaruh jika tingkat signifikasi 5% dan tidak ada pengaruh yang signifikan secara statistika, maka adalah sebagai berikut
```
t.test(before, after, var.equal = TRUE)
```

</br>
<img width="486" alt="image" src="https://user-images.githubusercontent.com/90760961/170852706-f611f81e-35c3-47f0-8780-03e6f32b7c3e.png">

Bisa dilihat bahwa mean dan convidence sama dengan 1b, yang berbeda adalah p-value dan df. Sehingga tidak memiliki pengaruh yang signifikan secara statistika

### Nomor 2
Source:https://www.assignmentexpert.com/homework-answers/mathematics/statistics-and-probability/question-116631

#### 2a
Apakah Anda setuju dengan klaim tersebut?

*Setuju*

#### 2b
Diketahui n = 100, Rata-Rata (X̄) = 23500, dan standar deviasi(σ) = 3900
Hasil Output:
<br>
<img width="454" alt="image" src="https://user-images.githubusercontent.com/90760961/170870379-f20efbd7-e73a-470c-a1af-4f1ff844442d.png">
Maka null hipotesis adalah 
```
H0 : μ = 20000
```
Alternatif hipotesisnya yaitu
```
H1 : μ < 20000
```
```
z = 8.9744, p-value < 2.2e-16
````
#### 2c
Kesimpulan:Nilai-P kira-kira 0, jadi menolak hipotesis nol dan menyimpulkan bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun

### Nomor 3

#### 3a
H0 dan H1
dilakukan perhitungan H0 sebagai berikut
</br>
<img width="203" alt="image" src="https://user-images.githubusercontent.com/90760961/170853033-397f65db-56ad-447f-8fa5-51750cc67f48.png">
</br>
dilakukan perhitungan H1 sebagai berikut
</br>
<img width="211" alt="image" src="https://user-images.githubusercontent.com/90760961/170853048-445581cc-9716-462e-9f96-ae896a96830b.png">

#### 3b
Hitung Sampel Statistik
Penghitungan dilakukan sebagai berikut
```
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, mean.y =2.79 , s.y = 1.32, n.y = 27, alternative = "greater", var.equal = TRUE)
```
<img width="492" alt="image" src="https://user-images.githubusercontent.com/90760961/170853244-2fd93d12-bae9-4165-945b-ddc9f567c538.png">


#### 3c
Lakukan Uji Statistik (df =2)

Melakukan install library `mosaic`
```
install.packages("mosaic")
library(mosaic)
```

```
plotDist(dist='t', df=2, col="blue")
```
<img width="431" alt="image" src="https://user-images.githubusercontent.com/90760961/170854117-7d19eca9-e83a-4f5a-bfe3-5ae89d0c9449.png">

#### 3d
Adapun untuk mendapatkan nilai kritikal bisa menggunakan `qchisq` dengan `df=2` sesuai soal sebelumnya
```
qchisq(p = 0.05, df = 2, lower.tail=FALSE)
```
<img width="382" alt="image" src="https://user-images.githubusercontent.com/90760961/170854149-fd29899d-9f71-423e-b05f-7d2f6c7142ca.png">


#### 3e
Teori keputusan adalah teori formal pengambilan keputusan di bawah ketidakpastian. Aksinya adalah : ({a}_{a∈A}) Kemungkinan konsekuensi : ({c}_{c∈C}) (tergantung pada keadaan dan tindakan) Maka keputusan dapat dibuat dengan t.test

#### 3f
Kesimpulan Kesimpulan yang didapatkan yaitu perbedaan rata-rata yang terjadi tidak ada jika dilihat dari uji statistik dan akan ada tetapi tidak signifikan jika dipengaruhi nilai kritikal.

### Nomor 4
#### 4a
ambil data dari link yang telah disediadakan
```
myData  <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt")) 
dim(myData)
head(myData)
attach(myData)
```
Maka ada akan ditambahkan
<br>
<img width="396" alt="image" src="https://user-images.githubusercontent.com/90760961/170862933-5f34d8df-e25d-46ad-86ca-e0f822f13f91.png">

Selanjutnya membuat myFile menjadi group 
```
myData$V1 <- as.factor(myData$V1)
myData$V1 = factor(myData$V1,labels = c("Kucing Oren","Kucing Hitam","Kucing Putih","Kucing Oren"))
```

Setelah itu, dicek apakah dia menyimpan nilai di groupnya
```
class(myData$Group)
```

Lalu bagi tiap valuer menjadi 3 bagian ke 3 grup
```
group1 <- subset(myData, V1=="Kucing Oren")
group2 <- subset(myData, V1=="Kucing Hitam")
group3 <- subset(myData, V1=="Kucing Putih")
```
Maka hasilnya
<br>
<img width="417" alt="image" src="https://user-images.githubusercontent.com/90760961/170863547-92f78513-2187-4b5c-a86f-d73ecad44ee1.png">
#### 4b

#### 4c

#### 4d


#### 4e

#### 4f

### Nomor 5
#### 5a
Buatlah plot sederhana untuk visualisasi data

Run semua library yang diperlukan
```
install.packages("multcompView")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)
```

Selanjutnya membaca file GTL.csv dari documents
```
GTL <- read_csv("C:/Users/rendi/Downloads/GTL.csv")
head(GTL)
```
</br>
<img width="245" alt="image" src="https://user-images.githubusercontent.com/90760961/170869172-bbb6ab04-3063-4d72-9348-57917008b634.png">

Lakukan observasi pada data
```
str(GTL)
```
</br>
<img width="496" alt="image" src="https://user-images.githubusercontent.com/90760961/170869302-a9b1be52-6fbc-409b-911f-af790b377d13.png">

Selanjutnya lakukan viasualisasi menggunakan simple plot yaitu sebagai berikut
```
qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)
```
<img width="431" alt="image" src="https://user-images.githubusercontent.com/90760961/170869247-1d588c97-b6c2-4242-8ce2-b987b2497bbc.png">

#### 5b
Langkah pertama adalah membuat variabel as factor sebagai ANOVA
```
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)
```
<img width="481" alt="image" src="https://user-images.githubusercontent.com/90760961/170869876-992c4daf-6b9b-4130-8343-9f659592ab6c.png">
</br>

Selanjutnya melakukan analisis of variance (aov) yaitu sebagai berikut 
```
anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)
```
<img width="478" alt="image" src="https://user-images.githubusercontent.com/90760961/170869920-90d06c02-de8d-4006-961f-538becb19d55.png">

#### 5c
Menggunakan `group_by` lalu melakukan `summarise` sesuai mean dan standar deviasi yang berlaku sehingga scriptnya adalah sebagai berikut
```
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)
```
<img width="449" alt="image" src="https://user-images.githubusercontent.com/90760961/170869984-fbcd6206-c477-4965-8067-48c659a2b7a1.png">
</br>

#### 5d
Lakukan uji Tukey

Menggunakan fungsi `TukeyHSD` sebagai berikut
```
tukey <- TukeyHSD(anova)
print(tukey)
```
<img width="403" alt="image" src="https://user-images.githubusercontent.com/90760961/170870578-74796682-260c-40bc-88dd-5e44907f77dd.png">
<img width="335" alt="image" src="https://user-images.githubusercontent.com/90760961/170870617-6b31bb5c-94df-4dc5-b3d1-0907cc446273.png">

#### 5e
Awalnya yaitu membuat compact letter display sebagai berikut
```
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)
```
<img width="452" alt="image" src="https://user-images.githubusercontent.com/90760961/170870646-70da2ebc-2d43-4c1e-91f4-80a37b8036af.png">

</br>
Tambahkan compact letter display tersebut ke tabel dengan means(rata-rata) dan sd

```
cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)
```
<img width="480" alt="image" src="https://user-images.githubusercontent.com/90760961/170870667-5e6ad57b-6355-4634-8b6d-cc27b91329e1.png">
