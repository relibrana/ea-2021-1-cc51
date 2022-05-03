hotel_dataset<-read.csv("https://raw.githubusercontent.com/relibrana/ea-2021-1-cc51/main/data/hotel_bookings_miss.csv", na.strings = "")
hotel_dataset
hotel_dataset$lead_time[hotel_dataset$lead_time=="NA"]<-0
hotel_dataset$stays_in_weekend_nights[hotel_dataset$stays_in_weekend_nights=="NA"]<-0
hotel_dataset$stays_in_week_nights[hotel_dataset$stays_in_week_nights=="NA"]<-0
hotel_dataset$adults[hotel_dataset$adults=="NA"]<-0
hotel_dataset$children[hotel_dataset$children=="NA"]<-0
hotel_dataset$babies[hotel_dataset$babies=="NA"]<-0
hotel_dataset$days_in_waiting_list[hotel_dataset$days_in_waiting_list=="NA"]<-0
View(hotel_dataset)
