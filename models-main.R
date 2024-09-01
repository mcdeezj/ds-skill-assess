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

# 2. Get the data ready for the model
applicants <- readr::read_csv('applicants.csv')

applicants <- applicants %>%
  dplyr::mutate(fymo = paste(fiscal_year,fiscal_month, sep = '-'))

applicants <- applicants %>%
  dplyr::mutate(unit_sublevel_1 = stringr::str_sub(unit_id, 1, 1))

applicants <- applicants %>%
  dplyr::mutate(unit_sublevel_2 = stringr::str_sub(unit_id, 2, 1))

applicants <- applicants %>%
  dplyr::select(-c(fiscal_year, fiscal_month))

# 3. Fit the model and write the coefficients
model <- lm(sum_of_applicants ~ ., data = applicants)

plot(model)

beta_fits <- coeff(model)

write_csv(beta_fits, 'applicants_beta_fitted.csv')

# END