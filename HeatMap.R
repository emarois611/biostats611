library(tidyverse)

data <- read_csv("admissions_releases_states.csv")

#Heat map: Admissions by race over time
clean_data %>%
  select(date, admissions_white, admissions_black, admissions_hispanic, admissions_amerind, admissions_asian, admissions_other) %>%
  pivot_longer(cols = -date, names_to = "race", values_to = "admissions") %>%
  ggplot(aes(x = date, y = race, fill = admissions)) +
  geom_tile() +
  theme_minimal() +
  labs(
    title = "Heat Map of Admissions by Race Over Time",
    x = "Date", 
    y = "Race", 
    fill = "Admissions",
    caption = "Observations:
    - This heat map visualizes the trends in admissions by race over time.
    - Admissions are categorized into six racial/ethnic groups: White, Black, Hispanic, American Indian (Amerind), Asian, and Other.
    - The color intensity represents the number of admissions for each racial group by year.
    - From the mid-2000s onward, there are noticeable fluctuations, with certain racial groups showing higher variability in admissions over time, suggesting possible policy changes or external factors influencing admissions."
  ) +
  scale_fill_viridis_c() +
  theme(plot.caption = element_text(size = 10, hjust = 0))

ggsave("Heat map by race.png")