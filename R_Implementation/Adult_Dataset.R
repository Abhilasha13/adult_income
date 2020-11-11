library(plyr)
library(dplyr)
library(e1071)



adult_details <- read.csv('adult_details.data', na.strings=' NA')
summary(adult_details)
colnames(adult_details) <-c("Age","Workclass","Final_Weight","Education","Number_of_years_of_Education","Marital_status","Occupation","Relationship_in_Family","Race","Sex","Capital_Gain","Capital_loss","Hours_per_week","Native_Country","Salary1")

adult_data_incomplete <- (adult_details[!complete.cases(adult_details),])
adult_data_complete <- (adult_details[complete.cases(adult_details),])
levels_factors <- function(mydata) {      
	col_names <- names(mydata)      
	for (i in 1:length(col_names)) { 
 if (is.factor(mydata[, col_names[i]])) {
 message(noquote(paste("Covariate ", "*",
 col_names[i], "*",
 " with factor levels:",
 sep = ""))) 
 print(levels(mydata[, col_names[i]]))}}}

levels_factors(adult_data_complete)

# Binning the columns
Government <- c(" Federal-gov"," Local-gov"," State-gov")
Private <- c(" Private")
Self_emp_inc <- c(" Self-emp-inc")
Self_emp_not_inc <- c(" Self-emp-not-inc")
no_salary <- c(" Without-pay"," Never-worked")

adult_details_complete <- adult_data_complete

adult_details_complete <- mutate(adult_details_complete, workclass_category = ifelse(Workclass %in% Government, " Government", ifelse(Workclass %in% Private, " Private", ifelse(Workclass %in% Self_emp_inc, "Self_emp_inc", ifelse(Workclass %in% Self_emp_not_inc, "Self_emp_not_inc", ifelse(Workclass %in% no_salary, "no_salary", "others"))))))

adult_details_complete$workclass_category <- factor(adult_details_complete$workclass_category, ordered = FALSE)
summary(adult_details_complete$workclass_category)

school_students <- c(" Preschool"," 1st-4th"," 5th-6th"," 7th-8th"," 9th"," 10th"," 11th"," 12th"," HS-grad")
Undergraduates <- c("Bachelors")
Graduates <- c(" Masters")
PostGraduates <- c(" Doctorate")
Others <- c(" Assoc-voc"," Prof-school"," Some-college"," Assoc-acdm")

adult_details_complete <- mutate(adult_details_complete, Education_category = ifelse(Education %in% school_students, " School_Students", ifelse(Education %in% Undergraduates, " Undergraduates",ifelse(Education %in% Graduates, " Graduates",ifelse(Education %in% PostGraduates, " PostGraduates", "Others")))))

adult_details_complete$Education_category <- factor(adult_details_complete$Education_category, ordered = FALSE)
summary(adult_details_complete$Education_category)

levels_factors(adult_details_complete)

Married <- c(" Married-AF-spouse"," Married-civ-spouse")
Divorced_or_seperated <- c("Divorced", "Separated")
Widowed <- c(" Widowed")
Married_spouse_absent <- (" Married-spouse-absent") 

adult_details_complete <- mutate(adult_details_complete, Married_Status = ifelse(Marital_status %in% Married, " Married", ifelse(Marital_status %in% Divorced_or_seperated, " Divorced_or_seperated", ifelse(Marital_status %in% Widowed, " Widowed", ifelse(Marital_status %in% Married_spouse_absent, " Married_spouse_absent", Others)))))


adult_details_complete$Married_Status <- factor(adult_details_complete$Married_Status, ordered = FALSE)
Business_related_fields <- c(" Transport-moving"," Farming-fishing"," Sales"," Handlers-cleaners"," Craft-repair")
Employment <- c(" Exec-managerial"," Adm-clerical"," Prof-specialty")
Military_and_armed <-	c(" Armed-Forces"," Protective-serv")
Industry <-	c(" Machine-op-inspct"," Tech-support")
Others <- c(" Other-service"," Priv-house-serv")

 
adult_details_complete <- mutate(adult_details_complete, Occupation_type = ifelse(Occupation %in% Business_related_fields, " Business_related_fields",ifelse(Occupation %in% Employment, " Employment",ifelse(Occupation %in% Military_and_armed, " Military_and_armed", ifelse(Occupation %in% Industry, " Industry", " Others")))))

adult_details_complete$Occupation_type <- factor(adult_details_complete$Occupation_type, ordered = FALSE)

Husband <- c(" Husband")
Wife <- c(" Wife")
Own_child <- c(" Own-child")
Unmarried <- c(" Unmarried")
Others <- c(" Not-in-family"," Other-relative")

adult_details_complete <- mutate(adult_details_complete, Family_Relationship = ifelse(Relationship_in_Family %in% Husband, " Husband",ifelse(Relationship_in_Family %in% Wife, " Wife",ifelse(Relationship_in_Family %in% Own_child, " Own_child",ifelse(Relationship_in_Family %in% Unmarried, " Unmarried", " Others")))))
 
