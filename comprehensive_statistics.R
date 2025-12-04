print(group_stats)
group_stats <- aggregate(perc_18_29 ~ period, df2,
FUN = function(x) c(mean = mean(x),
median = median(x),
sd = sd(x),
min = min(x),
max = max(x),
n = length(x)))
cat("Complete group statistics:\n")
print(group_stats)
early_data <- df2$perc_18_29[df2$period == "Early (1-12)"]
cat("Mean:", mean(early_data), "\n")
cat("Median:", median(early_data), "\n")
cat("Standard Deviation:", sd(early_data), "\n")
cat("Range:", range(early_data), "\n")
later_data <- df2$perc_18_29[df2$period == "Later (13-24)"]
cat("Mean:", mean(later_data), "\n")
cat("Median:", median(later_data), "\n")
cat("Standard Deviation:", sd(later_data), "\n")
cat("Range:", range(later_data), "\n")
