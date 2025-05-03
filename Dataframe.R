# Create the data frame with 5 data points
db <- data.frame(
  empid = c("E001", "E002", "E003", "E004", "E005"),
  dept = factor(c("Sales", "IT", "HR", "IT", "Sales")),
  emname = c("Alice", "Bob", "Charlie", "Diana", "Ethan"),
  ey = as.integer(c(3, 5, 2, 7, 4)),
  wh = c(40.5, 38.0, 42.0, 45.5, 41.0),
  ms = c(5000.0, 7000.5, 4000.0, 8000.0, 6000.0),
  ns = c(3000.0, 4500.0, 2800.0, 5000.0, 4000.0)
)

# View the data frame
print(db)

# Mean
mean_ey <- mean(db$ey)
means_wh <- mean(db$wh)
means_ms <- mean(db$ms)
means_ns <- mean(db$ns)
paste("Ey: ",mean_ey,"Wh: ",means_wh,"Ms: ",means_ms,"Ns: ",means_ns)

# Quartiles
quartiles_ey <- quantile(db$ey)
quartiles_wh <- quantile(db$wh)
quartiles_ms <- quantile(db$ms)
quartiles_ns <- quantile(db$ns)

paste("Ey: ",quartiles_ey,"Wh: ",quartiles_wh,"Ms: ",quartiles_ms,"Ns: ",quartiles_ns)

# Histogram of net salary
hist(db$ns,main = "Histogram of Net Salary",xlab = "Net Salary",col = "pink")


# Box plot of experience in years
boxplot(db$ey, main = "Boxplot of Experience in Years", ylab = "Experience (Years)", col = "lightgreen")

# Scatter plot of weekly hours vs employee
plot(db$wh, main = "Scatter Plot of Weekly Hours", ylab = "Weekly Hours", xlab = "Employee Index", col = "darkblue")

# Covariance and Correlation between Experience Years and Net Salary
cov_ey_ns <- cov(db$ey, db$ns)
cor_ey_ns <- cor(db$ey, db$ns)

# Output and interpret
cat("Covariance between Experience Years and Net Salary:", cov_ey_ns, "\n")
cat("Correlation between Experience Years and Net Salary:", cor_ey_ns, "\n")

# Interpretation as comment:
# A positive covariance and correlation indicate that as experience increases, net salary tends to increase.
# The correlation value (closer to 1 or -1) shows the strength of this linear relationship.

# Coefficient of determination (R-squared) between Monthly Sales and Net Salary
cor_ms_ns <- cor(db$ms, db$ns)
r_squared <- cor_ms_ns^2
cat("Coefficient of Determination (R^2) between Monthly Sales and Net Salary:", r_squared, "\n")

# Interpretation as comment:
# The R-squared value indicates the proportion of variance in net salary that can be explained by monthly sales.
# A higher R^2 (close to 1) indicates a strong relationship.

