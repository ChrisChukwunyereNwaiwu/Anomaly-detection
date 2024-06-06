
install.packages("googledrive")
library(googledrive)



# Import necessary libraries
library(randomForest)
library(ggplot2)
library(caret)
# Load data
mydata <- read.csv("cleaned_LungCancer.csv")

# List all files in your Google Drive to find the file ID or name
drive_find(n_max = 10)  # Adjust n_max to list more files


#lets check the summary of the data
summary(mydata)

#  Convert categorical variables to factors variables
mydata$GENDER <- as.factor(mydata$GENDER)
mydata$LUNG_CANCER <- as.factor(mydata$LUNG_CANCER)
mydata$SMOKING <- as.factor(mydata$SMOKING)
mydata$AGE_GROUP <- as.factor(mydata$AGE_GROUP)

## Create new columns
mydata$AGE_SQR <- mydata$AGE^2
mydata$AGE_LOG <- log(mydata$AGE)
mydata$SMOKING_BIN <- ifelse(mydata$SMOKING == "NO",0,1)

# Split data into training and test sets
set.seed(123)
indices <- sample(1:nrow(mydata), round(0.8*nrow(mydata)))
train_data <- mydata[indices, ]
test_data <- mydata[-indices, ]

# Fit a random forest model to the training data
rf_model <- randomForest(LUNG_CANCER~., data = train_data, ntree = 100)

# Extract feature importance to know the importance of the random forest model
imp <- importance(rf_model)
imp <- data.frame(feature = row.names(imp), importance = imp[ ,1])

# Sort feature importance in descending order
imp <- imp[order(imp$importance, decreasing = TRUE), ]

# Plot feature importance using ggplot2
ggplot(imp, aes(x = reorder(feature, importance), y = importance)) +
  geom_bar(stat = "identity", fill = "blue") +
  xlab("Feature") + ylab("Importance") +
  ggtitle("Feature Importance of Random Forest Model") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


# let's  perform cross validation or the random forest model
tunegrid <- expand.grid(.mtry = c(1:ncol(train_data)), .splitrule = c("variance"))
control <- trainControl(method = "cv", number = 10)

# Use the model to predict on the test data
predictions <- predict(rf_model, test_data)

# Evaluate the model's performance
confusion_matrix <- table(predictions, test_data$LUNG_CANCER)
accuracy <- sum(diag(confusion_matrix))/sum(confusion_matrix)
print(accuracy)


#Let's create a density plot
ggplot(test_data, aes(x=predictions)) + 
  geom_density(fill = "red") +
  ggtitle("Density Plot of Predicted Probabilities") +
  xlab("Predicted Probability")

# Create box plot
ggplot(test_data, aes(x = LUNG_CANCER, y = predictions, fill = LUNG_CANCER)) +
  geom_boxplot() +
  ggtitle("Box Plot of Predicted Probabilities by Cancer Status") +
  xlab("Cancer Status") + ylab("Predicted Probability")
