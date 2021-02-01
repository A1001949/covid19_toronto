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
  filter(name == "COVID19 cases") %>% 
  select(id) %>% 
  opendatatoronto::get_resource()

#### Save data ### 
# Please note that by overwriting this csv file, the analysis covered in the markdown file may be different due to updated data.
# This is because according to Open Data Toronto, this data is completely refreshed and overwritten on a weekly basis.
write_csv(all_data, "inputs/data/raw_data.csv")