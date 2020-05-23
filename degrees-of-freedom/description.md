# GDP and Perceived Freedoms
_By Akkaraju H., Bohra N., Kaul S., Rafiq A._

Information School at the University of Washington, Seattle

## Introduction
It is generally thought that an economically prosperous country has a higher standard of living, lower poverty rates, and general happiness and freedom of citizens, than a country that is not as economically prosperous. However, countries with the highest GDP’s, like China for example, can have staggeringly high poverty rates due to wealth disparity, political regimes, and civil justice violations (_Economic Development and Cultural Change, University of Chicago_). In many capitalistic societies especially, higher income allows for better opportunities in education, nutrition, and protection of rights and freedoms. This puts individuals who are not as economically advantaged at an unequal stance among their fellow citizens, which can result in a lack of basic rights and living needs being met, and restricted opportunity to flourish (_Sage Journals_). Researchers in South Africa agree there is a “dynamic causal relationship between financial development, economic growth and poverty,” (_The Journal of Socioeconomics_) and the overarching purpose of our project is to explore the correlations between economic prosperity of a country with the basic rights and freedoms of its citizens. Our intent is to promote awareness of social justice in the sphere of economic development, and shed light on the impact of economic and social inequality from the broad view of countries and regimes. The hypothesis we will be testing specifically is whether countries with higher GDP’s have higher freedom rankings as defined by the Human Freedom Index.

## Datasets and Methods
The datasets we will be working on include the Human Freedom Index provided by the Cato Institute. While “Human Freedom” is a social concept, this index provides quantitative value on personal, civil and economic freedoms for 159 countries across the globe. The index uses distinct indicators of personal and economic freedom within areas like religion, identity & relationships, size of government, and more. To answer our question of whether countries with higher GDP have greater freedoms, we will have to explore datasets regarding GDP in first, second and third world countries. We will then be assessing ranks for personal freedom, human freedom, and economic freedom (Freedom Rank is the combination of them all) for every country to discover if a correlation between GDP and Freedom Rank exists.
Since the data we plan to collect on GDP and Freedom Rank are quantitative variables, we will likely start by modeling the hypothesis by using a linear regression model and evaluating the Pearson Correlation coefficient (R) to measure the strength between the two variables. We plan to use machine learning methods to analyze and predict levels of freedom rank by GDP with utilizing tools like sklearn classifiers.

## Audience
We aim to build this resource for those in the political field, as well as citizens of countries we choose to analyze. In a sense, this resource provides insight on how money affects how much power a country may have on the citizens’ personal lives. Politicians can learn from this data analysis as well to make such freedoms more accessible to citizens regardless of what economic state the country is currently in. We hope that this report will also challenge others to see how money or wealth plays value in one’s personal life and how else freedom can be attained without it.

## Final Web Resource 
The format for our final web resource will be an HTML page. It will be hosted on github pages with all our visuals and interpretations. We find this to be best way as it is something we have all done and will continue to do. It also the easiest way to put up our information.   

## Data Management Challenges
Getting data for our research question is relatively easy. The GDP of countries is easily made available. Being able to assess freedom is also easy to find as well. We can get the levels of property rights, how bad minorities have it, if there is a lot of opportunity for people to participate in government etc. However processing this data into something that can be used to answer our research question is something will most likely pose a challenge as we will need to see how a given variable can correlate with others.

## Technical Skills
If we intend to predict how free a country is depending on their GDP then its possible we would have to implement a machine learning approach to what we are trying to do. We will also probably have to utilize different approaches to making sure we have all the strongest correlations such as using a forward or backward selection approach. We will be using unsupervised machine learning techniques; this may pose a challenge as we will not know whether the results that we will have produced will be indicative of what happens in the real world or not. We will most likely be using the sklearn library to implement our machine learning approaches. Grid search will also be a key contributor to finding the best features for our implementation. From here we will utilize pipelines to normalize our features which we will then assess how accurate our machine learning model was.

## Modeling Approach
To find the best variables in our data set we would probably have to use forward selection with a linear approach using OLS. The variables with the highest p-values will be the ones that we use. We will most likely be using the sklearn library to implement our machine learning approaches. Grid search will also be a key contributor to finding the best features for our implementation. From here will utilize pipelines to normalize our features which we will then assess how accurate our machine learning model was.
Anticipated Challenges
One challenge that will definitely come up is whether we are effectively processing our data. It could be that a linear model approach may not be a very accurate way of modeling our data. Also it could be that we have data leakage which would be hard to deal with for sure. Once we assess our machine learning model our accuracy could be way off which means their could be something wrong in any one of our steps. So being able to figure out what went wrong and where as well as how to solve that problem will definitely not be easy.

## Works Cited
* Beresford, Peter, and David Green. “Income and Wealth: An Opportunity to Reassess the UK Poverty Debate.” Critical Social Policy, vol. 16, no. 46, Feb. 1996, pp. 95–109, doi:10.1177/026101839601604605.
* Fan, et. al. “Reforms, Investment, and Poverty in Rural China” University of Chicago Journal of Economic Development and Change, University of Chicago, Jan. 2006.
* “Finance-Growth-Poverty Nexus in South Africa: A Dynamic Causality Linkage.” NeuroImage, Academic Press, 24 Dec. 2008.



