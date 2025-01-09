# Heart Disease Prediction Using R and Machine Learning

This repository contains a **Heart Disease Prediction** program built using **R** and **Machine Learning** techniques. The project predicts whether a person is likely to have heart disease based on various medical features such as age, cholesterol levels, blood pressure, and other factors.

## Table of Contents
- [Overview](#overview)
- [Technologies Used](#technologies-used)
- [Dataset](#dataset)
- [Setup Instructions](#setup-instructions)
- [Usage](#usage)
- [Model Training](#model-training)
- [Results](#results)
- [Contributing](#contributing)
- [License](#license)

## Overview
Heart disease is one of the leading causes of death worldwide. Early detection and prediction of heart disease can significantly improve patient outcomes. This project uses a machine learning model to predict the presence of heart disease based on several factors.

The program implements various classification algorithms, including:
- Logistic Regression
- Decision Trees
- Random Forest
- Support Vector Machines (SVM)

## Technologies Used
- **R**: Programming language used for data analysis, statistical modeling, and machine learning.
- **Machine Learning Libraries**: 
  - `caret` (for training and evaluating models)
  - `randomForest` (for Random Forest algorithm)
  - `e1071` (for SVM algorithm)
  - `rpart` (for Decision Trees)
  - `ggplot2` (for data visualization)
- **Data Science Tools**: 
  - RStudio (IDE)
  - Jupyter Notebooks (optional)

## Dataset
The dataset used for this project is the [Heart Disease UCI dataset](https://archive.ics.uci.edu/ml/datasets/Heart+Disease), which contains patient data along with the outcome of whether they have heart disease or not.

### Features
The dataset includes the following features:
- `age`: Age of the patient
- `sex`: Gender of the patient
- `cp`: Chest pain type
- `trestbps`: Resting blood pressure
- `chol`: Serum cholesterol level
- `fbs`: Fasting blood sugar
- `restecg`: Resting electrocardiographic results
- `thalach`: Maximum heart rate achieved
- `exang`: Exercise induced angina
- `oldpeak`: Depression induced by exercise
- `slope`: Slope of the peak exercise ST segment
- `ca`: Number of major vessels colored by fluoroscopy
- `thal`: Thalassemia

The target variable is:
- `target`: 0 if no heart disease, 1 if heart disease is present

## Setup Instructions
1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/Heart-Disease-Prediction.git
   cd Heart-Disease-Prediction

## Model Training

I experimented with several machine learning models to predict heart disease, including Logistic Regression, Random Forest, and Support Vector Machines (SVM). After performing **hyperparameter tuning** on the Random Forest model, the performance was optimized, achieving an **accuracy of 88%**.

I also implemented **feature importance** to identify the most significant risk factors for heart disease. The top predictors were found to be:
- Cholesterol level
- Maximum heart rate achieved
- Age
- Resting blood pressure

To increase the **interpretability** of the model, I used **SHAP values** to explain the contribution of each feature to the model's predictions, which revealed interesting insights like the significant influence of age on heart disease prediction.

Additionally, I deployed the model on a **web app** using R's **Shiny** framework, allowing users to input their health data and receive a prediction regarding their risk for heart disease.
