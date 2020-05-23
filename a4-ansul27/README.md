# Dengue Modeling

Hi! This project was worked on by Nicole and Ansul. 

# Data Preperation:

In order to make predictions, we first wanted to understand how the data related to each other. We created a few visualizations and modeled our data further (in addition to a3's statistical modeling). We had to re-wrangle our data and deal with missing values, drop na columns (and replace with 0). We also had to change city to a numerical value, so it could be calculated as a float or int. 

# Feature Engineering:

We found that environmental variables play a large role in dengue cases, and added a new feature: high rainfall. We did this to understand whether precipitation has a large impact on dengue or not - and it does! Lower rainfall is correlated with higher accounts of Dengue in both Iquitos and San Juan.

# Feature Selection:

We used Select Percentile and Variance through sklearn to select features. The different variances would then tell us which features to select automatically - thank you sklearn!

# Modeling: 
We then jumped straight into modeling our data. We split our data into a target column and a features dataset, and created it into a pandas dataframe to use it. 

The first algorithm of choice was *Decision Tree*.  

The second algorithm of choice was *KNN Regressor*.

The third algorithm of choice was *Random Forest*.

Lastly, we used *Bagging Regressor*.

We had to train our dataset with the given sets, scale our data, tune the parameters, and cross validate for all these algorithms. We listed grid search results and accuracy scores, and even Mean Absolute Errors.

# Best Predictions
Our best prediction was with Decision Tree, which is under the submission of submission_DT. We also submitted submission_KN, but DT had a better score of 29. Thanks for reading!