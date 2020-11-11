# Adult Income Data Analysis
 Analyzed Adult income data to perform exploratory data analysis and predictive classification of data.

## INTRODUCTION:
This project analyzes US census data to perform a predictive classification of data.
The project has the following stages:
•	Data cleaning and preprocessing
•	Predictive Modelling
The final goal of the project is to build a model that can predict whether the salary of an individual in the United states is greater or less than $50000 a year. The prediction will be based on several factors like their age, occupation, gender, education, race etc.

## PROBLEM STATEMENT:
There are different opinions about what are the major factor that contribute towards high earnings of people in the US, but there is no definite answer to it till now. High percentage of people feel that education has a very significant impact on the income level whereas there are others who feel capital gains can lead to higher income generation. Finding a definite answer for this will help solve the problem of problem of income inequality which has been of  great  concern in  the  recent  years.

The internal factors like Marital Status of the citizen can also affect individual’s salary, same way his relationship in the family and the gender. We all know about the gender bias that exists in the industry and a person who is a husband might earn more money than a person who is a wife. The race of a person might also affect the money he earns however there is a chance that it might not affect his salary at all. Since race is not something that is considered as a parameter for a job, we will still take it into account to rule out any possibility of any kind of bias that might exist for a race.

This project aims to conduct a thorough analysis to find out the factors that contribute majorly in improving an individual’s income. This information can be used by the government to focus on specific areas that need improvement which will significantly improve the income levels of the people.

## PRACTICAL USE OF PREDICTION ANALYSIS:
Let us suppose that the data mining results indicate that people with higher the number of years of education have income higher than 50000$ a year, it means that the government needs to focus on making higher education more accessible and affordable to people so that they can earn higher wages per year. 
Similarly, there might be certain public or private sectors where people are underpaid, government can focus on increasing the pay scale of those sectors.


## DATA DESCRIPTION: 
U.S. census data is taken from the UCI (University of California at Irvine) Machine Learning Repository. The dataset includes 32560 records and 15 attributes. Attributes are divided into 14 independent variables and 1 dependent variable.

The 14 independent variables comprise of 8 categorical and 6 continuous variables 

