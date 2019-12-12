scheer_votes_2019_10_21_count <- election_results %>%
  filter(str_detect(candidate, "Scheer")) %>%
  filter(date == ymd("2019-10-21")) %>%
  pull(votes)

scheer_votes_2019_10_21_prop <- election_results %>%
  filter(str_detect(candidate, "Scheer")) %>%
  filter(date == ymd("2019-10-21")) %>%
  pull(votes_prop)

trudeau_votes_max_count <- election_results %>%
  filter(str_detect(candidate, "Trudeau")) %>%
  top_n(1, votes) %>%
  pull(votes)

trudeau_votes_max_prop <- election_results %>%
  filter(str_detect(candidate, "Trudeau")) %>%
  top_n(1, votes_prop) %>%
  pull(votes_prop)

trudeau_votes_min_count <- election_results %>%
  filter(str_detect(candidate, "Trudeau")) %>%
  top_n(-1, votes) %>%
  pull(votes)

trudeau_votes_min_prop <- election_results %>%
  filter(str_detect(candidate, "Trudeau")) %>%
  top_n(-1, votes_prop) %>%
  pull(votes_prop)