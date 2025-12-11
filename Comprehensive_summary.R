# This is the main results section of my research
# I'm comparing case proportions between early and later weeks

# What I'm trying to find out
cat("1. WHAT I WANTED TO KNOW:\n")
cat("   Do young adults (18-29 years) make up a different percentage of\n")
cat("   COVID-19 cases in early weeks (1-12) compared to later weeks (13-24)?\n\n")

# My starting guesses
cat("2. MY GUESSES BEFORE ANALYZING:\n")
cat("   My first guess (null): No difference between early and later weeks\n")
cat("   My second guess (alternative): There IS a difference\n\n")

# About the data I used
cat("3. ABOUT THE DATA:\n")
cat("   I used Malaysia's COVID-19 case data\n")
cat("   I looked at weeks 1 through 24\n")
cat("   Focused on people aged 18-29\n")
cat("   Total weeks I analyzed:", nrow(df2), "\n")
cat("   - Early weeks (1-12):", sum(df2$period == "Early (1-12)"), "\n")
cat("   - Later weeks (13-24):", sum(df2$period == "Later (13-24)"), "\n\n")

# What the numbers look like
cat("4. BASIC NUMBERS FOR EACH PERIOD:\n")
cat("   " , paste(rep("-", 50), collapse = ""), "\n")  
cat("   What I measured        Early weeks     Later weeks\n")
cat("   " , paste(rep("-", 50), collapse = ""), "\n")

# Doing the calculations
early_mean <- mean(df2$perc_18_29[df2$period == "Early (1-12)"])
later_mean <- mean(df2$perc_18_29[df2$period == "Later (13-24)"])
early_median <- median(df2$perc_18_29[df2$period == "Early (1-12)"])
later_median <- median(df2$perc_18_29[df2$period == "Later (13-24)"])
early_sd <- sd(df2$perc_18_29[df2$period == "Early (1-12)"])
later_sd <- sd(df2$perc_18_29[df2$period == "Later (13-24)"])

# Printing the numbers in a simple table
cat(sprintf("   Average               %-12.2f%%    %-12.2f%%\n", early_mean, later_mean))
cat(sprintf("   Middle value          %-12.2f%%    %-12.2f%%\n", early_median, later_median))
cat(sprintf("   Spread of data        %-12.2f      %-12.2f\n", early_sd, later_sd))
cat("   " , paste(rep("-", 50), collapse = ""), "\n\n")

# First statistical test
cat("5. FIRST STATISTICAL TEST (T-TEST):\n")
cat("   This test compares averages:\n")
cat("   t-value:", round(t_test_result$statistic, 3), "\n")
cat("   p-value:", round(t_test_result$p.value, 4), "\n")
cat("   What p-value means: Chance this happened randomly\n")
cat("   Result: ")
if(t_test_result$p.value < 0.05) {
  cat("SIGNIFICANT - unlikely to be random chance\n")
} else {
  cat("NOT SIGNIFICANT - could be random chance\n")
}
cat("\n")

# Second statistical test
cat("6. SECOND STATISTICAL TEST (WILCOXON):\n")
cat("   This test compares whole distributions:\n")
cat("   W value:", wilcox_result$statistic, "\n")
cat("   p-value:", round(wilcox_result$p.value, 4), "\n")
cat("   Result: ")
if(wilcox_result$p.value < 0.05) {
  cat("SIGNIFICANT\n")
} else {
  cat("NOT SIGNIFICANT\n")
}
cat("\n")

# What the difference actually looks like
cat("7. ACTUAL DIFFERENCES I FOUND:\n")
mean_difference <- later_mean - early_mean
cat("   Later weeks had ", round(mean_difference, 2), "% more cases in 18-29 age group\n", sep="")
percentage_change <- (mean_difference/early_mean)*100
cat("   That's about ", round(percentage_change, 1), "% higher than early weeks\n\n", sep="")

# My conclusion
cat("8. WHAT I CONCLUDE:\n")
if(wilcox_result$p.value < 0.05) {
  cat("   There IS a real difference between early and later weeks.\n")
  cat("   Young adults made up more of the cases in later weeks.\n")
} else {
  cat("   There is NO strong evidence of a difference.\n")
  cat("   The numbers look different, but it could just be random variation.\n")
  cat("   The Wilcoxon test says p = ", round(wilcox_result$p.value, 4), 
      ", which is above 0.05\n", sep="")
}

cat("\n9. NOTES ABOUT MY ANALYSIS:\n")
cat("   - I used two tests to be sure\n")
cat("   - Wilcoxon test is more reliable for this kind of data\n")
cat("   - p < 0.05 is the usual cutoff for 'significant'\n")
cat("   - My results: t-test says significant, Wilcoxon says not significant\n")
cat("   - I'm trusting the Wilcoxon result more\n")