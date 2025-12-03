library(readr)
covid_data <- read_csv("cases_age.csv")
df <- covid_data
df$week_number <- as.numeric(gsub("w", "", df$week))
df$period <- ifelse(df$week_number >= 1 & df$week_number <= 12, "Early (1-12)",
                    ifelse(df$week_number >= 13 & df$week_number <= 24, "Later (13-24)", "Other"))
df2 <- subset(df, state == "Malaysia" & period != "Other")
save.image("D:/Shaalan/A86_new/env.RData")
t_test_result <- t.test(df2$perc_18_29 ~ df2$period)
print(t_test_result)
cat("T-test p-value:", t_test_result$p.value, "\n")
