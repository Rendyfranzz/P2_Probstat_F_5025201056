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
Source:https://id.scribd.com/document/78734881/Reviliyana-116100068-Tugas-UTS-Susulan

#### 2a
Apakah Anda setuju dengan klaim tersebut?

*Tidak Setuju*

#### 2b
Diketahui n = 100, Rata-Rata (X̄) = 23500, dan standar deviasi(σ) = 3900
Maka null hipotesis adalah 
```
H0 : μ = 20000
```
Alternatif hipotesisnya yaitu
```
H1 : μ < 20000
```
```
α = 0.01
```

#### 2c
Untuk mencari nilai z dan p-value nya yaitu

</br>
<img width="535" alt="image" src="https://user-images.githubusercontent.com/90760961/170852871-753fa2e2-010e-48d0-a0dc-514fd759c408.png">

Keputusan : karena nilai-P hitungan lebih kecil dari taraf keberartian α yang ditentukan, maka tolak H0
dengan P < 0,0001.
Kesimpulan : Rata-rata sebuah mobil dikendarai sejauh <20.000 kmsetahun.

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

#### 3d
Nilai kritikal
Adapun untuk mendapatkan nilai kritikal bisa menggunakan `qchisq` dengan `df=2` sesuai soal sebelumnya


#### 3e
Keputusan

Teori keputusan adalah teori formal pengambilan keputusan di bawah ketidakpastian. 
Aksinya adalah : `({a}_{a∈A})`
Kemungkinan konsekuensi : `({c}_{c∈C})` (tergantung pada keadaan dan tindakan)
Maka keputusan dapat dibuat dengan `t.test`

#### 3f
Kesimpulan
Kesimpulan yang didapatkan yaitu perbedaan rata-rata yang terjadi tidak ada jika dilihat dari uji statistik dan akan ada tetapi tidak signifikan jika dipengaruhi nilai kritikal.

### Nomor 4
#### 4a
Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.
</br>
Langkah pertama mengambil data dari link yang telah disediadakan

```
myFile  <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt")) 
dim(myFile)
head(myFile)
```

Selanjutnya membuat myFile menjadi group 
```
myFile$Group <- as.factor(myFile$Group)
myFile$Group = factor(myFile$Group,labels = c("Kucing Oren","Kucing Hitam","Kucing Putih"))
```

Setelah itu, dicek apakah dia menyimpan nilai di groupnya
```
class(myFile$Group)
```

Lalu bagi tiap valuer menjadi 3 bagian ke 3 grup
```
group1 <- subset(myFile, Group=="Kucing Oren")
group2 <- subset(myFile, Group=="Kucing Hitam")
group3 <- subset(myFile, Group=="Kucing Putih")
```
#### 4b
carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?

Mencari Homogeneity of variances bisa menggunakan command sebagai berikut
```
bartlett.test(Length~Group, data=dataoneway)
```
Setelah di jalankan maka nilai p-value = 0.8054. 
Kesimpulan yang didapatkan yaitu Bartlett's K-squared memiliki nilai sebesar 0.43292 dan df bernilai 2
#### 4c

```
qqnorm(group1$Length)
qqline(group1$Length)
```


#### 4d
Dari Hasil Poin C, Berapakah nilai-p ? , Apa yang dapat Anda simpulkan dari H0?
Setelah di jalankan maka nilai p-value = 0.8054. 

#### 4e
Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? 3 Jelaskan.
Langkah pertama adalah menggunakan command ANOVA
```
model1 <- lm(Length~Group, data=myFile)
```
Selanjutnya menggunakan command 
```
anova(model1)
```
Lalu menggunakan model Post-hoc Tukey HSD sebagai berikut
```
TukeyHSD(aov(model1))
```

#### 4f
Visualisasikan data dengan ggplot2
```
library(ggplot2)
ggplot(dataoneway, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + scale_x_discrete() + xlab("Treatment Group") +  ylab("Length (cm)")
```


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
GTL <- read_csv("GTL.csv")
head(GTL)
```

</br>

Lakukan observasi pada data
```
str(GTL)
```
</br>

Selanjutnya lakukan viasualisasi menggunakan simple plot yaitu sebagai berikut
```
qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)
```

#### 5b
Lakukan uji ANOVA dua arah
Langkah pertama adalah membuat variabel as factor sebagai ANOVA
```
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)
```

</br>

Selanjutnya melakukan analisis of variance (aov) yaitu sebagai berikut 
```
anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)
```

#### 5c
Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)

Menggunakan `group_by` lalu melakukan `summarise` sesuai mean dan standar deviasi yang berlaku sehingga scriptnya adalah sebagai berikut
```
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)
```

</br>

#### 5d
Lakukan uji Tukey

Menggunakan fungsi `TukeyHSD` sebagai berikut
```
tukey <- TukeyHSD(anova)
print(tukey)
```

#### 5e
Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey

Awalnya yaitu membuat compact letter display sebagai berikut
```
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)
```

</br>
Tambahkan compact letter display tersebut ke tabel dengan means(rata-rata) dan sd

```
cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)
```
