library(car)          
library(lmtest)       
library(ggplot2)      
library(readxl)


View(Datra)

# Build the linear regression model
model <- lm(Sales ~ Facebook + Instagram + Twitter, data = Datra)

# Summary of the model
summary(model)

# -------------------
# Multicollinearity Check
# -------------------
vif(model)  # VIF > 5 indicates high multicollinearity

# -------------------
# Plot Residuals
# -------------------
plot(model$residuals, main="Residual Plot", ylab="Residuals")
abline(h=0, col="red")

# -------------------
# Normality of Residuals
# -------------------
qqnorm(model$residuals)
qqline(model$residuals, col="red")

# -------------------
# Heteroskedasticity Check
# -------------------
bptest(model)  # Breusch-Pagan test (p > 0.05 means homoskedasticity)



# -------------------
# Prediction if Facebook advertising is increased by 10% of its average
# -------------------
# Calculate average spend
avg_fb <- mean(Datra$Facebook)
avg_ig <- mean(Datra$Instagram)
avg_tw <- mean(Datra$Twitter)

# Predict with 10% increased spend on the best-performing channel
# (assume it's Facebook after regression analysis)
new_data <- data.frame(
  Facebook = avg_fb * 1.10,
  Instagram = avg_ig,
  Twitter = avg_tw
)

# Predict Sales
predicted_sales <- predict(model, newdata = new_data)
print(predicted_sales)

