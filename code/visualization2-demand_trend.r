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

# ----Pre-processing----
hotel_data.ready <- hotel_data.formated
# Functions
blank_values <- function(df){
  sum = 0
  for(i in 1:ncol(df)){
    cat("Column: ",colnames(df[i]), "\t", "Blank values: ", colSums(df[i] == ""), "\n")
  }
}

na_values <- function(df){
  for(i in 1:ncol(df)){
    nas <- sum(is.na(df[i]))
    if(nas > 0){
      cat(colnames(df[i]), ": ", nas, " NAs\n")
    }
  }
}

mean_over_na <- function(df, cols){
  for(lbl in cols){
    i <- grep(lbl, colnames(df))
    mean <- mean(df[!is.na(df[i]), i])
    cat(mean, "\t")
    df[is.na(df[i]), i] <- mean
    cat(sum(is.na(df[i])), "\n")
  }
  return(df)
}

random_over_na <- function(df, cols){
  for(lbl in cols){
    i <- grep(lbl, colnames(df))
    rand <- sample(df[i][!is.na(df[i])], sum(is.na(df[i])), replace=TRUE)
    cat(rand, "\t")
    df[is.na(df[i]), i] <- rand
    cat(sum(is.na(df[i])), "\n")
  }
  return(df)
}

# Checking for blank values
blank_values(hotel_data.ready)
# Result: there are no blank values except the NA values
summary(hotel_data.ready)
na_values(hotel_data.ready)
# Result: the columns that must be modified to make up for NA values are:
# lead_time, arrival_date_year, arrival_date_week_number, arrival_date_day_of_month,
# stays_in_weekend_nights, stays_in_week_nights, adults, children, babies & days_in_waiting_list

# lead_time is the time between the reservation and the stay, so it is accurate to simply replace by the mean
hotel_data.ready <- mean_over_na(hotel_data.ready, c("lead_time"))
# arrival_date_year could be the median, but assigning it the value of a random element would work fine
# -> because that way it won't be the same value, but it will still be influenced by proportions
hotel_data.ready <- random_over_na(hotel_data.ready, c("arrival_date_year"))
# arrival_date_week_number & arrival_date_day_of_month & stays_in_weekend_nights & stays_in_week_nights will also be replaced with random value from the same column
hotel_data.ready <- random_over_na(hotel_data.ready, c("arrival_date_year", "arrival_date_week_number", "arrival_date_day_of_month", "stays_in_weekend_nights", "stays_in_week_nights", "days_in_waiting_list"))
# For adults, children & babies, it will be replaced by the mean, to maintain the column properties without losing registers
hotel_data.ready <- mean_over_na(hotel_data.ready, c("adults", "children", "babies"))

# ----Processing 1: Hotel preferences----
hotel_data.filtered <- hotel_data.ready[hotel_data.ready$is_canceled == FALSE,]
str(hotel_data.filtered$hotel)
hotel_prefs <- hotel_data.filtered$hotel
# Pie
pie(table(hotel_data.filtered$hotel))
# Bars
hotel_prefs <- table(hotel_data.filtered$hotel)
hotel_prefs_perc <- prop.table(table(hotel_data.filtered$hotel))
hotel_prefs_barplt <- barplot(hotel_prefs, col = c("grey80", "green"), main = "Hotel bookings by hotel type", xlab = "Hotel Type", ylab = "Number of bookings", ylim = c(0, 50000), ann = TRUE)
text(hotel_prefs_barplt, hotel_prefs*1.06, labels = paste(format(hotel_prefs, nsmall = 2), "bookings"))
text(hotel_prefs_barplt, hotel_prefs/2, labels = paste(format(round(hotel_prefs_perc*100, 2), nsmall = 2), "%"))

# ----Processing 2: Demand trend----
# 1. Showing the demand trend by year
hotel_data.filtered <- hotel_data.ready[hotel_data.ready$is_canceled == FALSE,]
demand_data <- hotel_data.filtered$arrival_date_year
demand_dist <- table(demand_data)
# 1. Plotting
demand_dist_linear_chart <- plot(demand_dist, type = "o", xlab = "Year", ylab = "Demand in N° of bookings", main = "Demand by year", col = "orange", ylim = c(10000, 40000), xlim = c(2014.8, 2017.2))
text(demand_dist_linear_chart, demand_dist*1.08, labels = paste(format(demand_dist, nsmall = 2)))
# 2. Demand trend by year and by hotel type
demand_data_city <- hotel_data.filtered$arrival_date_year[hotel_data.filtered$hotel == "City Hotel"]
demand_data_resort <- hotel_data.filtered$arrival_date_year[hotel_data.filtered$hotel == "Resort Hotel"]
demand_dist_city <- table(demand_data_city)
demand_dist_resort <- table(demand_data_resort)
# 2. Plotting
demand_dist_lnr_chart <- plot(demand_dist_city, type = "o", xlab = "Year", ylab = "Demand in N° of bookings", main = "Demand by year and hotel type", col = "grey80", ylim = c(0, 25000), xlim = c(2014.8, 2017.2))
text(demand_dist_lnr_chart, demand_dist_city*1.08, labels = paste(format(demand_dist_city, nsmall = 2)))
text(demand_dist_lnr_chart, demand_dist_resort*0.9, labels = paste(format(demand_dist_resort, nsmall = 2)))
lines(demand_dist_resort, type = "o", col = "green")
legend(2016, 6000, legend=names(hotel_prefs),
       col=c("grey80", "green"), lty=1:1, lwd = 3, cex=0.9,
       title="Hotel types", text.font=1.6, bg='white')

# ----Saving the data----
save(hotel_data.formated, file = "hotel_bookings_formated.RData")
save(hotel_data.filtered, file = "hotel_bookings_filtered.RData")
