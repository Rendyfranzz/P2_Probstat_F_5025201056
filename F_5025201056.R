# Soal 1
# 1a
# Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas

# Data sebelum dan sesudah aktivitas
before <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
after <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)

# Standar Devisiasi sebelum dan sesudah aktivitas
sd_sebelum <- sd(before)
sd_sesudah <- sd(after)
sd_sebelum
sd_sesudah

# 1b
# carilah nilai t (p-value)

# Mencari nilai t(p-value) dengan t-test
t.test(before, after, alternative = "greater", var.equal = FALSE)

# 1c
var.test(before, after)

t.test(before, after, mu = 0, alternative = "two.sided", var.equal = TRUE)


# Soal 2
install.packages("BSDA")
library(BSDA)

# Soal 2a
# Jawaban di README

# Soal 2b 
tsum.test(mean.x=23500, sd(3900), n.x=100)

# Soal 2c
# Jawaban di README

# Soal 3
# Soal 3a
# H0 dan H1
# Jawaban di README

# soal 3b 
# Hitung Sampel Statistik
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, 
          mean.y =2.79 , s.y = 1.32, n.y = 27, 
          alternative = "greater", var.equal = TRUE)

# soal 3c
# Lakukan Uji Statistik (df =2)
install.packages("mosaic")
library(mosaic)

plotDist(dist='t', df=2, col="green")

# soal 3d
qchisq(p = 0.05, df = 2, lower.tail=FALSE)

# soal 3e
# Jawaban di README

# soal 3f
# Jawaban di README

# Soal 4
# Soal 4a

myData <- read.table("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt",h=T)
head(myData)


myData$Group <- as.factor(myData$Group)
table(myData$Group)

str(myData)

myData$Group = factor(myData$Group,labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))
group1 <- subset(myData, Group=="Kucing Oren")
group2 <- subset(myData, Group=="Kucing Hitam")
group3 <- subset(myData, Group=="Kucing Putih")

#plot kuartil
  qqnorm(group1$Length)
  qqline(group1$Length)

  qqnorm(group2$Length)
  qqline(group2$Length)

  qqnorm(group3$Length)
  qqline(group3$Length)

#4b
bartlett.test(Length ~ Group, data = myData)

#4c
model1 = lm(Length ~ Group, data = myData)
anova(model1)
model1_1 = aov(Length ~ Group, data=myData)
summary(model1_1)
#4d
# jawaban di readme
  
#4e
plot(TukeyHSD(model1_1))

TukeyHSD(aov(model1))
TukeyHSD(aov(model1_1))
 
#4f
library("ggplot2")
  ggplot(myData, aes(x = Group, y = Length)) +
     geom_boxplot(fill = "grey80", colour = "black") +
     scale_x_discrete() + xlab("Treatment Group") +
     ylab("Length (cm)")

# Soal 5
# Soal 5a
install.packages("multcompView")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

GTL <- read_csv("C:/Users/rendi/Downloads/GTL.csv")
head(GTL)

str(GTL)

qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)

# Soal 5b
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)

# Soal 5c
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)

# Soal 5d
tukey <- TukeyHSD(anova)
print(tukey)

# Soal 5e
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)

cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)


