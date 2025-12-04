hist(df2$perc_18_29,
main = "Overall Distribution",
xlab = "Proportion (%)",
col = "lightblue",
probability = TRUE)
lines(density(df2$perc_18_29), col = "red", lwd = 2)
legend("topright", legend = c("Histogram", "Density"),
col = c("lightblue", "red"), lty = c(1, 1))
hist(early_data,
main = "Early Period (1-12)",
xlab = "Proportion (%)",
col = "lightblue",
xlim = c(20, 28))
hist(later_data,
main = "Later Period (13-24)",
xlab = "Proportion (%)",
col = "lightgreen",
xlim = c(20, 28))
boxplot(perc_18_29 ~ period, data = df2,
xlab = "Pandemic Period",
ylab = "Proportion of Cases (%)",
main = "Group Comparison",
col = c("lightblue", "lightgreen"),
notch = TRUE)
