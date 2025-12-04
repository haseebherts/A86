# Data Summary and Exploration
summary(df2)

# Grouped summary by period
aggregate(perc_18_29 ~ period, data = df2, FUN = summary)

# Histogram for age group distribution
hist(df2$perc_18_29,
     main = "Distribution of Proportion of Ages 18–29",
     xlab = "Percentage of Cases",
     col = "skyblue",
     border = "white")
