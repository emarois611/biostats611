library(tidyverse)

data <- read_csv("admissions_releases_states.csv")

#Bar graph: Total admissions and releases over time
clean_data %>%
  select(date, admissions_total, releases_total) %>%
  pivot_longer(cols = -date, names_to = "category", values_to = "count") %>%
  ggplot(aes(x = date, y = count, fill = category)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  labs(
    title = "Total Admissions and Releases Over Time",
    x = "Date", 
    y = "Count", 
    fill = "Legend",
    caption = "Observations:
    - Both admissions and releases show a marked increase starting from the mid-2010s.
    - The pattern of admissions and releases is closely aligned, with fluctuations occurring at similar times, suggesting a cyclical trend in both categories.
    - Releases tend to follow a more gradual increase, while admissions sometimes experience sharper peaks."
  ) +
  scale_fill_brewer(palette = "Set2") +
  theme(plot.caption = element_text(size = 10, hjust = 0))

ggsave("Total admit and release.png")