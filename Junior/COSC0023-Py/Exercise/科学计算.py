#!/usr/bin/env python
# coding: utf-8

# In[1]:


import scipy
import numpy as np


# ## 第一题

# In[3]:


A = np.mat([[1,3,5],[2,5,1],[2,3,8]])  
b=np.array([10,8,3]).T
r = np.linalg.solve(A,b)
print(r)


# ## 第二题

# In[6]:


np.linalg.det(A)


# ## 第三题

# In[9]:


a,b=np.linalg.eig(A)
print("特征值",a)
print("特征向量",b)


# ## 第四题

# In[11]:


U,sigma,Vt = np.linalg.svd(A)
print("左奇异矩阵U",U)
print("对角矩阵",sigma)
print("右奇异矩阵",Vt)


# ## 第五题

# In[15]:


import matplotlib.pyplot as plt
from scipy.stats import norm


# In[37]:


x = np.linspace(norm.ppf(0.01),norm.ppf(0.99), 1000)
y = np.exp(-((x - 0)**2)/(2*1**2)) / (1 * np.sqrt(2*np.pi))


# In[38]:


plt.plot(x,y,"r-")
plt.legend(['norm pdf'])


# In[ ]:




