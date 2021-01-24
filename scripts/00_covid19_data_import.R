#### Preamble ####
# Purpose: Use opendatatoronto to get data
# Author: Adrian Wong
# Contact: adr.wong@mail.utoronto.ca
# Date: 23 January 2021
# Pre-requisites: None
# TODOs: - 


#### Workspace set-up ####
#install.packages("opendatatoronto")
#install.packages("tidyverse")
library(opendatatoronto)
library(tidyverse)

#### Get data ####
all_data <- 
  opendatatoronto::search_packages("COVID19 Cases") %>% # Search for packages related to covid cases
  opendatatoronto::list_package_resources() %>% 
  filter(name == "COVID19 cases") %>% # This is the particular package we are interested in
  select(id) %>% 
  opendatatoronto::get_resource()

#### Save data ### 
write_csv(all_data, "inputs/raw_data.csv")