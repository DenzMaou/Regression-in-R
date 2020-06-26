getwd()
setwd("C:/Users/USER/Desktop")

#install packages
install.packages("ggplot2")
install.packages("dplyr")
install.packages("broom")
install.packages("ggpubr")

#load packages
library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)

#1.	Please do the descriptive statistic in simple linear data
index<- read.table("TRD_Index.txt", header = TRUE)
SHindex<- index[index$Indexcd==1,]
SZindex<- index[index$Indexcd==399106,]
SHRet<-SHindex$Retindex
SZRet<-SZindex$Retindex

install.packages("xlsx")
library(xlsx)

penn <- read.xlsx("Penn World Table.xlsx", sheetIndex=3, header=TRUE)

#2.	Plot the data: # Normality and Linearity

plot(SHRet ~ SZRet, data= index)
plot(log(rgdpe)~pl_i+pl_g+pl_m+pl_c+pl_k+pl_x,data=penn)

penn.lm<-lm(SHRet ~ SZRet, data= index)
summary(penn.lm)

par(mfrow=c(2,2))
plot(penn.lm)
par(mfrow=c(1,1))
