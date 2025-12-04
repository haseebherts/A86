t_test_result <- t.test(df2$perc_18_29 ~ df2$period)
print(t_test_result)
cat("T-test p-value:", t_test_result$p.value, "\n")
