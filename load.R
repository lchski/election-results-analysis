library(tidyverse)
library(readxl)
library(lubridate)

election_results <- read_xlsx(
    "data/source/lop/electionsCandidates.xlsx",
    col_types = c("text", "text", "text", "text", "text", "text", "text", "text", "numeric")
  ) %>%
  mutate(
    parliament = ifelse(str_detect(Picture, "Parliament"), str_remove(Picture, "Parliament: "), NA_integer_),
    election_type = ifelse(str_detect(Picture, "Type of Election"), str_remove(Picture, "Type of Election: "), NA_character_),
    date = ifelse(str_detect(Picture, "Date of Election"), str_remove(Picture, "Date of Election: "), NA_character_),
    is_header_row = ! is.na(Picture)
  ) %>%
  fill(parliament, election_type, date) %>%
  filter( ! is_header_row) %>%
  select(
    province_territory = `Province or Territory`,
    constituency = `Constituency`,
    candidate = `Candidate`,
    gender = `Gender`,
    occupation = `Occupation`,
    political_affiliation = `Political Affiliation`,
    result = `Result`,
    votes = `Votes`,
    parliament:date
  ) %>%
  mutate(date = ymd(date)) %>%
  group_by(date, constituency) %>%
  mutate(votes_prop = votes / sum(votes)) %>%
  ungroup()
