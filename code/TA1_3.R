setwd("C:/Users/brebe/Desktop/Lili/UPC/2022-1/Admin/TB_Grupal/ea-2021-1-cc51/code")
hotel_dataset<-read.csv("C:/Users/brebe/Desktop/Lili/UPC/2022-1/Admin/TB_Grupal/ea-2021-1-cc51/data/hotel_bookings_miss.csv", na.strings = "")
hotel_dataset
#hotel_dataset$stays_in_weekend_nights[hotel_dataset$stays_in_weekend_nights==is.na]<-0
hotel_dataset$stays_in_weekend_nights[hotel_dataset$stays_in_weekend_nights=="NA"]<-0
View(hotel_dataset)

