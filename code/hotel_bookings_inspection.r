# ----Loading the data----
hotel_data <- read.csv("https://raw.githubusercontent.com/relibrana/ea-2021-1-cc51/main/data/hotel_bookings_miss.csv", header=TRUE, stringsAsFactors = FALSE)
View(hotel_data[1:10,])

# ----Data inspection----
# 1. Getting to know the data
# Upper end
head(hotel_data)
# Lower end
tail(hotel_data)
# All headers / attributes
names(hotel_data)
# General outlook of the dataset
str(hotel_data)
# Outlook of each variable in the dataset
# Allows to see the number of NA's per column
summary(hotel_data)
# Next one is clearly problematic because the NA's don't mean 0
summary(hotel_data$arrival_date_day_of_month) 
# 2. Setting up the data
# Transversal -> testing
View(hotel_data.formated[1:10,])
# Actions
hotel_data.formated <- hotel_data
# Booleans | Logical data
hotel_data.formated$is_canceled <- as.logical(hotel_data.formated$is_canceled)
hotel_data.formated$is_repeated_guest <- as.logical((hotel_data.formated$is_repeated_guest))
# Factors
hotel_data.formated$hotel <- as.factor(hotel_data.formated$hotel)
hotel_data.formated$arrival_date_month <- as.factor(hotel_data.formated$arrival_date_month)
hotel_data.formated$meal <- as.factor(hotel_data.formated$meal)
hotel_data.formated$country <- as.factor(hotel_data.formated$country)
hotel_data.formated$market_segment <- as.factor(hotel_data.formated$market_segment)
hotel_data.formated$distribution_channel <- as.factor(hotel_data.formated$distribution_channel)
hotel_data.formated$reserved_room_type <- as.factor(hotel_data.formated$reserved_room_type)
hotel_data.formated$assigned_room_type <- as.factor(hotel_data.formated$assigned_room_type)
hotel_data.formated$deposit_type <- as.factor(hotel_data.formated$deposit_type)
hotel_data.formated$agent <- as.factor(hotel_data.formated$agent)
hotel_data.formated$company <- as.factor(hotel_data.formated$company)
hotel_data.formated$customer_type <- as.factor(hotel_data.formated$customer_type)
hotel_data.formated$reservation_status <- as.factor(hotel_data.formated$reservation_status)

# ----Pre-processing 1 - Filtering----
# Canceled bookings are of no statistical interest for the hotel
hotel_data.filtered <- hotel_data.formated[hotel_data.formated$is_canceled == FALSE,]
# Functions
blank_values <- function(df){
  sum = 0
  for(i in 1:ncol(df)){
    cat("Column: ",colnames(df[i]), "\t", "Blank values: ", colSums(df[i] == ""), "\n")
  }
}
# Work
blank_values(hotel_data.formated)

# ----Processing 1: Hotel preferences----
str(hotel_data.filtered$hotel)
summary(hotel_data.filtered$hotel)
table(hotel_data.filtered$hotel)
# Pie
pie(table(hotel_data.filtered$hotel))
# Bars
plot(hotel_data.filtered$hotel, main = "Hotel bookings by hotel type", xlab = "Hotel Type", ylab = "Number of bookings", ann = TRUE)
barplot(table(hotel_data.filtered$hotel))
# Percentage
prop.table(table(hotel_data.filtered$hotel))

# ----Saving the data----
save(hotel_data.formated, file = "hotel_bookings_formated.RData")
save(hotel_data.filtered, file = "hotel_bookings_filtered.RData")
