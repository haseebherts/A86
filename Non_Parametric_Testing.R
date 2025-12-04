wilcox_result <- wilcox.test(df2$perc_18_29 ~ df2$period)
print(wilcox_result)
median_values <- aggregate(perc_18_29 ~ period, df2, median)
print(median_values)

