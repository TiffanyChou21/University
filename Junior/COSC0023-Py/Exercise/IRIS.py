#!/usr/bin/env python
# coding: utf-8

# In[2]:


import numpy as np
import pandas as pd
import warnings
warnings.filterwarnings('ignore')
pd.set_option('display.max_rows',None)
iris1=pd.read_csv('iris.csv',names=['slength','swidth','plength','pwidth','label'])
iris=np.loadtxt('iris.csv',delimiter=",")
iris


# In[21]:


iris1.drop_duplicates()   #不是很理解每列排序去重，所以总体和对于每列的单独去重都做了    #本行全部去重


# In[4]:


iris1.sort_index(by='slength')    #排序


# In[5]:


iris1.drop_duplicates(['slength'])#去重第一列


# In[6]:


iris1.sort_index(by='swidth')#排序第二列


# In[7]:


iris1.drop_duplicates(['swidth'])#去重第二列


# In[8]:


iris1.sort_index(by='plength')#排序第三列


# In[9]:


iris1.drop_duplicates(['plength'])#去重第三列


# In[10]:


iris1.sort_index(by='pwidth')#排序第四列


# In[11]:


iris1.drop_duplicates(['pwidth'])#去重第四列


# In[77]:


# 每列和、累积和、均值、标准差、方差、最小值、最大值
print(iris1.describe())


# In[75]:


print("每列和:\n"+str(iris1.apply(sum)))#每列和


# In[20]:


iris1.cumsum() #累计和


# In[13]:


print("均值:\n"+str(iris1.mean()))


# In[14]:


print("标准差:\n"+str(iris1.std()))


# In[80]:


print("方差:\n"+str(iris1.var()))


# In[16]:


print("最小值:\n"+str(iris1.min()))


# In[17]:


print("最大值:\n"+str(iris1.max()))


# In[ ]:




