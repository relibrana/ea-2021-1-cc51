# ----Loading the data----
hotel_data <- read.csv("https://raw.githubusercontent.com/relibrana/ea-2021-1-cc51/main/data/hotel_bookings_miss.csv", header=TRUE, stringsAsFactors = FALSE)
install.packages("ggplot2")
library("ggplot2")
#----Temporadas de reserva: alta, media, baja----
hotel_data$is_canceled <- as.logical(hotel_data$is_canceled)
hotel_data.filtered1 <- hotel_data[hotel_data$is_canceled == FALSE,]
monthTable<-table(hotel_data.filtered1$arrival_date_month,hotel_data.filtered1$arrival_date_year)
monthTable
barplot(monthTable, legend=TRUE, beside=TRUE,main='',col = rainbow(12)) 
as.data.frame.matrix(monthTable) 
rowSums(monthTable)