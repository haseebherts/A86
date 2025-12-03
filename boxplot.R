boxplot(df2$perc_18_29 ~ df2$period,
xlab = "Pandemic Period",
ylab = "Proportion of Cases (%)",
main = "Comparison of COVID-19 Case Proportion (Age 18-29)",
col = c("lightblue", "lightgreen"))
if (wilcox_result$p.value < 0.05) {
cat("Significant difference found - reject null hypothesis\n")
} else {
cat("No significant difference - cannot reject null hypothesis\n")
