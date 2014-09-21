Contents
Data analysis of mtcars dataset	1
Subtitle    : Comparing any two features and using the insight to score the car	1
Author      : Deepak	1
Introduction:	1
Pre requisites to run this application:	2
Design approach	2
Implementation	3
Summary	3

 



Data analysis of mtcars dataset
Subtitle    : Comparing any two features and using the insight to score the car
Author      : Deepak 
 
Introduction:
The mtcars dataset has information regarding the following features of a car
- Mileage:  mpg  
- Number of Cylinders: cyl
- Engine Displacement: disp
- Engine horse power: hp
- Drat : drat
- Car weight: wt
- Acceleration: qsec
- Transmission: am
- Gear box speeds: gear
This dataset can be used to make a purchasing decision. A car purchase can depend on many factors, but can be broadly categorized into 
•	Utility
•	Commute
•	Leisure
So for each type of purchase decision , each of the feature will get different weights e.g. for a utility vehicle engine horse  power will get higher weight, for a commuter vehicle mileage will get higher weight and for leisure car acceleration will get higher weight in decision making.
This objective approach will help in narrowing down the list of models to choose from.
Pre requisites to run this application:
•	Mtcars data set which is part of the R package
•	install.packages("shiny")

•	install.packages(“ggplot2”)
Design approach
This application takes a two steps approach to help the buyer in making a buying decision.
•	Step 1 : Visualize the correlation between 2 features, the features has been split into two subsets
o	X axis plots features which are discrete in nature  e.g. Transmission , Number of gears etc
o	Y axis plots features which are continuous in nature e.g. Mileage (mpg) , Horsepower
Users can see a combination of features to see if the features are correlated e.g. Number of Cylinders and Mileage. Intuitively these features are inversely related, but a look at the data will either validate or invalidate the assumption. 
•	Step 2: Arrive at a score based on weights assigned to different features.
Taking a simplistic scoring approach 
o	(Feature value X Feature weight) will help in arriving at a scaled up value of the important feature, whereas a feature which has lower weight will contribute less to the overall score.
o	Sum of the above product for the entire feature will give a single number.
Once a singular value is calculated based on the weight assigned to each feature, an objective purchase decision can be taken.
Implementation

Interaction of features
Qplot function from ggplot2 package is used to show the interaction between the features across models. The user can dynamically see different pairs of combination across models.Based on this analysis, a  mental  picture can be formed about the weights for different features.
Assigning weights to features
A helper function rankcars is created to calculate the score, the api is defined as follows
Input arguments: 
mtcars dataset
User weights for different features
Output argument:
A data frame with the car scores
Implementation logic
Score = sum of (feature value X feature weight)
Qplot function from ggplot2 package is used to show the scores for all the car models. Users can dynamically alter the weights and see the scores across models.
Summary
The tool can provide an objective evaluation of different car models before making the purchasing decision.
