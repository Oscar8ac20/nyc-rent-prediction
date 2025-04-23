# scripts/load_data.R

#####--- Load required libraries ---#####
library(tidyverse)
library(readr)
library(janitor)

#####--- Load the detailed Airbnb listings dataset ---#####
listings <- read_csv("~/GitHub/nyc-rent-prediction/data/listings.csv") %>%
  clean_names()  # standardize column names



#####--- Quick overview ---#####
glimpse(listings)
summary(listings$price)  # check the price distribution

#####--- clean price column ---#####
if (is.character(listings$price)) {
  listings <- listings %>%
    mutate(price = as.numeric(gsub("[$,]", "", price)))
}

summary(listings)
# Save
write_csv(listings, "data/listings_clean.csv")
