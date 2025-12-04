library(readr)
covid_data <- read_csv("cases_age.csv")
df <- covid_data
df$week_number <- as.numeric(gsub("w", "", df$week))
df$period <- ifelse(df$week_number >= 1 & df$week_number <= 12, "Early (1-12)",
                    ifelse(df$week_number >= 13 & df$week_number <= 24, "Later (13-24)", "Other"))
df2 <- subset(df, state == "Klang Valley" & period != "Other")

# Part 2: Data Summary and Exploration
print(summary(df2))
print(aggregate(perc_18_29 ~ period, df2, summary))
hist(df2$perc_18_29, main = "Distribution of 18-29 Age Group Proportion",
     xlab = "Proportion of Cases (%)", col = "maroon")




# Part 3: Parametric Testing
t_test_result <- t.test(df2$perc_18_29 ~ df2$period)
print(t_test_result)
cat("T-test p-value:", t_test_result$p.value, "\n")



# Part 4: Non-parametric Testing
wilcox_result <- wilcox.test(df2$perc_18_29 ~ df2$period)
print(wilcox_result)
median_values <- aggregate(perc_18_29 ~ period, df2, median)
print(median_values)



# Part 5: Visualization and Final Interpretation
boxplot(df2$perc_18_29 ~ df2$period,
        xlab = "Pandemic Period", 
        ylab = "Proportion of Cases (%)",
        main = "Comparison of COVID-19 Case Proportion (Age 18-29)",
        col = c("yellow", "purple"))

# Interpretation
if (wilcox_result$p.value < 0.05) {
  cat("Significant difference found - reject null hypothesis\n")
} else {
  cat("No significant difference - cannot reject null hypothesis\n")
}