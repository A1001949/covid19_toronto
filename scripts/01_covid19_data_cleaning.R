#### Preamble ####
# Purpose: Clean the data downloaded from Open Data Toronto - COVID19 Cases
# Author: Adrian Wong
# Data: 24 January 2021
# Contact: adr.wong@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the data and saved it to inputs/data


#### Workspace setup ####
# Use R Projects, not setwd().
library(tidyverse)

# Read in the raw data. 
raw_data <- readr::read_csv("inputs/data/raw_data.csv")

# Clean col names with janitor - remove whitespaces and capitals
# Remove rows where case is PROBABLE as defined by http://www.health.gov.on.ca/en/pro/programs/publichealth/coronavirus/docs/2019_case_definition.pdf
# This leaves only rows where cases are CONFIRMED
clean_data <- 
  raw_data %>% 
  janitor::clean_names() %>%
  drop_na(age_group) %>% # We're interested in seeing data based on age so remove rows with NA age
  filter(classification == "CONFIRMED")

# Remove raw data from global envir
rm(raw_data)

#### Save data ### 
write_csv(clean_data, "inputs/data/clean_data.csv")