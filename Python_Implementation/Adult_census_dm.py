#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np


# In[2]:


data = pd.read_csv("/Users/abhilashasinha/Downloads/adult.data")


# In[3]:


data.head(1)


# In[4]:


data.columns = ['age','workclass','fnlwgt', 'education', 'educationnum', 'maritalstatus', 'occupation', 'relationship','race', 'sex','capitalgain', 'capitalloss','hoursperweek','nativecountry','income']


# In[5]:


data.head()


# In[6]:


data.count()


# In[7]:


df = pd.DataFrame([data.isnull().sum(),data.isnull().sum() * 100.0/data.shape[0]]).T
df.columns =['No. of missing value', 'Percentage of missing value']
df


# In[8]:


df.count()


# In[9]:


data = data.dropna()


# In[10]:


data.age.unique()


# In[11]:


bin_age = ('0','40',np.inf)
labels_age = ('0-40', 'Above 40')
data['binned_age'] = pd.cut(data['age'], bins = bin_age, labels = labels_age, include_lowest = True)


# In[12]:


data['binned_age'].unique()


# In[13]:


data.workclass.unique()


# In[14]:


bins_dict_workclass = {' Self-emp-not-inc': 'Self-emp-not-inc', ' Private':'Private',' State-gov':'Government',
                       ' Federal-gov':'Government',' Local-gov':'Government',' Self-emp-inc':'Self-employed',' Never-worked':'No-salary',
                       ' NA':'No-salary',' Without-pay':'No-salary'}
data["binned_workclass"] = data["workclass"].replace(bins_dict_workclass)


# In[15]:


data["binned_workclass"].unique()


# In[16]:


data['education'].unique()


# In[17]:


bin_dict_education = {' Bachelors': 'College',' HS-grad':'School', ' 11th':'School', ' Masters':'College', ' 9th':'School',
       ' Some-college':'Others', ' Assoc-acdm':'Others', ' Assoc-voc':'Others', ' 7th-8th':'School',
       ' Doctorate':'College', ' Prof-school':'Others', ' 5th-6th':'School', ' 10th':'School', ' 1st-4th':'School',
       ' Preschool':'School', ' 12th':'School' }
data["binned_education"] = data["education"].replace(bin_dict_education)


# In[ ]:




