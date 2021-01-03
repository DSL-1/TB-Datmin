#lokasi file
setwd("C:/Users/Ralfino/Documents/Data Mining/TB")

#pembacaan dataset 
dataset <-read.csv("bank/bank.csv", sep = ";")

#install library
#install.packages("C50")
#install.packages("printr")

#load library
library(C50)
library(printr)

dataset$age <- as.factor(dataset$age)
dataset$job <- as.factor(dataset$job)
dataset$marital <- as.factor(dataset$marital)
dataset$education <- as.factor(dataset$education)
dataset$default <- as.factor(dataset$default)
dataset$balance <- as.numeric(dataset$balance)
dataset$housing <- as.factor(dataset$housing)
dataset$loan <- as.factor(dataset$loan)
dataset$contact <- as.factor(dataset$contact)
dataset$day <- as.numeric(dataset$day)
dataset$month <- as.factor(dataset$month)
dataset$duration <- as.numeric(dataset$duration)
dataset$campaign <- as.factor(dataset$campaign)
dataset$pdays <- as.numeric(dataset$pdays)
dataset$previous <- as.numeric(dataset$previous)
dataset$poutcome <- as.factor(dataset$poutcome)
dataset$y <- as.factor(dataset$y)

#pembuatan model
model <- C5.0(y ~., data=dataset)

#melihat hasil model 
model
summary(model)

#gambar model
plot(model)

#membuat dataset
datatesting <-dataset[,1:16]

#prediksi
predictions <-predict(model, datatesting)

#bandingkan hasil prediksi dengan dataset
table(predictions, dataset$y)

