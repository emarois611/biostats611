library(tidyverse)

data <- read_csv("admissions_releases_states.csv")

#Line graph: Trends in admissions and releases over time by state
clean_data %>%
  group_by(date, state) %>%
  summarise(admissions = sum(admissions_total), releases = sum(releases_total)) %>%
  pivot_longer(cols = c(admissions, releases), names_to = "category", values_to = "count") %>%
  ggplot(aes(x = date, y = count, color = category, group = category)) +
  geom_line(size = 1.2) +
  facet_wrap(~ state) +
  theme_minimal() +
  labs(
    title = "Trends in Admissions and Releases Over Time by State",
    x = "Date", 
    y = "Count", 
    color = "Legend",
    caption = "Observations:
    - This plot visualizes trends in admissions and releases across different states over time.
    - The data is broken down by the total number of admissions and releases for each state, with time represented on the x-axis.
    - The lines for admissions and releases are shown for each state, allowing for comparisons of trends over time.
    - States show varying trends, with some states having sharper increases or decreases in admissions and releases, reflecting changes in local policies or external factors."
  ) +
  theme(plot.caption = element_text(size = 10, hjust = 0))

ggsave("Admit and release by state.png")