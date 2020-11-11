#!/usr/bin/env python

import pandas as pd
import numpy as np

data = pd.read_csv("./adult.data")

data.head(1)


data.columns = ['age','workclass','fnlwgt', 'education', 'educationnum', 'maritalstatus', 'occupation', 'relationship','race', 'sex','capitalgain', 'capitalloss','hoursperweek','nativecountry','income']

data.head()

data.count()

df = pd.DataFrame([data.isnull().sum(),data.isnull().sum() * 100.0/data.shape[0]]).T
df.columns =['No. of missing value', 'Percentage of missing value']
df

df.count()

data = data.dropna()

data.age.unique()

bin_age = ('0','40',np.inf)
labels_age = ('0-40', 'Above 40')
data['binned_age'] = pd.cut(data['age'], bins = bin_age, labels = labels_age, include_lowest = True)
data['binned_age'].unique()

data.workclass.unique()
bins_dict_workclass = {' Self-emp-not-inc': 'Self-emp-not-inc', ' Private':'Private',' State-gov':'Government',
                       ' Federal-gov':'Government',' Local-gov':'Government',' Self-emp-inc':'Self-employed',' Never-worked':'No-salary',
                       ' NA':'No-salary',' Without-pay':'No-salary'}
data["binned_workclass"] = data["workclass"].replace(bins_dict_workclass)

data["binned_workclass"].unique()


data['education'].unique()
bin_dict_education = {' Bachelors': 'College',' HS-grad':'School', ' 11th':'School', ' Masters':'College', ' 9th':'School',
       ' Some-college':'Others', ' Assoc-acdm':'Others', ' Assoc-voc':'Others', ' 7th-8th':'School',
       ' Doctorate':'College', ' Prof-school':'Others', ' 5th-6th':'School', ' 10th':'School', ' 1st-4th':'School',
       ' Preschool':'School', ' 12th':'School' }
data["binned_education"] = data["education"].replace(bin_dict_education)




