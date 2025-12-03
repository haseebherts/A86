group_stats <- aggregate(perc_18_29 ~ period, df2,
FUN = function(x) c(mean = mean(x),
median = median(x),
sd = sd(x),
min = min(x),
max = max(x),
n = length(x)))
cat("Complete group statistics:\n")
print(group_stats)
