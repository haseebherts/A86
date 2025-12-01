#Data exploration with Malaysia
print(summary(df2))
print(aggregate(perc_18_29 ~ period, df2, summary))
hist(df2$perc_18_29, main = "Distribution of 18-29 Age Group Proportion",
xlab = "Proportion of Cases (%)", col = "lightblue")
