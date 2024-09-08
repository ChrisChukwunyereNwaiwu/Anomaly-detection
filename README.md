# Lung Cancer Anomaly Detection Using Random Forest

## Overview
This project implements an anomaly detection system using the Random Forest algorithm in R, focusing on predicting the effectiveness of a lung cancer prediction system. The primary goal is to identify anomalous data points in the lung cancer dataset, which could indicate irregularities or errors in diagnosis or treatment predictions. Random Forest is used due to its strength in handling complex data and providing reliable predictions for this sensitive medical application.

## Project Structure

- `Anomaly Detection using RandomForest.R`: The main R script that includes all steps for loading the lung cancer dataset, data preprocessing, training the Random Forest model, and detecting anomalies.
- `Data`: This project uses a lung cancer dataset that contains patient information and medical records, which helps predict lung cancer occurrence and identify anomalies in predictions.
- `Results`: Contains the output of the model, highlighting any anomalous cases in the prediction system and evaluating the model’s performance.

## Key Features

- `Lung Cancer Dataset`: The dataset includes medical features related to lung cancer diagnosis and prediction. Anomalies detected in this dataset could represent misdiagnosed cases or unusual patterns that need further investigation.
- `Data Preprocessing`: Involves cleaning the data, handling missing values, and preparing the dataset for training.
- `Random Forest Model`: The Random Forest algorithm is used to classify data points as either normal or anomalous, based on learned patterns from the lung cancer dataset.
- `Anomaly Detection`: The model flags anomalous cases where the prediction deviates from the expected results, potentially indicating issues in the prediction system.
- `Evaluation Metrics`: The model performance is evaluated using accuracy, precision, recall, and F1-score.

## Installation and Setup

### Prerequisites
- R version 4.0.0 or higher
- RStudio (optional but recommended)
- Required R libraries:
    - `randomForest`
    - `ggplot2`
    - `dplyr`
    - `caret`

### Installation Steps

1. Clone the repository:
    ```bash
    git clone https://github.com/ChrisChukwunyereNwaiwu/Anomaly-detection.git
    cd Anomaly-detection
    ```

2. Install the required R packages:
    In R or RStudio, install the following packages:
    ```R
    install.packages("randomForest")
    install.packages("ggplot2")
    install.packages("dplyr")
    install.packages("caret")
    ```

3. Load the dataset:
    Ensure your lung cancer dataset is in the working directory. Adjust the data loading section in the `Anomaly Detection using RandomForest.R` script if needed.

4. Run the script:
    Execute the `Anomaly Detection using RandomForest.R` script to train the Random Forest model and detect anomalies in the lung cancer prediction data.

## Usage

- **Step 1**: Load the lung cancer dataset and preprocess it (e.g., handle missing values, feature selection).
- **Step 2**: Train the Random Forest model using the dataset.
- **Step 3**: Run the anomaly detection to flag irregularities in lung cancer predictions and visualize the results using `ggplot2`.

## Results

The model identifies anomalies in lung cancer predictions, which are flagged for further review. Results include:
- A list of patient cases flagged as anomalies.
- Evaluation metrics such as accuracy, precision, recall, and F1-score.
- Visualization of the anomaly detection results.

## Future Work

- Apply other anomaly detection algorithms such as Isolation Forest or autoencoders for comparison.
- Enhance model performance through hyperparameter tuning.
- Implement real-time anomaly detection for a lung cancer prediction system with real-time data inputs.


