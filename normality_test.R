shapiro_early <- shapiro.test(early_data)
cat("Early period p-value:", shapiro_early$p.value, "\n")
shapiro_later <- shapiro.test(later_data)
cat("Later period p-value:", shapiro_later$p.value, "\n")
if (shapiro_early$p.value > 0.05 & shapiro_later$p.value > 0.05) {
cat("Both groups appear normally distributed (p > 0.05)\n")
cat("T-test assumptions are satisfied\n")
} else {
cat("Data may not be normally distributed\n")
cat("Wilcoxon test is more appropriate\n")
}