adult_details_complete$Family_Relationship <- factor(adult_details_complete$Family_Relationship, ordered = FALSE)

Business_related_fields <- c(" Transport-moving"," Farming-fishing"," Sales"," Handlers-cleaners"," Craft-repair")
Employment <- c(" Exec-managerial"," Adm-clerical"," Prof-specialty")
Military_and_armed <-	c(" Armed-Forces"," Protective-serv")
Industry <-	c(" Machine-op-inspct"," Tech-support")
Others <- c(" Other-service"," Priv-house-serv")
 
adult_details_complete <- mutate(adult_details_complete,Occupation_type = ifelse(Occupation %in% Business_related_fields, " Business_related_fields",ifelse(Occupation %in% Employment, " Employment",ifelse(Occupation %in% Military_and_armed, " Military_and_armed", ifelse(Occupation %in% Industry, " Industry", " Others")))))

adult_details_complete$Occupation_type <- factor(adult_details_complete$Occupation_type, ordered = FALSE)

High_income_Economies <- c(" United-States"," England"," Canada"," Germany"," Poland"," Taiwan"," Portugal"," France"," Italy"," Japan"," Trinadad&Tobago"," Greece"," Hong"," Holand-Netherlands")
Upper_middle_income_Economies <- c(" Cuba"," Mexico"," Jamaica"," Iran"," Thailand"," Ecuador","China"," Peru"," Hungary"," Ireland")
Lower_middle_income_Economies<- c(" India	"," Honduras"," Philippines"," Guatemala"," Nicaragua"," Vietnam")
Low_income_Economies <- c(" Haiti")
Others <- c(" Columbia"," Cambodia"," Laos"," Dominican-Republic"," El-Salvador"," South"," Yugoslavia"," Outlying-US(Guam-USVI-etc)"," Scotland")
 
 
adult_details_complete <- mutate(adult_details_complete, Native_Country_Economies = ifelse(Native_Country %in% Upper_middle_income_Economies, " Upper_middle_income_Economies", ifelse(Native_Country %in% Lower_middle_income_Economies, " Lower_middle_income_Economies", ifelse(Native_Country %in% High_income_Economies, " High_income_Economies", ifelse(Native_Country %in% Low_income_Economies, " Low_income_Economies", " Others")))))

adult_details_complete$Native_Country_Economies <- factor(adult_details_complete$Native_Country_Economies, ordered = FALSE)


Less_than_30 <- c(17,18,19,20,21,22,23,24,25,26,27,28,29,30)
Bet_30_to_50 <- c(31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50)
Bet_50_to_60 <- c(51,52,53,54,55,56,57,58,59,60)
Bet_60_to_80 <- c(61,62,63,64,65,66.67,68,69.70,71,72,73,74,75,76,77,78,79,80)
More_than_80 <- c(81,82,83,84,85,86,87,88,89,90)

adult_details_complete <- mutate(adult_details_complete,Age_level = ifelse(Age %in% Less_than_30, " Less_than_30", ifelse(Age %in% Bet_30_to_50, " Bet_30_to_50", ifelse(Age %in% Bet_50_to_60, " Bet_50_to_60", ifelse(Age %in% Bet_60_to_80, " Bet_60_to_80", ifelse(Age %in% More_than_80, " More_than_80", " Others"))))))

adult_details_complete$Age_level <- factor(adult_details_complete$Age_level, ordered = FALSE)

adult_comp_process <- adult_details_complete

adult_comp_reduced = subset(adult_comp_process, select = -c(Marital_status, Workclass, Education, Occupation, Native_Country, Relationship_in_Family,Age))


adult_comp_feature <- subset(adult_comp_reduced, select = -c(Final_Weight, Race, Native_Country_Economies, workclass_category, Sex, Hours_per_week))
head(adult_comp_feature)

# Splitting in training and test
library(e1071)
set.seed(545)
sample_size = floor(0.8 * nrow(adult_comp_feature))
training_adult = sample(nrow(adult_comp_feature), size = sample_size)
train <- adult_comp_feature[training_adult,]
test <- adult_comp_feature[-training_adult,]


#Descision Tree Algorithm

library(C50)


predictors <- c('Number_of_years_of_Education', 'Capital_Gain', 'Capital_loss', 'Education_category', 'Married_Status', 'Occupation_type', 'Family_Relationship','Age_level')
train$Salary1 <- as.factor(train$Salary1)
str(train$Salary1)
model <- C5.0.default(x = train[,predictors], y = train$Salary1)
summary(model)

random_adult_pred <- predict(model, newdata = test)
adult_evaluation <- cbind(test, random_adult_pred)
head(adult_evaluation)

adult_evaluation$correct <- ifelse(adult_evaluation$Salary1 == adult_evaluation$random_adult_pred,1,0)
sum(adult_evaluation$correct)/nrow(adult_evaluation)