### Dataset Description
![Dataset Description](https://github.com/Abhilasha13/adult_income/blob/main/Dataset_Description.png)

## DATA PREPROCESSING:
As discussed in the previous section there were some issues with the dataset which was fixed by preprocessing activities that are explained below.

### NEED FOR PREPROCESSING:
1.	The dataset contains some null values that we should remove.
2.	The levels of categorical variables are high for most variables and this can lead to unnecessary complication in data analysis and might cause overfitting which means we need to create lesser levels of these variables for easy interpretation and better results. 
3.	The continuous variables have a lot of outliers which is why we decided to group these values into categories and reduce the number of outliers.
4.	Attributes like capital gain and capital loss had anomalies like large number of zero values which led to high skewness.
5.	The data set was not balanced, the number of rows with income less than $50K was 24.08% whereas the number of rows with income greater than $50K was 75.91%

### PREPROCESSING ACTIVITIES AND RESULTS:
1. The dataset contains some null values which were removed when the dataset was imported, the number of records reduced from 32,560 to 30,161. Column names were assigned to each column as the predefined column names were junk values.

2. Levels of categorical variable like Education, marital status and Occupation were reduced. 
The Bar graphs of few variables after preprocessing are shown below:

### Figure: education vs income_above_50k
![education vs income_above_50k](https://github.com/Abhilasha13/adult_income/blob/main/education_vs_income_above_50k.png)

### Figure: occupation vs income_above_50k
![occupation vs income_above_50k](https://github.com/Abhilasha13/adult_income/blob/main/occupation_vs_income_above_50k.png)

## Usage Instructions:

### Implementation in R

```
Abhilasha-MBP-2:~ abhilasha$ Rscript Adult_Dataset.R

Attaching package: ‘dplyr’

The following objects are masked from ‘package:plyr’:

    arrange, count, desc, failwith, id, mutate, rename, summarise,
    summarize

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

      X39         State.gov             X77516         Bachelors        
 Min.   :17.00   Length:32560       Min.   :  12285   Length:32560      
 1st Qu.:28.00   Class :character   1st Qu.: 117832   Class :character  
 Median :37.00   Mode  :character   Median : 178363   Mode  :character  
 Mean   :38.58                      Mean   : 189782                     
 3rd Qu.:48.00                      3rd Qu.: 237054                     
 Max.   :90.00                      Max.   :1484705                     
      X13        Never.married      Adm.clerical       Not.in.family     
 Min.   : 1.00   Length:32560       Length:32560       Length:32560      
 1st Qu.: 9.00   Class :character   Class :character   Class :character  
 Median :10.00   Mode  :character   Mode  :character   Mode  :character  
 Mean   :10.08                                                           
 3rd Qu.:12.00                                                           
 Max.   :16.00                                                           
    White               Male               X2174             X0         
 Length:32560       Length:32560       Min.   :    0   Min.   :   0.00  
 Class :character   Class :character   1st Qu.:    0   1st Qu.:   0.00  
 Mode  :character   Mode  :character   Median :    0   Median :   0.00  
                                       Mean   : 1078   Mean   :  87.31  
                                       3rd Qu.:    0   3rd Qu.:   0.00  
                                       Max.   :99999   Max.   :4356.00  
      X40        United.States          YES           
 Min.   : 1.00   Length:32560       Length:32560      
 1st Qu.:40.00   Class :character   Class :character  
 Median :40.00   Mode  :character   Mode  :character  
 Mean   :40.44                                        
 3rd Qu.:45.00                                        
 Max.   :99.00                                        
      Government          Private        no_salary     Self_emp_inc 
            4288            22286               14             1074 
Self_emp_not_inc 
            2499 
       Graduates    PostGraduates  School_Students           Others 
            1627              375            13581            14578 
Covariate *workclass_category* with factor levels:
[1] " Government"      " Private"         "no_salary"        "Self_emp_inc"    
[5] "Self_emp_not_inc"
Covariate *Education_category* with factor levels:
[1] " Graduates"       " PostGraduates"   " School_Students" "Others"          
  Number_of_years_of_Education Capital_Gain Capital_loss Salary1
1                           13            0            0     YES
2                            9            0            0     YES
3                            7            0            0     YES
4                           13            0            0     YES
5                           14            0            0     YES
6                            5            0            0     YES
  Education_category         Married_Status          Occupation_type
1             Others                Married               Employment
2    School_Students            Prof-school  Business_related_fields
3    School_Students                Married  Business_related_fields
4             Others                Married               Employment
5          Graduates                Married               Employment
6    School_Students  Married_spouse_absent                   Others
  Family_Relationship     Age_level
1             Husband  Bet_30_to_50
2              Others  Bet_30_to_50
3             Husband  Bet_50_to_60
4                Wife  Less_than_30
5                Wife  Bet_30_to_50
6              Others  Bet_30_to_50
 Factor w/ 2 levels " NO"," YES": 2 2 1 1 1 2 1 2 2 2 ...

Call:
C5.0.default(x = train[, predictors], y = train$Salary1)


C5.0 [Release 2.07 GPL Edition]  	Wed Nov 11 00:39:39 2020
-------------------------------

Class specified by attribute `outcome'

Read 24128 cases (9 attributes) from undefined.data

Decision tree:

Capital_Gain > 6849: NO (1052/12)
Capital_Gain <= 6849:
:...Family_Relationship in {Others,Own_child,Unmarried}:
    :...Capital_loss > 2206:
    :   :...Capital_loss <= 2352: YES (37/14)
    :   :   Capital_loss > 2352: NO (36/6)
    :   Capital_loss <= 2206:
    :   :...Capital_Gain > 4650:
    :       :...Capital_Gain <= 4787: NO (17)
    :       :   Capital_Gain > 4787: YES (68/8)
    :       Capital_Gain <= 4650:
    :       :...Capital_loss > 1573: YES (254/2)
    :           Capital_loss <= 1573:
    :           :...Capital_loss <= 1411: YES (12353/603)
    :               Capital_loss > 1411:
    :               :...Capital_loss <= 1504: YES (11)
    :                   Capital_loss > 1504: NO (19)
    Family_Relationship in {Husband,Wife}:
    :...Capital_Gain > 5060: NO (89/3)
        Capital_Gain <= 5060:
        :...Capital_loss > 1762:
            :...Capital_loss <= 1980: NO (442/12)
            :   Capital_loss > 1980:
            :   :...Capital_loss <= 2206: YES (61/4)
            :       Capital_loss > 2206: NO (62/14)
            Capital_loss <= 1762:
            :...Number_of_years_of_Education > 12:
                :...Capital_Gain > 3103: YES (42/7)
                :   Capital_Gain <= 3103:
                :   :...Occupation_type in {Employment,
                :       :                   Military_and_armed}: NO (1800/512)
                :       Occupation_type = Others: YES (39/10)
                :       Occupation_type in {Business_related_fields,Industry}:
                :       :...Education_category in {Graduates,School_Students,
                :           :                      Others}: NO (635/272)
                :           Education_category = PostGraduates: YES (4)
                Number_of_years_of_Education <= 12:
                :...Capital_loss > 1504: YES (76)
                    Capital_loss <= 1504:
                    :...Capital_Gain > 4416: YES (46)
                        Capital_Gain <= 4416:
                        :...Capital_Gain > 4101: NO (42/7)
                            Capital_Gain <= 4101:
                            :...Capital_Gain > 3103: YES (125)
                                Capital_Gain <= 3103:
                                :...Capital_Gain > 2993: NO (48/2)
                                    Capital_Gain <= 2993:
                                    :...Capital_Gain > 594: YES (99)
                                        Capital_Gain <= 594: [S1]

SubTree [S1]

Occupation_type in {Business_related_fields,Industry,
:                   Others}: YES (4896/1202)
Occupation_type in {Employment,Military_and_armed}:
:...Education_category in {Graduates,PostGraduates,
    :                      School_Students}: YES (813/291)
    Education_category = Others:
    :...Age_level in {Bet_30_to_50,Bet_50_to_60}: NO (749/331)
        Age_level in {Bet_60_to_80,Less_than_30,More_than_80,
                      Others}: YES (213/63)


Evaluation on training data (24128 cases):

	    Decision Tree   
	  ----------------  
	  Size      Errors  

	    28 3375(14.0%)   <<


	   (a)   (b)    <-classified as
	  ----  ----
	  3820  2204    (a): class NO
	  1171 16933    (b): class YES


	Attribute usage:

	100.00%	Capital_Gain
	 95.64%	Family_Relationship
	 95.27%	Capital_loss
	 39.90%	Number_of_years_of_Education
	 37.92%	Occupation_type
	 10.00%	Education_category
	  3.99%	Age_level


Time: 0.1 secs

   Number_of_years_of_Education Capital_Gain Capital_loss Salary1
8                            14        14084            0      NO
9                            13         5178            0      NO
13                           12            0            0     YES
15                            9            0            0     YES
20                            9            0            0     YES
23                            9            0            0     YES
   Education_category Married_Status          Occupation_type
8           Graduates     Assoc-acdm               Employment
9              Others        Married               Employment
13             Others      Assoc-voc  Business_related_fields
15    School_Students   Some-college  Business_related_fields
20    School_Students     Assoc-acdm                   Others
23    School_Students   Some-college                 Industry
   Family_Relationship     Age_level random_adult_pred
8               Others  Bet_30_to_50                NO
9              Husband  Bet_30_to_50                NO
13              Others  Bet_30_to_50               YES
15           Own_child  Less_than_30               YES
20           Unmarried  Bet_50_to_60               YES
23           Unmarried  Bet_50_to_60               YES
[1] 0.8584452
Abhilasha-MBP-2:~ abhilasha$ 
```

### Implementation in Spark

Use Jupyter notebook to run the code.


### Implementation in Python

Use Jupyter notebook to run the code.
