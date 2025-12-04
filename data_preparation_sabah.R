library(readr)
covid_data <- read_csv("cases_age.csv")
df <- covid_data
df$week_number <- as.numeric(gsub("w", "", df$week))
df$period <- ifelse(df$week_number >= 1 & df$week_number <= 12, "Early (1-12)",
ifelse(df$week_number >= 13 & df$week_number <= 24, "Later (13-24)", "Other"))
df2 <- subset(df, state == "Sabah" & period != "Other")
