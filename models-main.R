rm(list = ls())

# 1. Load the packages
# require(tidyverse)
library(ggplot2)
library(magrittr)
library(dplyr)
library(stringr)
library(readr)


# sql-query-from-database.sql will provide one row for each fiscal_year, fiscal_month, and each unit_id. 
#
# Assume the output is called applicants.csv
#
# The most important column is called sum_of_applicants. Like this:
#
# fiscal_year fiscal_month  unit_id sum_of_applicants
#        2024           01       6F               735
#        2024           02       5J              1132
#        2024           01       2B               467
#        2024           02       6C               943
# ...3566 more rows

# prep the data and assign it to "applicants_data". Then write the model and save the coefficients to CSV using methods below
applicants_data <- load_and_prepare_data('applicants.csv')
fit_and_save_model(applicants_data, 'applicants_beta_fitted.csv')

# 2. Get the data ready for the model
load_and_prepare_data <- function(file_path) {
  applicants <- readr::read_csv(file_path)
  
  applicants <- applicants %>%
    dplyr::mutate(
      fymo = paste(fiscal_year, fiscal_month, sep = '-'),
      unit_sublevel_1 = stringr::str_sub(unit_id, 1, 1),
      unit_sublevel_2 = stringr::str_sub(unit_id, 2, 1)
    ) %>%
    dplyr::select(-c(fiscal_year, fiscal_month))
  return(applicants)
}

# 3. Fit the model and write the coefficients
fit_and_save_model <- function(data, output_file) {
  model <- lm(sum_of_applicants ~ ., data = data)
  plot(model)
  beta_fits <- broom::tidy(model)
  readr::write_csv(beta_fits, output_file)
}

# END