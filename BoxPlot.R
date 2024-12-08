library(tidyverse)

data <- read_csv("admissions_releases_states.csv")

#Box plot: Admissions by race
# Reshape data: Pivot the columns into a longer format
data_long <- data %>%
  pivot_longer(
    cols = starts_with("admissions_"),   # Select columns that represent race
    names_to = "race",                   # Create a new column for race
    values_to = "admissions"             # Create a new column for admissions
  )

# Create the box plot
ggplot(data_long, aes(x = race, y = admissions, fill = race)) +
  geom_boxplot() +
  theme_minimal() +
  labs(
    title = "Box Plot of Admissions by Race",
    x = "Race",
    y = "Admissions",
    fill = "Race",
    caption = "Observations:
    - 'admissions_white' shows the highest median and variability in admissions.
    - 'admissions_black' has a moderate spread, but fewer outliers.
    - Other racial categories ('Asian', 'AmerInd', etc.) show lower medians and distributions.
    - There are a significant number of outliers in the 'white' category."
  ) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.caption = element_text(size = 10, hjust = 0)
  )
ggsave("Admmissions by Race box plot.png")