# Load necessary libraries
library(ggplot2)
library(car)         # for VIF
library(lmtest)      # for bptest (Breusch-Pagan)

# Import the cleaned dataset


# ---- 1. Descriptive Statistics ----
summary(data)  # Mean, Median, Min, Max, 1st & 3rd Quartile
sapply(data, sd)  # Standard deviation for all numeric columns

# ---- 2. Visualizations ----

# Histogram of Median House Value
ggplot(data, aes(x = median_house_value)) +
  geom_histogram(fill = "blue", bins = 30) +
  ggtitle("Histogram of Median House Value") +
  xlab("Median House Value") + ylab("Count")

# Scatter Plot: Median Income vs House Value
ggplot(data, aes(x = median_income, y = median_house_value)) +
  geom_point(color = "darkgreen") +
  ggtitle("Median Income vs Median House Value") +
  xlab("Median Income") + ylab("Median House Value")

# ---- 3. Linear Regression Model ----

model <- lm(median_house_value ~ ., data = data)
summary(model)

# --- Comment:
# Look at Adjusted R-squared to assess model fit.
# Significant p-values (< 0.05) indicate relevant predictors.
# If most predictors are significant and Adjusted R² is reasonably high, the model is useful for prediction.

# ---- 4. Homoskedasticity Test (Breusch-Pagan) ----
bptest(model)

# --- Comment:
# If p-value > 0.05 → residuals have constant variance (homoskedastic).
# If p-value < 0.05 → heteroskedasticity exists, indicating model may have non-constant error variance.

# ---- 5. Multicollinearity Check ----
vif(model)

# --- Comment:
# VIF > 5 (or 10) implies multicollinearity.
# If present, consider removing or combining highly correlated variables.
